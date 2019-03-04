Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A37DC10F03
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C8320663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfqfozL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C8320663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV1Z2fXakrwd6ozqcySfSGaHrTzqZW+dkbyO6Npqg7E=; b=PfqfozL1zvIQGg
	L6fZcFJgKHiqnxliP+o5x9NZ7yGINoH0P9qhVagBf7V7LX22OLCq6ZP9WNZ4UDSq+fdXC+kPBN1s5
	tVlYbRL29nfEaXSQsxQcC3/addDw3ytRet/In4IrLEyxusehDUaurU6LfXKwzkDZe95QbCAC9P72E
	I1mh5xyLCu2j7O/kmS5tJrdvx8GPmwpTpntyz0UIRacvrQNcuwTfpa3j7mSyqNMryWQaBH3lKTwEc
	a5vl3aYRfP+rTN6funPhPQunoqaZ1iypwN9cSqCJecLODycpGU59NCV2yDbcpTzq+yBgnwHQG0gRq
	8ENYJRdnXMgs0ktGT/2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0syb-0006oY-Au; Mon, 04 Mar 2019 19:10:13 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0syY-0006oB-Lt
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 19:10:12 +0000
Received: from xps13 (76.15.136.77.rev.sfr.net [77.136.15.76])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AAA7824000A;
 Mon,  4 Mar 2019 19:10:02 +0000 (UTC)
Date: Mon, 4 Mar 2019 20:09:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
Message-ID: <20190304200947.69237b05@xps13>
In-Reply-To: <1551724204.4932.6@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-8-paul@crapouillou.net>
 <20190304113519.2e102b25@xps13> <1551724204.4932.6@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_111010_868739_6C210872 
X-CRM114-Status: GOOD (  25.65  )
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

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 19:30:04
+0100:

> On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Hi Paul,
> > 
> > Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:04
> > -0300:
> >   
> >>  The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
> >>  NAND, so we use it unconditionally in the ingenic-nand driver.  
> >> >>  Also add the jz4725b-bch driver to support the JZ4725B-specific BCH  
> >>  hardware.  
> >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >> <mailto:paul@crapouillou.net>>  
> >>  ---  
> >> >>  Changes:
> >> >>  v2: Instead of forcing the OOB layout, leave it to the board code or  
> >>      devicetree to decide if the jz4725b-specific layout should be >> used
> >>      or not.  
> >> >>  v3: - Revert the change in v2, as the previous behaviour was >> correct.  
> >>      - Also add support for the hardware BCH of the JZ4725B in this
> >>        patch.  
> >> >>  v4: - Add MODULE_* macros  
> >>      - Add tweaks suggested by upstream feedback  
> >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +  
> >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
> >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
> >>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292 >> ++++++++++++++++++++++++++++
> >>   4 files changed, 350 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  
> >> >   
> > [...]
> >   
> >>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
> >>  +			     struct ingenic_ecc_params *params,
> >>  +			     const u8 *buf, u8 *ecc_code)
> >>  +{
> >>  +	int ret;
> >>  +
> >>  +	mutex_lock(&bch->lock);
> >>  +	ret = jz4725b_bch_init(bch, params, true);  
> > 
> > I really don't like this bch_init name. A BCH initialization is what > is
> > supposed to be done only once (probably at boot time), can you find a
> > better name or a better organization of the correct/calculate path?  
> 
> jz4725b_bch_setup() maybe?

Unless I am not understanding what this does, I don't get why you would
need to do this setup everytime you want to use the ECC engine. Are you
sure this is needed?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
