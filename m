Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A69CC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF0F6117A
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF0F6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McGMXCPtjtzI4rq1xxmKlJNqgn4LfOhLUxVsobdkDvo=; b=Kt8boI8sDz9y5c
	Sdzy2gjlsnLN+bPX1x3896UwCDYPlJRpyJp8j1o/vWwNg0MTonulJqLYItTTtUNKzoeLSTHLIyNyW
	iKxymiKAGbeh1kMcq/w/vq5fiF8NTcobCQtScGG8r0HH3t25TVvEHqmQDAjztU2K2xvxDDrQT3GNa
	UTMpkzup6FNXGocEy7HKXSTDEmd3tghDDBrKLpim9bbB+NBBSr0IDgvRDOFvH5umPdnWF8ea/6p6J
	BkUaMPldCaoiRbbWB2GCcevhjPmgNnXf2gJludDcEvO3uIJb5fFL+JgJNtbj0pXBGrOODFkFMXYs6
	jXcUBhRHcFxNcJwhDSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llpt7-00Ctyf-1O; Wed, 26 May 2021 09:31:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRY-00Ci0A-Hc
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 87CC160023;
 Wed, 26 May 2021 09:03:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, zhengxunli@mxic.com.tw,
 ycllin@mxic.com.tw
Subject: Re: [PATCH] mtd: spinand: macronix: Add support for serial NAND flash
Date: Wed, 26 May 2021 11:03:10 +0200
Message-Id: <20210526090310.180904-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1621475108-22523-1-git-send-email-jaimeliao@mxic.com.tw>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'681171472de93083875cea8b856d8636246b478c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020312_766650_5450501B 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, 2021-05-20 at 01:45:08 UTC, jaimeliao@mxic.com.tw wrote:
> From: Jaime Liao <jaimeliao@mxic.com.tw>
> 
> Macronix NAND Flash devices are available in different configurations
> and densities.
> 
> MX"35" means SPI NAND
> MX35"LF"/"UF" , LF means 3V and UF meands 1.8V
> MX35LF"2G" , 2G means 2Gbits
> MX35LF2G"E4"/"24"/"14",
> E4 means internal ECC and Quad I/O(x4)
> 24 means 8-bit ecc requirement and Quad I/O(x4)
> 14 means 4-bit ecc requirement and Quad I/O(x4)
> 
> MX35LF2G14AC is 3V 2Gbit serial NAND flash device
> (without on-die ECC)
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7926/MX35LF2G14AC,%203V,%202Gb,%20v1.1.pdf
> 
> MX35UF4G24AD is 1.8V 4Gbit serial NAND flash device
> (without on-die ECC)
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7980/MX35UF4G24AD,%201.8V,%204Gb,%20v0.00.pdf
> 
> MX35UF4GE4AD/MX35UF2GE4AD are 1.8V 4G/2Gbit serial
> NAND flash device with 8-bit on-die ECC
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7983/MX35UF4GE4AD,%201.8V,%204Gb,%20v0.00.pdf
> 
> MX35UF2GE4AC/MX35UF1GE4AC are 1.8V 2G/1Gbit serial
> NAND flash device with 8-bit on-die ECC
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7974/MX35UF2GE4AC,%201.8V,%202Gb,%20v1.0.pdf
> 
> MX35UF2G14AC/MX35UF1G14AC are 1.8V 2G/1Gbit serial
> NAND flash device (without on-die ECC)
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7931/MX35UF2G14AC,%201.8V,%202Gb,%20v1.1.pdf
> 
> Validated via normal(default) and QUAD mode by read, erase, read back,
> on Xilinx Zynq PicoZed FPGA board which included Macronix
> SPI Host(drivers/spi/spi-mxic.c).
> 
> Signed-off-by: Jaime Liao <jaimeliao@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
