Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC6EC10F03
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:07:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB66D20663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0frWNuf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB66D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vz5/ZZlfLMdvd0vBhP5gBXS4rCkT9VLC9LkER2d3sgw=; b=P0frWNufLnxgWY
	6JSAvJjhnZWZBcn3JWlOpLHgMxayEeGWkJq+GUzywA9n7kzru3o11NeoNl8j03e5hUBj2EbJ2kUnl
	LTPUeFCU3k8fVXUtTiAy5phIwjs1xZDVFFTdLFVVtVRGBGyUjUgphcKwBJEqR7i7wjDSIGkY1OzX2
	H80wyeYzxqIYA6LpMOGC2zKsbRceqVUiFhVYJy1G+TE8XtDApihxYn8JOs8cezBI8G3OBUvzLfp75
	CkVpbY7+cmSXPfAKpqaT6gJxFJy8Ek9uaq/efDmeq4UE+NBNS0J8VUqmHhkTmEFomvfmihmpy/cZJ
	W1h15NP28XsUN5DqIdkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sw7-0005DO-Qn; Mon, 04 Mar 2019 19:07:39 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sw5-0005Cz-DK
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 19:07:39 +0000
Received: from xps13 (76.15.136.77.rev.sfr.net [77.136.15.76])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E86A724000A;
 Mon,  4 Mar 2019 19:07:27 +0000 (UTC)
Date: Mon, 4 Mar 2019 20:07:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 7/9] mtd: rawnand: ingenic: Add support for the JZ4740
Message-ID: <20190304200725.28b072a8@xps13>
In-Reply-To: <1551724129.4932.5@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-7-paul@crapouillou.net>
 <20190304113412.24b64e3d@xps13> <1551724129.4932.5@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_110737_599453_AF2A8A88 
X-CRM114-Status: GOOD (  23.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 19:28:49
+0100:

> On Mon, Mar 4, 2019 at 11:34 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Hi Paul,
> > 
> > Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:03
> > -0300:
> >   
> >>  Add support for probing the ingenic-nand driver on the JZ4740 SoC >> from
> >>  Ingenic, and the jz4740-ecc driver to support the JZ4740-specific
> >>  ECC hardware.  
> >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >> <mailto:paul@crapouillou.net>>  
> >>  ---  
> >> >>  Changes:
> >> >>  v2: New patch
> >> >>  v3: Also add support for the hardware ECC of the JZ4740 in this >> patch
> >> >>  v4: - Fix formatting issues  
> >>      - Add MODULE_* macros  
> >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 ++  
> >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
> >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 +++++--
> >>   drivers/mtd/nand/raw/ingenic/jz4740_ecc.c   | 196 >> ++++++++++++++++++++++++++++
> >>   4 files changed, 244 insertions(+), 11 deletions(-)
> >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c  
> >> >   
> > [...]
> >   
> >>   	switch (chip->ecc.mode) {
> >>   	case NAND_ECC_HW:
> >>  @@ -270,8 +279,8 @@ static int ingenic_nand_init_chip(struct >> platform_device *pdev,
> >>   		return -ENOMEM;
> >>   	mtd->dev.parent = dev;  
> >> >>  -	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;  
> >>  -	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
> >>  +	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
> >>  +	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
> >>   	chip->legacy.chip_delay = RB_DELAY_US;
> >>   	chip->options = NAND_NO_SUBPAGE_WRITE;
> >>   	chip->legacy.select_chip = ingenic_nand_select_chip;  
> > 
> > I think Boris already asked for it, but it would be really great that
> > you update this driver to not use any legacy interface anymore.  
> 
> I thought I'd send a patch later. But I don't mind doing the update in
> this patchset.

Great! No it's okay, don't delay this patch set, doing it in another
thread is fine.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
