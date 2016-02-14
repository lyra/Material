/*
* Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*	*	Redistributions of source code must retain the above copyright notice, this
*		list of conditions and the following disclaimer.
*
*	*	Redistributions in binary form must reproduce the above copyright notice,
*		this list of conditions and the following disclaimer in the documentation
*		and/or other materials provided with the distribution.
*
*	*	Neither the name of Material nor the names of its
*		contributors may be used to endorse or promote products derived from
*		this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

public class SearchBarView : MaterialView {
	/**
	:name:	statusBarStyle
	*/
	public var statusBarStyle: UIStatusBarStyle = UIApplication.sharedApplication().statusBarStyle {
		didSet {
			UIApplication.sharedApplication().statusBarStyle = statusBarStyle
		}
	}
	
	/// Wrapper around grid.contentInset.
	public var contentInset: UIEdgeInsets = UIEdgeInsetsZero {
		didSet {
			grid.contentInset = contentInset
		}
	}
	
	/// Wrapper around grid.spacing.
	public var spacing: CGFloat = 0 {
		didSet {
			grid.spacing = spacing
		}
	}
	
	/// SearchBar textField.
	public private(set) lazy var textField: TextField = TextField()
	
	/**
	:name:	leftControls
	*/
	public var leftControls: Array<UIControl>? {
		didSet {
			reloadView()
		}
	}
	
	/**
	:name:	rightControls
	*/
	public var rightControls: Array<UIControl>? {
		didSet {
			reloadView()
		}
	}
	
	/**
	:name:	init
	*/
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	/**
	:name:	init
	*/
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	/**
	:name:	init
	*/
	public convenience init() {
		self.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 70))
	}
	
	/**
	:name:	init
	*/
	public convenience init?(leftControls: Array<UIControl>? = nil, rightControls: Array<UIControl>? = nil) {
		self.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 70))
		prepareProperties(leftControls, rightControls: rightControls)
	}
	
	public override func didMoveToSuperview() {
		super.didMoveToSuperview()
		reloadView()
	}
	
	/**
	:name:	reloadView
	*/
	public func reloadView() {
		// clear constraints so new ones do not conflict
		removeConstraints(constraints)
		for v in subviews {
			v.removeFromSuperview()
		}
		
		grid.views = []
		textField.grid.columns = grid.columns
		
		// leftControls
		if let v: Array<UIControl> = leftControls {
			if 0 < v.count {
				
				// Size of single grid column.
				let g: CGFloat = width / CGFloat(grid.columns)
				
				for c in v {
					var w: CGFloat = c.frame.width
					if 0 == w {
						if let b: UIButton = c as? UIButton {
							b.contentEdgeInsets = UIEdgeInsetsZero
						}
						w = c.intrinsicContentSize().width
					}
					
					c.grid.columns = Int(ceil(w / g))
					textField.grid.columns -= c.grid.columns
					
					addSubview(c)
					grid.views?.append(c)
				}
			}
		}
		
		addSubview(textField)
		grid.views?.append(textField)
		
		// rightControls
		if let v: Array<UIControl> = rightControls {
			if 0 < v.count {
				
				// Size of single grid column.
				let g: CGFloat = width / CGFloat(grid.columns)
				
				for c in v {
					var w: CGFloat = c.frame.width
					if 0 == w {
						if let b: UIButton = c as? UIButton {
							b.contentEdgeInsets = UIEdgeInsetsZero
						}
						w = c.intrinsicContentSize().width
					}
					
					c.grid.columns = Int(ceil(w / g))
					textField.grid.columns -= c.grid.columns
					
					addSubview(c)
					grid.views?.append(c)
				}
			}
		}
		
		grid.reloadLayout()
	}
	
	/**
	:name:	prepareView
	*/
	public override func prepareView() {
		super.prepareView()
		grid.columns = 10
		grid.spacing = 8
		grid.contentInset.top = 28
		grid.contentInset.left = 8
		grid.contentInset.bottom = 8
		grid.contentInset.right = 8
		depth = .Depth1
		prepareTextField()
	}
	
	/**
	:name:	prepareProperties
	*/
	private func prepareProperties(leftControls: Array<UIControl>?, rightControls: Array<UIControl>?) {
		self.leftControls = leftControls
		self.rightControls = rightControls
	}
	
	private func prepareTextField() {
		textField.backgroundColor = MaterialColor.clear
	}
}