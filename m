Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EB5C48BD6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:04:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B993B20B1F
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyFJ9CgP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B993B20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwOJOPj8llzU6XCE7LwTmUkkpBXhW7cx1Gubrh9f5ZQ=; b=TyFJ9CgPmxovji
	sQtOFS1Vud0/Sh3dnjTxz+LNUCA2VEtsB6mQ6vNVRu7MNuE0X3WFSrU3badwBVbXuKpG1ALJSuZvl
	ybSEH4lgJRs0RJR3+JIurqessN44+Poy8/0UhwaXgfg7zqGJZ+J73cxZuLUIu/xHPMxI3ldgHojJZ
	rZoLp/Hg1CNnIabd/nufx1WT4L/tR8bSoRITtTBS2Kk2mJKX4n+67MChzzgnDa1P//aVOvtvAEMkA
	Jhv5J1nwfJeI5wBQfiNBER0rToxNaNdjPItzvnPf8otAkm4e5VkQQoBpk9jq7QKgXu6mDHnU9/ziV
	6JjlR5TogNqASUrTXKZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg6f6-0008O0-5C; Wed, 26 Jun 2019 12:04:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg6f1-0008NG-Qa
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 12:04:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A70A2289366;
 Wed, 26 Jun 2019 13:04:20 +0100 (BST)
Date: Wed, 26 Jun 2019 14:04:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Message-ID: <20190626140417.440cf762@collabora.com>
In-Reply-To: <DM6PR02MB4779D347620E88BDB943DEB4AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190626084807.3f06e718@collabora.com>
 <DM6PR02MB47796E3306C166A91E0BAE91AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626132715.6128d8b1@collabora.com>
 <DM6PR02MB4779D347620E88BDB943DEB4AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_050424_129375_1FAE002F 
X-CRM114-Status: GOOD (  21.47  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "helmut.grohne@intenta.de" <helmut.grohne@intenta.de>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jun 2019 11:51:12 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:

> Hi Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Sent: Wednesday, June 26, 2019 4:57 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de; richard@nod.at;
> > dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com;
> > vigneshr@ti.com; bbrezillon@kernel.org; yamada.masahiro@socionext.com; linux-
> > mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over write
> > driver's read_page()/write_page()
> > 
> > On Wed, 26 Jun 2019 11:22:33 +0000
> > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> >   
> > > Hi Boris,
> > >  
> > > > -----Original Message-----
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Sent: Wednesday, June 26, 2019 12:18 PM
> > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > > > marek.vasut@gmail.com; vigneshr@ti.com; bbrezillon@kernel.org;
> > > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > > linux-kernel@vger.kernel.org
> > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not
> > > > over write driver's read_page()/write_page()
> > > >
> > > > On Mon, 24 Jun 2019 22:46:29 -0600
> > > > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> > > >  
> > > > > Add check before assigning chip->ecc.read_page() and
> > > > > chip->ecc.write_page()
> > > > >
> > > > > Signed-off-by: Naga Sureshkumar Relli
> > > > > <naga.sureshkumar.relli@xilinx.com>
> > > > > ---
> > > > >  drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/mtd/nand/raw/nand_micron.c
> > > > > b/drivers/mtd/nand/raw/nand_micron.c
> > > > > index cbd4f09ac178..565f2696c747 100644
> > > > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > > > @@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip *chip)
> > > > >  		chip->ecc.size = 512;
> > > > >  		chip->ecc.strength = chip->base.eccreq.strength;
> > > > >  		chip->ecc.algo = NAND_ECC_BCH;
> > > > > -		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > -		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> > > > > +		if (!chip->ecc.read_page)
> > > > > +			chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > +
> > > > > +		if (!chip->ecc.write_page)
> > > > > +			chip->ecc.write_page = micron_nand_write_page_on_die_ecc;  
> > > >
> > > > That's wrong, if you don't want on-die ECC to be used, simply don't
> > > > set nand-ecc-mode to "on- die".  
> > > Ok. But if we want to use on-die ECC then you mean to say it is mandatory to use  
> > micron_nand_read/write_page_on_die_ecc()?
> > 
> > Absolutely, and if it doesn't work that means you driver does not
> > implement raw accesses correctly, which means it's still buggy...  
> I agree. But let's say, if there is a limitation with the controller. Then it is must to have this check right?
> I mean, for pl353 controller, we must clear the CS during the data phase, hence we are splitting the 
> Transfer in the pl353_read/write_page_raw().
> +	pl353_nand_read_data_op(chip, buf, mtd->writesize, false);
> +	p = chip->oob_poi;
> +	pl353_nand_read_data_op(chip, p,
> +				(mtd->oobsize -
> +				PL353_NAND_LAST_TRANSFER_LENGTH), false);
> +	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +	xnfc->dataphase_addrflags |= PL353_NAND_CLEAR_CS;
> +	pl353_nand_read_data_op(chip, p, PL353_NAND_LAST_TRANSFER_LENGTH,
> +				false);
> As the above sequence is needed even for raw access, PL353 is unable to use the on_die_page reads.

This "de-assert CS on last access" logic should be done in the
exec_op() implementation. I also wonder how that works for operations
that don't have data cycles. Oh, BTW, most chips are CE-don't-care,
which means you can assert/de-assert CS on each read_data_op() without
any issues.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
