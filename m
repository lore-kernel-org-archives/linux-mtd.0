Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C887C63777
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 20:47:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E32E22261
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 20:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXicJuec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E32E22261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=boBPhiJQlPkUSVpmMY8xuO1d12/GA0TfDuO7Tpsn6lo=; b=YXicJuecc4i0tFJU+I2SvLX5P
	8atxFeyPdImWkqCSKAK+fWF0yFXYlmY6Z86wJtLgiNS77nRa257sE+2Ygmc2prAza6uvdCdfFE3U8
	lrP+oRkESKM4xam1iM+O2pEhss2zkzKYT/sx03pX8WY4C+bwf2t1Lpr8jR2eRTfpgImry8DBamm3h
	WAxeSuVoERjixDn/03uEiz+vYDOn+306vG663xwNrv9B88nh8+9nxSpR+6VQEdRh5aPTIYR/1WBBQ
	ArCR69P/rTeNkwfKPEUGiXxWSSNeKzZomI6M1qw1NR6X8bcqxHfN3qB57PpXMQNbGReVSthlgdueL
	/Q1aAC3wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfqpX-0004HJ-E6; Thu, 19 Nov 2020 20:46:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfqpU-0004Gd-KF
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 20:46:57 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A4D13C0005;
 Thu, 19 Nov 2020 20:46:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 17/19] mtd: rawnand: r852: Move the ECC initialization to
 ->attach_chip()
Date: Thu, 19 Nov 2020 21:46:51 +0100
Message-Id: <20201119204651.5936-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-18-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 70a96e681bf0fb2537dc254c89857ed3bf2b4821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_154656_837257_CD5F7AAF 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 12:34:22 UTC, Miquel Raynal wrote:
> The probe function is only supposed to initialize the controller
> hardware but not the ECC engine. Indeed, we don't know anything about
> the NAND chip(s) at this stage. Let's move the logic initializing the
> ECC engine, even pretty simple, to the ->attach_chip() hook which gets
> called during nand_scan() routine, after the NAND chip discovery. As
> the previously mentioned logic is supposed to parse the DT for us, it
> is likely that the chip->ecc.* entries be overwritten. So let's avoid
> this by moving these lines to ->attach_chip().
> 
> Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
