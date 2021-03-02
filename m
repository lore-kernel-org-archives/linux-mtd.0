Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DE8C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:26:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C27764EE7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C27764EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uRg/UWyMqdMPbCuaLhZvi/wwPJlG0nSQs1FomoHMTLk=; b=Kp5uAvN8L82OFMNZdIbi/HbER
	aZZrFS0ASscczzq4RXifAlceK7M1+vMQ4Ctk6C0VvcOrVNfyvQyVCcLVHFpTELI3pfpbQRfkBvGwa
	Ci0COIt1uvEu3DJQjX/vzCctGJQcCMNGCUwkq/2l/27IkEPj5RpyuJ9CSLLUfNqAJCiFSBZ2Frwoc
	KKqjNEbPqQH1JobAIy+3ea9hjzSBcaBx7Kn+lbErcH6tcXTfw6x3DBAQI/GnpTcVrQRv0noRwiPIl
	GSRciTwJmLBiMfFKRQscfdUlEkj9yywKccaXEjJtG2mRseOZlDPFrUgf9jY0KDnlh8HiFAP5zxI/y
	r+wtivMHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUK2-005ax1-Ng; Wed, 03 Mar 2021 16:26:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSAk-005464-Mc
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gIet5PCw/3gN9aFMN84ED6sO0opGT9+H6lyET/8G9Jo=; b=DZlv6kK4s9nEWf0jU6ZnkEvvNP
 XOnVkYUJsBxrM98JSnkEVSiqnCwBOGYXfQKr8bAoHUB3HEkzfBQmZOaRJeT45J9OS1IGxodO0N1hu
 W+WOp2g+rkgbsXA16jF8ahIvhX1QzF1sYbkHP8ZnMIrGmdfITCn3ztWQOTf7ePMMQ6zgBdNEzIfv4
 ZtIh41kT+s96BlniuZYq/DSTpmFJigrjeAu7r6nKRvt6DQyqVGXmJh78ja1tI1gnJxZHRdI2JAcft
 HYLCP+G9nAmG2oNwJ9BX3LcG6yhepzFhcFsZHMzSFH/7JVT7/TcTlB7Poq4nz9NpubgksFjf5LhBk
 uxj3/SOg==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8b7-00HW87-56
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:19 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0E9A31C0011;
 Tue,  2 Mar 2021 17:13:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: parsers: extend Qcom SMEM parser to SPI flash
Date: Tue,  2 Mar 2021 18:13:50 +0100
Message-Id: <20210302171350.947-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: bf172496fecdc99327874989cd1613b4740ddd00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171419_223252_0D132339 
X-CRM114-Status: UNSURE (   7.56  )
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

On Tue, 2021-02-23 at 11:47:04 UTC, Baruch Siach wrote:
> The Qcom MIBIB partition might be stored on SPI flash devices, and the
> parser works in this case just as well:
> 
> [    1.404229] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
> [    1.408078] spi-nor spi0.0: found mx25u6435f, expected n25q128a11
> [    1.415016] spi-nor spi0.0: mx25u6435f (8192 Kbytes)
> [    1.420756] 12 qcomsmem partitions found on MTD device spi0.0
> [    1.425739] Creating 12 MTD partitions on "spi0.0":
> [    1.431381] 0x000000000000-0x00000000c000 : "0:sbl1"
> [    1.437058] 0x00000000c000-0x00000000d000 : "0:mibib"
> [    1.442143] 0x00000000d000-0x000000027000 : "0:qsee"
> [    1.447057] 0x000000027000-0x000000028000 : "0:devcfg"
> [    1.452088] 0x000000028000-0x00000002a000 : "0:rpm"
> [    1.457065] 0x00000002a000-0x00000002b000 : "0:cdt"
> [    1.461832] 0x00000002b000-0x00000002c000 : "0:appsblenv"
> [    1.466736] 0x00000002c000-0x000000036000 : "0:appsbl"
> [    1.472248] 0x000000036000-0x00000003a000 : "0:art"
> [    1.477297] 0x00000003a000-0x00000003e000 : "config"
> [    1.482047] 0x00000003e000-0x00000004e000 : "data"
> [    1.487257] 0x00000004e000-0x000000200000 : "0:hlos"
> 
> Remove dependency on MTD_NAND_QCOM. Update the Kconfig prompt and help
> text accordingly.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
