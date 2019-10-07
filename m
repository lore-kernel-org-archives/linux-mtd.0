Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C581C4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 07:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CBA221655
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 07:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SthpPRZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CBA221655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0ayhccfTA9ELDCttnxrC2YnEgt8LJ4m5ZE8aB81Kxo=; b=SthpPRZw6ORUKP
	ml1Fgt7U5qp4nwg/y2JN5O0l+zuzHrfD5SF0KxhIs1HHhXuYfM2sX9yDivFzTpkIJ+qZzbh/n6Ci1
	2Mks0nViGbP2frGHP58j+kKWs0oj+b7Pn9WwnWCotR4Z2D7mVLDgealdaWhgsDxiKfpEOoEgpKylY
	v3BvGRUlCB3c9f9Edm6VytqViVwenN3N5gNBQRaPhJI+PC2wJmxAzxkVIMRnV2ZbGX23DmGvAwvad
	Kg2kn0NWxiuxChwtrzHxTzIFoPY9YNJ6g/jwQEEGBa1LzWfFa2K+xUjJJu0E/xyk4C4z3VxPySR0f
	PQRAcC1ks1Kn55T2oWtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHNoy-0001m8-R2; Mon, 07 Oct 2019 07:52:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHNov-0001lT-M4
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 07:52:43 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 568E228E657;
 Mon,  7 Oct 2019 08:52:38 +0100 (BST)
Date: Mon, 7 Oct 2019 09:52:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [EXT] Re: [PATCH 4/8] mtd: spinand: enabled parameter page support
Message-ID: <20191007095234.55fcb050@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190819112118.56b2f9ea@xps13>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-5-sshivamurthy@micron.com>
 <20190807114855.35f26229@xps13>
 <MN2PR08MB59511E352AE382D103DA56CBB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190819112118.56b2f9ea@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_005241_982937_8D1B5035 
X-CRM114-Status: GOOD (  41.51  )
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
Cc: Brian Norris <computersforpeace@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>, Chuanhong Guo <gch981213@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Shivamurthy Shastri \(sshivamurthy\)" <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 19 Aug 2019 11:21:18 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Another question for you :)
> 
> "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote on
> Mon, 19 Aug 2019 08:51:52 +0000:
> 
> > Hi Miquel,
> >   
> > > 
> > > Hi Shiva,
> > > 
> > > shiva.linuxworks@gmail.com wrote on Mon, 22 Jul 2019 07:56:17 +0200:
> > > 
> > > "mtd: spinand: enable parameter page support"
> > >     
> > > > From: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > >
> > > > Some of the SPI NAND devices has parameter page, which is similar to    
> > >                  -             have a    
> > > > ONFI table.    
> > >   regular raw NAND ONFI tables.
> > >     
> > > >
> > > > But, it may not be self sufficient to propagate all the required    
> > >   As it may not be    
> > > > parameters. Fixup function has been added in struct manufacturer to    
> > >             , a fixup        is being added in the manufacturer structure    
> > > > accommodate this.    
> > > 
> > > The fixup function sentence should be dropped from the commit message,
> > > see below.    
> > 
> > Okay, I will create separate patch for fixup function.
> >   
> > >     
> > > >
> > > > Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > > ---
> > > >  drivers/mtd/nand/spi/core.c | 134    
> > > ++++++++++++++++++++++++++++++++++++    
> > > >  include/linux/mtd/spinand.h |   3 +
> > > >  2 files changed, 137 insertions(+)
> > > >
> > > > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > > > index 89f6beefb01c..7ae76dab9141 100644
> > > > --- a/drivers/mtd/nand/spi/core.c
> > > > +++ b/drivers/mtd/nand/spi/core.c
> > > > @@ -400,6 +400,131 @@ static int spinand_lock_block(struct    
> > > spinand_device *spinand, u8 lock)    
> > > >  	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
> > > >  }
> > > >
> > > > +/**
> > > > + * spinand_read_param_page_op - Read parameter page operation    
> > > 
> > > Again, the name in the doc does not fit the function you describe
> > >     
> > > > + * @spinand: the spinand    
> > >                     SPI-NAND chip
> > > 
> > > Shiva, there are way too much typos and shortcuts in your series.
> > > Please be more careful otherwise we can't focus on the technical
> > > aspects. I am not a native English speaker at all but please, plain
> > > English is not C code. We talk SPI-NAND and not spinand, we say
> > > structure and not struct, acronyms are uppercase, etc.
> > >     
> > 
> > Sorry for the inconvenience caused, I will take care from next time.
> >   
> > > > + * @page: page number where parameter page tables can be found    
> > >                               ^ the    
> > > > + * @buf: buffer used to store the parameter page
> > > > + * @len: length of the buffer
> > > > + *
> > > > + * Read parameter page    
> > >           the    
> > > > + *
> > > > + * Returns 0 on success, a negative error code otherwise.
> > > > + */
> > > > +static int spinand_parameter_page_read(struct spinand_device *spinand,
> > > > +				       u8 page, void *buf, unsigned int len)
> > > > +{
> > > > +	struct spi_mem_op pread_op = SPINAND_PAGE_READ_OP(page);
> > > > +	struct spi_mem_op pread_cache_op =
> > > > +    
> > > 	SPINAND_PAGE_READ_FROM_CACHE_OP(false,    
> > > > +								0,
> > > > +								1,
> > > > +								buf,
> > > > +								len);    
> > > 
> > > That's ok if you cross the 80 characters boundary here. You may put "0,
> > > 1," on the first line and "buf, len);" on the second.
> > >     
> > > > +	u8 feature;
> > > > +	u8 status;
> > > > +	int ret;
> > > > +
> > > > +	if (len && !buf)
> > > > +		return -EINVAL;
> > > > +
> > > > +	ret = spinand_read_reg_op(spinand, REG_CFG,
> > > > +				  &feature);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* CFG_OTP_ENABLE is used to enable parameter page access */
> > > > +	feature |= CFG_OTP_ENABLE;
> > > > +
> > > > +	spinand_write_reg_op(spinand, REG_CFG, feature);
> > > > +
> > > > +	ret = spi_mem_exec_op(spinand->spimem, &pread_op);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = spinand_wait(spinand, &status);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	ret = spi_mem_exec_op(spinand->spimem, &pread_cache_op);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = spinand_read_reg_op(spinand, REG_CFG,
> > > > +				  &feature);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	feature &= ~CFG_OTP_ENABLE;
> > > > +
> > > > +	spinand_write_reg_op(spinand, REG_CFG, feature);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +    
> > > Add the kernel doc please
> > > 
> > > Change the below function so that it returns 1 if the page was
> > > detected, 0 if it did not, an negative error code otherwise.
> > >     
> > > > +static int spinand_param_page_detect(struct spinand_device *spinand)
> > > > +{
> > > > +	struct mtd_info *mtd = spinand_to_mtd(spinand);
> > > > +	struct nand_memory_organization *memorg;
> > > > +	struct nand_onfi_params *p;
> > > > +	struct nand_device *base = spinand_to_nand(spinand);
> > > > +	int i, ret;
> > > > +
> > > > +	memorg = nanddev_get_memorg(base);
> > > > +
> > > > +	/* Allocate buffer to hold parameter page */
> > > > +	p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
> > > > +	if (!p)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = spinand_parameter_page_read(spinand, 0x01, p, sizeof(*p) *    
> > > 3);    
> > > > +	if (ret) {
> > > > +		ret = 0;    
> > > 
> > > No, you should return the error in case of error. You will later handle
> > > the fact that there is no parameter page.    
> > 
> > okay.
> >   
> > >     
> > > > +		goto free_param_page;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < 3; i++) {
> > > > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) ==    
> > >                                                            ^
> > > If you force the parameter page to be 254 bytes long it means you limit
> > > yourself to ONFI standard. That's not a problem, but then you should
> > > mention it in the function name.    
> > 
> > okay, I will mention in kernel doc.
> >   
> > >     
> > > > +				le16_to_cpu(p->crc)) {
> > > > +			if (i)
> > > > +				memcpy(p, &p[i], sizeof(*p));
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (i == 3) {
> > > > +		const void *srcbufs[3] = {p, p + 1, p + 2};
> > > > +
> > > > +		pr_warn("Could not find a valid ONFI parameter page, trying    
> > > bit-wise majority to recover it\n");    
> > > > +		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
> > > > +				       sizeof(*p));
> > > > +
> > > > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=
> > > > +				le16_to_cpu(p->crc)) {
> > > > +			pr_err("ONFI parameter recovery failed,    
> > > aborting\n");    
> > > > +			goto free_param_page;
> > > > +		}
> > > > +	}    
> > > 
> > > The whole for-loop and the if (i==3) condition is exactly the same as
> > > for raw NANDs and must be extracted in a generic function:
> > > 1/ extract the function from nand/raw/nand_onfi.c and put it in
> > > nand/onfi.c.
> > > 2/ then use it in this patch.

Sounds like a good idea indeed.
  
> > 
> > I have done this intentionally, because in raw NAND case there is function
> > "nand_read_data_op" called inside for-loop. I don't think just for if (i == 3) 
> > it is necessary to create new function.

Well, reading more than just a single param page in a single step
shouldn't hurt. You can let the caller choose the number of page it
wants to read (can be more than 3) and pass this information to the
helper function. You should probably call nand_bit_wise_majority() from
this helper too.

> > 
> > Let me know if you have different opinion.  
> 
> I don't have a strong opinion on that. Boris what do you think? Shall
> we duplicate the code? It's not just about the if condition, it's the
> whole for loop which is very similar.

I think Miquel is right, we shouldn't duplicate this logic.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
