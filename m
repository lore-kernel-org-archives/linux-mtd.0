Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54855C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 10:19:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C1261055
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 10:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C1261055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0hGfDTg8jAXCDyvmFAfXgu7H1ga8abWK9lt4Ju87cjU=; b=EyhJwkJvOC+nKuRPCt56fMitL
	OvYx4c8fL2nWCroggl1a9YPlgFEvQCIn8Oue7hOku9dxBTnNYZE8uvK15+EwWQfzAs842QGbooDXO
	hFRhg8H2NO+14oBUX7wP1djiYMVPsWsk7WjcS50r5KFDWax++mbHir72OCHC6N6PnsDHGtVGp36Ar
	sBVfZEAODbftXInnCHoh2JPaBcPCYU91PI2ipMKFvTXr8CRj22NtMSwC04pjNWwSUnr0RIXwC4C9M
	g1hq+GfGO1rC9HMJ+mmOnYKL3RtrUFLXCObU1/ThQu1RWZY/yIE5isxcq+paAfqlYhK+iaGHkCthG
	D5v/46bLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuPB-009BVm-KQ; Thu, 01 Apr 2021 10:18:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuP6-009BUI-L2
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 10:18:22 +0000
Received: by mail-pg1-x534.google.com with SMTP id p12so1188212pgj.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=1PmVbiFum68RPm2xjq+wDRFS4IXYN4MWZJ6i3ALZWU4=;
 b=d/lCOOemG6NL8MCwt85vipgBPL/i2M4+xzmiBGNGELY02bQ3t0QMtCsXqh7tLiwuhc
 unGOn4kcGibL2hH93A/30XF6r9aAfhc/JOYCfNlCYKHArMBn47FZ+7kVVI5T8E6gyLOs
 9lgztV5Qd5XeqLy3Wk/pk1KrM21U/+v5PNzK8FAm+Br8rRplgqqvUdcPIoYf51T9iR0a
 9sgYPf7yE28TG2xWpcUDaK78V4SOh5ZUkYONRqBsJDu9Hy89i4qI4r0N1/3W1sar6Kmn
 GVXrhx1J8RUoeYMvHQi4TvvarDu9Cc/tx7b8pMGi+1wWZMRo/1zedoj8Rm5ZifwPB1pG
 2NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1PmVbiFum68RPm2xjq+wDRFS4IXYN4MWZJ6i3ALZWU4=;
 b=rcbtQSekwpyEEwdjHKyYSGn2Z7Tgrimo/Ll1BNRKAt7v1SYSiBx3HH3RScDUU1jTqu
 w2eQjsJBREsf9Z6v2R8CIu/jTK1IEErRXALWBSkNbKtk7QPHKlYmiYm6x4U6EkE/JCZ9
 RHXL0U56iCc1AWWG4psP2+MmSTQRGSE+mbA1rQFKZSJgAXbqMjfuLHSSINnvCz75QkCH
 LaDAloSC1jXyU01USKBAKxNWW75O/UpARUBvdC4u9ESHPL75wkDe7N88Hnkr4Q1rxWLV
 Wa2Gph5rpPH+g/Cxdae5qvZM/3OyyXf/Tbe/xA1FC70nPxGxiDT/J2CMtfmYI0XvQKiU
 7pfQ==
X-Gm-Message-State: AOAM5303VfHlqMWzXxjGzgnue8iwOJTLv8uFEjB2JgKWa9JtMgjd4wh5
 OA8bJM+x4tvGorEVcQj/WYoO
X-Google-Smtp-Source: ABdhPJwlzUpXssxO0iaXnOh6SPVUv2Fl9/ZRgjijDxmMvlWxWPGU/U9gghvonsZI7MR4YFcYZwqiUQ==
X-Received: by 2002:aa7:92cb:0:b029:1f1:542f:2b2b with SMTP id
 k11-20020aa792cb0000b02901f1542f2b2bmr6749779pfa.31.1617272297635; 
 Thu, 01 Apr 2021 03:18:17 -0700 (PDT)
Received: from work ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id s26sm4951297pfd.5.2021.04.01.03.18.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Apr 2021 03:18:17 -0700 (PDT)
Date: Thu, 1 Apr 2021 15:48:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401101812.GE14052@work>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
 <20210323073930.89754-4-manivannan.sadhasivam@linaro.org>
 <20210323175715.38b4740a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323175715.38b4740a@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_111820_832413_2383A4D8 
X-CRM114-Status: GOOD (  56.52  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, Mar 23, 2021 at 05:57:15PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> =

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Tue,
> 23 Mar 2021 13:09:30 +0530:
> =

> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > =

> > The regions are declared using a NAND chip DT property,
> > "secure-regions". So let's make use of this property in the raw NAND
> > core and skip access to the secure regions present in a system.
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 105 +++++++++++++++++++++++++++++++
> >  include/linux/mtd/rawnand.h      |  14 +++++
> >  2 files changed, 119 insertions(+)
> > =

> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/na=
nd_base.c
> > index c33fa1b1847f..2a990219f498 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -278,11 +278,46 @@ static int nand_block_bad(struct nand_chip *chip,=
 loff_t ofs)
> >  	return 0;
> >  }
> >  =

> > +/**
> > + * nand_check_secure_region() - Check if the region is secured
> > + * @chip: NAND chip object
> > + * @offset: Offset of the region to check
> > + * @size: Size of the region to check
> > + *
> > + * Checks if the region is secured by comparing the offset and size wi=
th the
> > + * list of secure regions obtained from DT. Returns -EIO if the region=
 is
> > + * secured else 0.
> > + */
> > +static int nand_check_secure_region(struct nand_chip *chip, loff_t off=
set, u64 size)
> =

> I think I would prefer a boolean return value here, with a rename:
> =

> static bool nand_region_is_secured() or
> nand_region_is_accessible/reachable/whatever()
> =

> then something lik:
> =

> 	if (nand_region_is_secured())
> 		return -EIO;
>

Okay

> > +{
> > +	int i;
> > +
> > +	/* Skip touching the secure regions if present */
> > +	for (i =3D 0; i < chip->nr_secure_regions; i++) {
> > +		const struct nand_secure_region *region =3D &chip->secure_regions[i];
> > +
> > +		if (offset + size < region->offset ||
> > +		    offset >=3D region->offset + region->size)
> =

> I think as-is the condition does not work.
> =

> Let's assume we want to check the region { .offset =3D 1, size =3D 1 } and
> the region { .offset =3D 2, size =3D 1 } is reserved. This is:
> =

> 		if ((1 + 1 < 2) /* false */ ||
> 		    (1 >=3D 2 + 1) /* false */)
> 			continue;
> 		return -EIO; /* EIO is returned while the area is valid

I made a mistake. I should've used "offset + size <=3D region->offset" as
suggested by Boris.

The reason why I didn't go for it because the SoC was still accessing
the secure region with (>=3D). So I went with just (>) blindly :/

The actual issue was with the check at nand_isbad_bbm(), where I didn't
pass the size of the region to check, instead just offset as below:

	nand_check_secure_region(chip, ofs, 0);

Because of this, the check went fine but since the block_bad() function
reads the blocks starting from the offset, the secure region was
accessed.

For fixing this, I'm going to use below diff:

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_b=
ase.c
index 2a990219f498..53589c835f66 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -296,7 +296,7 @@ static int nand_check_secure_region(struct nand_chip *c=
hip, loff_t offset, u64 s
        for (i =3D 0; i < chip->nr_secure_regions; i++) {
                const struct nand_secure_region *region =3D &chip->secure_r=
egions[i];
 =

-               if (offset + size < region->offset ||
+               if (offset + size <=3D region->offset ||
                    offset >=3D region->offset + region->size)
                        continue;
 =

@@ -308,13 +308,16 @@ static int nand_check_secure_region(struct nand_chip =
*chip, loff_t offset, u64 s
 =

 static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 {
+       struct mtd_info *mtd =3D nand_to_mtd(chip);
+       int last_page =3D ((mtd->erasesize - mtd->writesize) >>
+                        chip->page_shift) & chip->pagemask;
        int ret;
 =

        if (chip->options & NAND_NO_BBM_QUIRK)
                return 0;
 =

        /* Check if the region is secured */
-       ret =3D nand_check_secure_region(chip, ofs, 0);
+       ret =3D nand_check_secure_region(chip, ofs, last_page);
        if (ret)
                return ret;

> 		*/
> =

> > +			continue;
> > +
> =

> Perhaps a dev_dbg() entry here would make sense.
> =


Okay

> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> =

> [...]
> =

> > +static int of_get_nand_secure_regions(struct nand_chip *chip)
> > +{
> > +	struct device_node *dn =3D nand_get_flash_node(chip);
> > +	struct property *prop;
> > +	int length, nr_elem, i, j;
> > +
> > +	prop =3D of_find_property(dn, "secure-regions", &length);
> > +	if (prop) {
> =

> I generally prefer the below logic:
> =

> 	if (!prop)
> 		return 0;
> =

> Then you earn an indentation level.
> =

> > +		nr_elem =3D length / sizeof(u64);
> =

> of_property_count_elems_of_size() ?
> =


Okay

> > +		chip->nr_secure_regions =3D nr_elem / 2;
> > +
> > +		chip->secure_regions =3D kcalloc(nr_elem, sizeof(*chip->secure_regio=
ns), GFP_KERNEL);
> =

> IIRC ->secure_regions is a structure with lengths and offset, so you
> don't want to allocate nr_elem but nr_secure_regions number of
> items here.
> =


Oh yeah, I missed it.

> > +		if (!chip->secure_regions)
> > +			return -ENOMEM;
> > +
> > +		for (i =3D 0, j =3D 0; i < chip->nr_secure_regions; i++, j +=3D 2) {
> > +			of_property_read_u64_index(dn, "secure-regions", j,
> > +						   &chip->secure_regions[i].offset);
> > +			of_property_read_u64_index(dn, "secure-regions", j + 1,
> > +						   &chip->secure_regions[i].size);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int rawnand_dt_init(struct nand_chip *chip)
> >  {
> >  	struct nand_device *nand =3D mtd_to_nanddev(nand_to_mtd(chip));
> >  	struct device_node *dn =3D nand_get_flash_node(chip);
> > +	int ret;
> >  =

> >  	if (!dn)
> >  		return 0;
> > @@ -5015,6 +5107,16 @@ static int rawnand_dt_init(struct nand_chip *chi=
p)
> >  	of_get_nand_ecc_user_config(nand);
> >  	of_get_nand_ecc_legacy_user_config(chip);
> >  =

> > +	/*
> > +	 * Look for secure regions in the NAND chip. These regions are suppos=
ed
> > +	 * to be protected by a secure element like Trustzone. So the read/wr=
ite
> > +	 * accesses to these regions will be blocked in the runtime by this
> > +	 * driver.
> > +	 */
> > +	ret =3D of_get_nand_secure_regions(chip);
> > +	if (!ret)
> > +		return ret;
> =

> I think we can do this initialization pretty much when we want in the
> init process as long as it is done before the BBT parsing logic.
> =

> Here, besides the fact the memory will not be freed from
> rawnand_dt_init()'s caller if something goes wrong, we are at a point
> where nand_cleanup will not be called. nand_cleanup() will only be
> called if the controller driver encounters an error *after* a
> successful nand_scan().
> =

> We could perhaps move this call to nand_scan() which would simply solve
> the situation. We don't need it in rawnand_dt_init() as this won't be
> rawnand specific anyway...
> =


Okay, will do.

Thanks,
Mani

> > +
> >  	/*
> >  	 * If neither the user nor the NAND controller have
> > requested a specific
> >  	 * ECC engine type, we will default to
> > NAND_ECC_ENGINE_TYPE_ON_HOST. @@ -6068,6 +6170,9 @@ void
> > nand_cleanup(struct nand_chip *chip) /* Free manufacturer priv data.
> > */ nand_manufacturer_cleanup(chip);
> >  =

> > +	/* Free secure regions data */
> > +	kfree(chip->secure_regions);
> > +
> >  	/* Free controller specific allocations after chip
> > identification */ nand_detach(chip);
> >  =

> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 6b3240e44310..17ddc900a1dc 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1036,6 +1036,16 @@ struct nand_manufacturer {
> >  	void *priv;
> >  };
> >  =

> > +/**
> > + * struct nand_secure_region - NAND secure region structure
> > + * @offset: Offset of the start of the secure region
> > + * @size: Size of the secure region
> > + */
> > +struct nand_secure_region {
> > +	u64 offset;
> > +	u64 size;
> > +};
> > +
> >  /**
> >   * struct nand_chip - NAND Private Flash Chip Data
> >   * @base: Inherit from the generic NAND device
> > @@ -1086,6 +1096,8 @@ struct nand_manufacturer {
> >   *          NAND Controller drivers should not modify this value,
> > but they're
> >   *          allowed to read it.
> >   * @read_retries: The number of read retry modes supported
> > + * @secure_regions: Structure containing the secure regions info
> > + * @nr_secure_regions: Number of secure regions
> >   * @controller: The hardware controller	structure which is
> > shared among multiple
> >   *              independent devices
> >   * @ecc: The ECC controller structure
> > @@ -1135,6 +1147,8 @@ struct nand_chip {
> >  	unsigned int suspended : 1;
> >  	int cur_cs;
> >  	int read_retries;
> > +	struct nand_secure_region *secure_regions;
> > +	u8 nr_secure_regions;
> >  =

> >  	/* Externals */
> >  	struct nand_controller *controller;
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
