Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE0C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDCVv6B/zR/hUzqwGMPz+FVetV0bAWVOCXx80ZXKmr4=; b=bJ5gEABZs8Elim
	bQ59kHYGx4OkZ3Di8XhZGpPhYWcTwJSoYxaXbbI4QgqEjZ1KO8NJihwjCnCyDGDg65+UA9Retf2vL
	jmOXthQFbNKxZV1mtxw+KWJwlJ+Jz5q7IE8MYqXFQ8I3HCsWhZfRW2pJqcQm0XsN4SJjxmvOw8Hs0
	WEoUha0TNj2pQucSsJYUP+LhYtf7DNofFfBZsJolwfuv8BO1kDlzkpndKlSpff42hyUOCjbEamk4H
	gTraLJFd9GayhwekIHCOQaKvyqGLjVuYH5mWQ5bcdLiY57+J5eNEgu0Z34zNWPEUUMrthbBgIXPyW
	4Uc5o+sBGEZktNjwMN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os514-00GC8M-Hm; Mon, 07 Nov 2022 16:30:31 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4r2-00G7Pu-6U
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:20:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A701EC000E;
	Mon,  7 Nov 2022 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9VS+8wTvm1EAgDjHkp8dY9nCf0BXzR44170Yq78V7I=;
	b=OoQKxL+Nxg4H0xMlvJYVSj/GRevW4SiV6s72TmBBFQefM1nLDfbY80/qqTTN4wDxlBcOUX
	dv6Fgb20ikAGj1ugmnHGYX//qx4SDIHpMHIgN0DQ349rnau1qHzkAdgjDfHvRvsd2S3gnm
	UFHL2CZQrOdp+rlOMKf2nK0u70Kea9CFMmKj63EziKF07I09Y8YX/L33UnCWJsGdqnp9rx
	FBnXQG9I88TwWLgADvmvDFhirFT5V0ym/0B3zDf8fDQ0NQSs6pqa7Qi5UHe6w7VNnrvoka
	gFY3IRCeeCfjXCLsr/detX8hHNsjKAsjaEpTmmtkxq7GhmE6gBTsDBCCa5nNiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mtd: onenand: omap2: add dependency on GPMC
Date: Mon,  7 Nov 2022 17:19:58 +0100
Message-Id: <20221107161958.44056-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107091520.127053-1-krzysztof.kozlowski@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c717b9b7d6de9e024e47f7cd5bbff49f581d3db9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082008_438281_E48E5713 
X-CRM114-Status: UNSURE (   9.22  )
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

On Mon, 2022-11-07 at 09:15:20 UTC, Krzysztof Kozlowski wrote:
> OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
> OMAP_GPMC driver, so the latter cannot be module if OneNAND driver is
> built-in:
> 
>   /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
>   onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'
> 
> The OMAP_GPMC is also a runtime dependency.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
