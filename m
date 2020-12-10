Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF0FC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED30423DE3
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED30423DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XC4lsYVaAqJYVcCtA3trs7JrQx1+l6snZB9oxOw0Dgk=; b=YvE1sEHo5/vYbAm6Ls3wBGuZ0
	4oDfU4g2K082MstmdZ/FhnNIgCgUDAMyiZ+PKdYRePOotmY8GIryvVm8Se5yaKSbl/WurX82ybJLd
	szr9k5GVJJOIuohOprYGjBiujuDVVCZMFrBZgCc5RwTGTAVMZn2RzWPnbVLuQUV/HO0e8Bct/709i
	o9HcUwon8UeBlHW2fz0+cIBg20xYW+8dfilWjJ4U+ctugGrIrjH07cZCOvPNokxSiQkucyAJ9ZcXh
	XShd4gAmJCrOvJtDBI3BggHerNZJiPbV4dc5Jcd7Y1QZcc/ta5l6VJVZ6MfD4YmxeSZNnws1sEjK0
	gwNmwIjLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTeN-0007sz-Rx; Thu, 10 Dec 2020 21:38:59 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTeG-0007re-7v
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:38:53 +0000
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4C4FC200004;
 Thu, 10 Dec 2020 21:38:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>, miquel.raynal@bootlin.com,
 vigneshr@ti.com
Subject: Re: [PATCH 2/2] mtd: spinand: macronix: Add support for MX35LFxG24AD
Date: Thu, 10 Dec 2020 22:38:46 +0100
Message-Id: <20201210213846.9508-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1607570529-22341-3-git-send-email-ycllin@mxic.com.tw>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ee4e0eafa43cfd9008722fe15e17b8bf62fb6e8d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_163853_137911_3860153E 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-10 at 03:22:09 UTC, YouChing Lin wrote:
> The Macronix MX35LF1G24AD(/2G24AD/4G24AD) are 3V, 1G/2G/4Gbit serial
> SLC NAND flash device (without on-die ECC).
> 
> Validated by read, erase, read back, write, read back on Xilinx Zynq
> PicoZed FPGA board which included Macronix SPI Host(drivers/spi/spi-mxic.c)
> & S/W BCH ecc(drivers/mtd/nand/ecc-sw-bch.c) with bug fixing patch
> (mtd: nand: ecc-bch: Fix the size of calc_buf/code_buf of the BCH).
> 
> Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
