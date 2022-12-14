//
//  BoardReusableView.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/15.
//

import Then
import SnapKit
import UIKit

final class BoardCollectionReusableView: UICollectionReusableView {
    
    private lazy var autoSlideView = AutoSlideView()
    private lazy var categoryView = CategoryView()
    
    private lazy var headerLabel = UILabel().then {
        $0.font = .systemFont(
            ofSize: 14.0,
            weight: .bold
        )
        $0.textColor = .label
        $0.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        headerLabel.text = "지금 가장 뜨거울 빡코빡코 추천🔥"
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension BoardCollectionReusableView {
    func configureLayout() {
        
        [
            autoSlideView,
            categoryView,
            headerLabel
        ].forEach { addSubview($0) }
            
        autoSlideView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(28.0)
        }
        
        categoryView.snp.makeConstraints {
            $0.top.equalTo(autoSlideView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(96.0)
        }
        
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().inset(16.0)
        }
    }
}


