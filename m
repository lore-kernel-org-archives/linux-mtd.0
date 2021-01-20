Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD065C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 22:40:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED572220B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 22:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ED572220B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z/tRH5Rr5Ixwt0ziMDs8cNAxL1DGaainr/XN1kaYZrQ=; b=NX0Wl7Qk+84mcZaOQWa11N5c4
	C2BzHi24fESzPauacv5zSsyI2j/vAwgFlblh07mciuHDTX+xO6wT9DuZT4Eab9kidMOvwcb+zky9t
	HqlE8JmUEMGGvN37KQ8wvkkXRITjM7gUT+jb5OhdyGeq5hdCwcBg/5a/h5NslSOs+XJZkH/BiMfKu
	Dvs2rKde/fpOSQY4BRztLDJFScizH5puPQKgisawlkvNSOkxrl4AWfF8UVDGryEDLoqBR2dT3kHnH
	58HTBd9KDvdyEt/octJRLcx1+hEUMOWJeSHf4If04fBM432syW/hX8dQ0kbSXR91qD4fZEvcbOS0o
	akpG9Dwiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2M85-0007Ik-Gi; Wed, 20 Jan 2021 22:39:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2M81-0007IB-Ra
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 22:39:07 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7DC19FF802;
 Wed, 20 Jan 2021 22:39:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: omap: Use BCH private fields in the
 specific OOB layout
Date: Wed, 20 Jan 2021 23:39:00 +0100
Message-Id: <20210120223900.29614-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119155510.5655-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b135b3358d73aa2a8b2be35d08e422421d1c609e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_173906_005256_95204BF8 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-19 at 15:55:10 UTC, Miquel Raynal wrote:
> The OMAP driver may leverage software BCH logic to locate errors while
> using its own hardware to detect the presence of errors. This is
> achieved with a "mixed" mode which initializes manually the software
> BCH internal logic while providing its own OOB layout.
> 
> The issue here comes from the fact that the BCH driver has been
> updated to only use generic NAND objects, and no longer depend on raw
> NAND structures as it is usable from SPI-NAND as well. However, at the
> end of the BCH context initialization, the driver checks the validity
> of the OOB layout. At this stage, the raw NAND fields have not been
> populated yet while being used by the layout helpers, leading to an
> invalid layout.
> 
> The chosen solution here is to include the BCH structure definition
> and to refer to the BCH fields directly (de-referenced as a const
> pointer here) to know as early as possible the number of steps and ECC
> bytes which have been chosen.
> 
> Note: I don't know which commit exactly triggered the error, but the
> entire migration to a generic BCH driver got merged in one go, so this
> should not be a problem for stable backports.
> 
> Reported-by: Adam Ford <aford173@gmail.com>
> Fixes: 80fe603160a4 ("mtd: nand: ecc-bch: Stop using raw NAND structures")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit-28.dts

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
