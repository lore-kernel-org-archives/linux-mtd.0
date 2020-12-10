Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E65C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F3223DE3
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F3223DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ue2qhssE70p4vgAjXSwy23L/tlxJSxYHmANRVnsiyjU=; b=jhKpY5EnzHFPdNiGbBo/sS5vz
	NBoaHXY1STlrIDpWalKQAfz4HePq3yY8Aka0GY6td/2uB1FMNbLAbyom+fn6qf9sh+yj+2KU7uLMj
	9IJd7x6PeOfVG/utXV9ETzTqvffRJPX2ucw7DGPEqdV2ZXKPQcK8udTCTELecxMDzncxLgRtMBjo1
	F10OSQSIcn8OchM7gaKR5JMmdy/ArHY9Te+1Ltwxvcwra0+7u1gSpUZJHWCvBXSbhZvmMaxXUU8CV
	4p1b58Vddn6D78bpyW7uapGAKxRCbIkJuQNaQU/ddW76LJJjcUGtYsf1V6A5MO8+2ImhMCpl0itwN
	1VArqfCYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTfS-0008HS-2a; Thu, 10 Dec 2020 21:40:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTef-0007z7-BU
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:39:24 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E7BA0C0009;
 Thu, 10 Dec 2020 21:39:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, miquel.raynal@bootlin.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v2 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0
 R/B issue
Date: Thu, 10 Dec 2020 22:39:13 +0100
Message-Id: <20201210213913.9771-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209035104.22679-2-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 46337d158262465a89f3568c94410ea553aa15b9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_163918_029450_247016EE 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-09 at 03:51:03 UTC, Han Xu wrote:
> set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
> from all CS.
> 
> For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
> without the patch.
> 
> [    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770613] nand: Micron MT29F64G08AFAAAWP
> [    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.786421] Bad block table found at page 524160, version 0x01
> [    3.792730] Bad block table found at page 524032, version 0x01
> 
> After applying the patch
> 
> [    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770941] nand: Micron MT29F64G08AFAAAWP
> [    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.784390] nand: 2 chips detected
> [    3.790900] Bad block table found at page 524160, version 0x01
> [    3.796776] Bad block table found at page 1048448, version 0x01
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
