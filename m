Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7BEC282DE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRThJrryaSoOe6+FmGkjueCjsNjiHWYO0lpChUlMueE=; b=fRlJjg6S7Jb82K
	EQtz8Z+2fDi1yrESJK47rd/ZesMZqfvZif2Kw0ghMK29j8xiufmTtnjW0AWbT0F0JieBuz5VJAq6I
	mVJPHbtTUTZGQobka/YaNxPb21qhxxdFXzBySThKX4qZIBXbBrq4P2OjOFetDfmq8Bs0MnI26qcSX
	fQ6LrI25mcO57uaK1Pv+TKA4DWjBlsx75amN7rXntWJCV2Yse5Cqr0zqNHYe8KOJ5freJX4YQg3Nr
	gtttC21vc91dcNe3wbFldqdYO2Euj/C1t8gXEPx9qarhaU8veXG3aj1fLqG9i3f/lEVovH3cdJOfl
	am5/eSsIJ0HhojkedS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRJF-0000000DJyX-2dBi;
	Fri, 07 Mar 2025 06:35:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRIu-0000000DJtP-47HU
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 06:35:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so885193a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 22:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741329327; x=1741934127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xC5VwCWT2LJCm6ZRZSOjjJkdJ8MXuyRlJ6NhhOHusZA=;
        b=YgOsSs1tzRdWQ+MQlXkMAZZNwOAo0YtQWLcLG8QzuI0T0l/bNSg+A5Nk3XOf+7kSQI
         0BG0wGzzzF1mnRfDfaJrxStF+Bm+3spDwPBHTVa5szuPIb7Ib4mR3iGnF4tljYFcWulN
         Q8gXiIm8i2h6lX66pjb05vN5Fba6xWO+feIg9c/Okc+IeCyNSxoCnu9rAjtaoWKniHvu
         nKOtCsEQJ9VQMA805yy9DlHtBrfEuLZOVHwMVvPZyGJp3INSDS9sdoL+NxT/J4VMxnrh
         ockdVZ3zLvkiuUXfsN/XMQS3KB9T4YIlUaFE6C1pLOdpGkcNS6V3Ac4xxAcJqViKAYAG
         8NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329327; x=1741934127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xC5VwCWT2LJCm6ZRZSOjjJkdJ8MXuyRlJ6NhhOHusZA=;
        b=jQJc9tm0XdCHh9t7FGbhxczWdwKi+DdmrGK5maEurvwqDXLzmwIYx41n8ZBMS5umDj
         2N6FCS5Xrf6iFvhhIgHjnvBaQidLz70i7SV+KcmQhIZBzcfiDCxIKxCp+aj0ytTkB2nX
         hmz/IxoqQ7fdc4u+87XLIx7y6eP+kf7SfIWD01UBuU0yLTGzSLRTxK+MGsQaqKaDuv6L
         LrZnjcfAyUAzGYPbHeRi8VgXU7ixcp+lkHyHvB6Id8KntdpKx/BP7fOHkzCGiN/XD5Wk
         TGR7cex12yx5nI97NnRJ2x49COGfA0hFE4WN61vlDb2EtJmrVt6lYGRVfxjVvNBmaPT2
         FJuA==
X-Forwarded-Encrypted: i=1; AJvYcCX1CiaTkG3Gq0YjHLuqQ3pNjLmk+uGnyM8yyw7xOTbZrnarOnMocvbxbp3PfE0Prrv/Jbr1KwRg/OE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzHGENN7i4JHR0LUr3soSMq110RQEQISQUl4Wr4l5nthpyJweZ
	db/b+ZwQjec6rQ81Td14guU3CENQsNsFLdPxsMPOWlnRa1uUcNSyeIwXzz4vy1Y=
X-Gm-Gg: ASbGncvVN97+Kb+JCocAnwR3cZ1ejD/N5bLSnO3apAvAktDHqUOlf4dxHEPICd+pXD8
	E4/4H6uMISjkhTf2oEVS6lgcKwh79O+H0GL6qHIA+HZA6QgvaENy31F53mTnCismEXGHq0791+K
	CjpdYA69u5rU3AhwowumUf5bFL0bdZhdNEY4UcRfufN42uJZ+7cGhdAWoddw2mLB2N//vmQgLvg
	Nftt8tMllEYpceTG5yzBrakRuYoOUa1z3K27fkq1lmNh8I2dShvvmwz2+BFrsco/DTJS4wZf1LQ
	WdlLdz6b6QF5xLpF5x3W+JcDQyb0zTCvN/lvbDs=
X-Google-Smtp-Source: AGHT+IGmV9SnVFHLoe52Ux0Kua4ViyrVZwKYM+EnPJMxaRyCAPo1MU0AgZT5uA54UKN88UQv/AQseg==
X-Received: by 2002:a05:6402:4405:b0:5e5:2c0a:448e with SMTP id 4fb4d7f45d1cf-5e5e22c0718mr2151757a12.6.1741329327171;
        Thu, 06 Mar 2025 22:35:27 -0800 (PST)
Received: from 1.. ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a8f2fsm2102492a12.41.2025.03.06.22.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:35:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <linchengming884@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/2] Add support for Quad Input Page Program
Date: Fri,  7 Mar 2025 08:35:20 +0200
Message-Id: <174132918169.12801.10830790202971847088.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211063028.382169-1-linchengming884@gmail.com>
References: <20250211063028.382169-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=VAkcBe8TuoHKHgxEi1kvuNIyeheghrDSIHviG1pL63U=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypOm9gSRom0HvcKAO8bjyLOkZrHZruvez9DHu fUqC9rGRYOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qTpgAKCRBLVU9HpY0U 6dB/B/97UX7pGf7VAEfye1+hDLB+vCPvTlYvqwFCXvPPaZuIaD90047BZC9X5JWrP+WPm2/VkWz i/fws302J2Stuthpc0CYAE4kSNSEhUTkTGTqTX0iC25n1LqiV2BjeqCklnfRsKmPAzaLmYWtve6 RibkZkrhKzs3Rk+SgpSUNwr1p97i2bQU89280tIw/CF2EAZG9QsQ6pPrqUSOsG5UXNLavC2w8eD j4brIV2EwXYgnZlBRj9BWj1dTxra7oABIR04uD9X0h7ek2Hz1pymiKFQdql/nDUh5smKd6g7Yzm wf1CnKd9fckTgd8f7szuXkeFlg1B0wXjiHFEqmaXeXIa5yXd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_223529_033153_E78C221F 
X-CRM114-Status: UNSURE (   8.76  )
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


On Tue, 11 Feb 2025 14:30:26 +0800, Cheng Ming Lin wrote:
> Support for the Quad Input Page Program feature.
> 
> Some Macronix NOR flash support the Quad Input Page Program feature, but
> the 4-Byte Address Instruction Table definition in the SFDP is incorrect.
> To properly enable this feature, a post_sfdp fixups implementation is
> introduced.
> 
> [...]

Please rnu ./scripts/checkpatch --strict before submitting. Fixed alignment
to match open pharenthesis, updated commit subject.
Applied, thanks!

[1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
      https://git.kernel.org/mtd/c/798aafeffb36
[2/2] mtd: spi-nor: macronix: Add support for Macronix NOR Flash
      https://git.kernel.org/mtd/c/797bbaa7531f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
