Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD95DC36014
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3eS/g2d5U79K2xiecyTJvCVSicgBHtdYlMrWZ4f2LAA=; b=unjod/gvBpGfC1
	HRwTVgJ3X85wU2DbVapsw173YEclyuHPB+jqJ78pqdE2ntRrvlheUwznkhSXJUrBHR8lapzylOMaG
	UljiLUJHfXWI0xXMTUQUZ7fGbCbQLlcP7+rVSoac2BbC5IQykilTeXuykaAxMRa/eP8h3I0AdfzoG
	tBkg0IcKR5oNPjjsbvU7/M71sOGOIMudGeKZV+jTNnLhQopM/+kICr0PsBatR0bX/f99O3og+Cpwy
	k7IvApYRje3oZVT1jRScybzNav1FizYGibV2ezQlJXcf68txps20TaPFFH9fq76SbdkF8e2DguNcf
	LvMrYKV16PY7zI/aZEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztvB-00000005bPS-3Nzb;
	Wed, 02 Apr 2025 08:58:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztuE-00000005bBo-0sdI
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 08:57:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2243803b776so61628955ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584225; x=1744189025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2mbatOTqN6UfvBI6qk+3sG7bqlcGJu5b7iy5tWOUeU=;
        b=nRbOTFnVHT/lGcHNDHqYwSLi4u+iMgvjpANqzQppuQlm+sW/q6dMEwZeRuBNeptERK
         wYCtES5/Q9C9sHWTecSXxwSuPELD/dHRwDTjYOCq+mzwJLqqT/KvWKyttW9Biv+rMzEZ
         FBztUYKifBP6mg/qlKKTG9ZoAKYmA8raqUccRxe25HNzZnVWXYOODoiN5ACyiFP3x+cX
         JATCiuNl8b8tyCtJjedPGBDPCtNVkeqtjZuyqm7ihBBQDExhW1e2ie58K4ARJIW7uLM1
         kSLrcpwMFuRahRocFIGA1MfkWKXYngMqrgl1UPxthCIrtIarZrGz+TASxgiAaPD9es6U
         6t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584225; x=1744189025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2mbatOTqN6UfvBI6qk+3sG7bqlcGJu5b7iy5tWOUeU=;
        b=QxhMwvlZL+T68tmDELKZKKZlt7OKRtyo+weadEEEly3xmQVMboonH+fs0IdzVbLBIC
         0O3xHZ2170UuU0mj4oAJT4GxnOQAWTmlaveHHYqLq5FwFraOtQ+RUprrKiSq5RsNmlA5
         oLywiEw2qXEZiZhn4DAht0uE7Ih69IGviyb7+Uww+iJ5PnAczoQ8EX98TmdEbTZMlGcl
         uyeMW6u/kM8QVM1Sc5HiEHc7UPsDbB3Ykx1/AUmGPE1CxGcKPztVPQrZgUl4T08w42mc
         dxh606EBhwUR/WWgET7XiD9MI3tjxTyfnBmEp3EVPZHtidkpJXJHbul8eQAzw3tiPd7E
         7ekg==
X-Forwarded-Encrypted: i=1; AJvYcCUfQDmGH9IFYomErAUxIsGeiPfl8LM1N9Mp4nIyb+LTRyhZ3mP2t0Jwm932ZZ8xqV5Qx12iMC/q9G0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwybQHKysQcRtWitggiJCqXAWK32tdfDWw08Ib/JsbyVM9DrlVz
	yaF2esaiYgSbXPTso3E9FVFi+jLHyqmuOsZ2dmqGVlbb2dHYje6H
X-Gm-Gg: ASbGncsIVDNmKb+d3BejVF1oErvOw9ypLTylXPVH4qjczPxXbhMAgjrvibiZaOM8Bk+
	Reyemx0dPTGyYeDLAoSgiKU7iqpbbBERwspa9sV8MDUT6Ix3U8ouZVCY2TW67eTFp2GJHtYK6qS
	VWqfJ3bGns71W99pdaFGuyDQmzxAtjksokjsfwvrIJbrh5SCTeMj1app4otBAcNKIJrYsWd7r5e
	tfz6sECUQMMdCkumWjvXuGYK8gHD2CrZ/AQWhIsR5mBHScHqJf+ttVhV40J/QZ4n03F+/Uoh/qz
	3qbzjXpO918oKh9MtMcnVGrLkYvH/BhmM/ghWOjCcKXzD89NUrwAPZigCgDALBzNfyhO
X-Google-Smtp-Source: AGHT+IEXNQJWNGxGPFphNpnCitbqmQow7c6fvYmWsF6o1jzldCLf2QxqB7RbaqQ5StpVjcJvAXDsBQ==
X-Received: by 2002:a17:902:ce84:b0:224:5a8:ba2c with SMTP id d9443c01a7336-2296c87eb4bmr15812525ad.52.1743584225535;
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22449sm10393367b3a.49.2025.04.02.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E07F480531;
	Wed,  2 Apr 2025 17:06:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
Date: Wed,  2 Apr 2025 16:51:26 +0800
Message-Id: <20250402085129.1027670-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_015706_244479_1BC55F44 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Organize Macronix flash info to make it more readable.

Cheng Ming Lin (3):
  mtd: spi-nor: macronix: Drop the redundant flash info fields
  mtd: spi-nor: macronix: Remove duplicate flash info entries
  mtd: spi-nor: macronix: Move macronix_nor_default_init logic to
    macronix_nor_late_init

 drivers/mtd/spi-nor/macronix.c | 50 +++++++---------------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
