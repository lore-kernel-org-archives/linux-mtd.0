Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD49FC4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 18:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8021920708
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 18:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="arlgUrzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8021920708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GpbeL06qmLWa8Vs5bBkrUp8a31k043l6t2Gg03s7TAM=; b=arlgUrzkoMjtAzeXVySau81UK
	/SpQTt3mGUYYf3yEtQwb2A8uunRcm/7sSzpwzDag2C9O0SgJI5IxCvOOqNslu4WxoARZVJ4+4WY3t
	feGMb81chu8dWT4hwx8v3/8NEBB1ANupf6c5MCfpm3/VyLGO7pCP9Zf3T9FID+P2GzlKjgrsbegF1
	tcADLI/jDkJriSqQykRroAEKmAFBRuetLLvcADajRrxxM7qVajX/56YF/OagkoPGD+KvL3h7g9/4W
	X3Tia2EEYKqtlRIsQtAigX9AWiAee1H5Gt/EgT6reIm/rvm8rECSj5RlCxzq8o9MNHekB9sNNg+qZ
	OWVceH5+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNhDP-0006bJ-Cb; Wed, 30 Sep 2020 18:52:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNhDM-0006aI-OS
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 18:52:33 +0000
X-Originating-IP: 86.206.245.199
Received: from windsurf.home (lfbn-tou-1-420-199.w86-206.abo.wanadoo.fr
 [86.206.245.199])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C3CDE1BF203;
 Wed, 30 Sep 2020 18:52:27 +0000 (UTC)
Date: Wed, 30 Sep 2020 20:52:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/5] mtd: spinand: Move ECC related definitions earlier
 in the driver
Message-ID: <20200930205226.533d4887@windsurf.home>
In-Reply-To: <20200930154109.3922-3-miquel.raynal@bootlin.com>
References: <20200930154109.3922-1-miquel.raynal@bootlin.com>
 <20200930154109.3922-3-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_145232_904061_5453BD70 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Sep 2020 17:41:06 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Prepare the creation of a SPI-NAND on-die ECC engine by gathering the
> ECC-related code earlier enough in the core to avoid the need for
> forward declarations.
> 
> The next step is to actually create that engine by implementing the
> generic ECC interface.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/core.c              | 106 +++++++++++------------
>  drivers/mtd/nand/spi/on-die-ecc-engine.c |   0
>  2 files changed, 53 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/mtd/nand/spi/on-die-ecc-engine.c

You're adding an empty on-die-ecc-engine.c file in this commit.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
