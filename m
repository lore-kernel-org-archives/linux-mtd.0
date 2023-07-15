Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93508C001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViLOMvFhBgLsov3DU76DlrFQd3NtbZRwOQMzExJ09QY=; b=I2w9KY6wJLuSw+
	eM3SynWdUVb7LsMKcekkx5x6ye4zq41u2XACaz5/3vSmWt0V5kCq+6a1O+GN6h4HlAaCEQijElGpQ
	D59TfbKTLSjf0W3J7ba12l6NLYqs7QV4bL7JrML32IzpJUejiesI92W8uqbjZ+Q2tf3VWzX53jEMA
	nj3zWUEoyopLNbX7kYG3iZUuisY/2UAUhN6djLvpEE4SSAnB1q3rQLpkYxU6wrew6fBbS5WgVGy+o
	WcydLj0QeFMzPr1TzB42+0QDo67Wsw4vEbahKGzNS0XbK9nspKcMbNxUG5f3/1BfnC3YxRQIZLNTL
	WeXhjhEjJvNfbrZ+Zo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzi-00971m-1V;
	Sat, 15 Jul 2023 16:19:42 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhza-0096vu-2f;
	Sat, 15 Jul 2023 16:19:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8A1AC0004;
	Sat, 15 Jul 2023 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0EHZy2XjLvntFqJM+bGFxi3ZWSm7Ym0ibsWZEusD5I=;
	b=a6ojviiGKtfXUfdc2PbMCTxlacZRUJvVHquHB0a/e73TYA6hL/zHDp4hs8LyLlfraIScVd
	OGEhrRD2K3bUCWNcUnRxpRwVw66ZN4u/0q6PxZZiqMR/YfEFrIOu9KsGzy3uLuKV+M2CCQ
	9mpwYKWkeVTylnwPEk2puMCiIOWP7TJezZS42cx8ZFxOg3lp3Sjk12mXLayvx4kO/iL9G1
	lWrDJAcYu+gYK8zX+5qIQEQr7zlmNtCsh+hRJM2gQUDb51vWF0a8eUk0G3hs4jWdHtICfV
	H2yn15H3hroKJizV19X1L+LST6CMlmHQo2bCfKp1Cxnk0967zYB3QMtmTUamEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: Add SEAMA partition bindings
Date: Sat, 15 Jul 2023 18:19:31 +0200
Message-Id: <20230715161931.20674-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713-seama-partitions-v4-1-69e577453d40@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'de2a5d52f2c052814349013e8a77d1bc02717d74'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091935_015333_E50A0BA1 
X-CRM114-Status: UNSURE (   7.70  )
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

On Wed, 2023-07-12 at 22:16:41 UTC, Linus Walleij wrote:
> This types of NAND partitions appear in OpenWrt and
> U-Boot.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
