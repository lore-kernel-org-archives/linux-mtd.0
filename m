Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0465AC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37DF20B1F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="26C+iaEa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WmMhcXxC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37DF20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=akpleDdAmqQ8G1R954wM9CoEb9bBW3A/iyn35eLb5R4=; b=26C+iaEau7lvPB5fd382PVWBH
	/dpdQ7oDOOD0MSyGovlltrNHKUZm1QKlLx07SZtS+CAFK+KLgtuIpITFo9tcTR9Msh9EVSttPyUN3
	2Zhr5ikg6bo+7vdBZ8kIq9eNn15RpgxDXeb7+Fj2sZdA+hKvAyELuWYX6GNBnWyN+ASbOE5UpXFiE
	fLqPqI2JO2a2hAT72CIxhTDim37VZpda63bpTWwn2qitTKoyh1hbMZ/fwhbYU+IIWf6BS2DyloHKF
	4gqsKnCI3O+EzyHxuyInOJzKk9rOo9VHYg28Yi2fI3Fye7HDjpL6swKqXmUfsGeCk8mxs3xfHBlUu
	opaQbPLfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNuAM-00057a-W3; Thu, 01 Oct 2020 08:42:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuAJ-00056d-Nc
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:42:16 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0918gAlJ021630;
 Thu, 1 Oct 2020 03:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601541730;
 bh=l9E4iTEIYD2L6+jDXJU9JrWEdUYoAxixqNC6l8k2lmI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WmMhcXxCmTEMe5l5Y5vbnXG91qSCEZoHf/sYK4N5bZ/GFvj1uGosuUGy2ELeZInqu
 I0ARLMn5TsLf7yuZLCYxFUqahPy/mu2t6nQLydA/cmTJqe03N8e3t3Xc3G5TVjkx03
 N4b+mDMUqLALzHZYN75IKuf7di29Bci6x74Z8nT0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0918gALN005822
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 03:42:10 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 03:42:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 03:42:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0918g9sl030651;
 Thu, 1 Oct 2020 03:42:09 -0500
Date: Thu, 1 Oct 2020 14:12:08 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v14 08/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Message-ID: <20201001084206.ma4beblucowmtwgq@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-9-p.yadav@ti.com>
 <3e162719-80c7-03dc-dc2a-29a46bc4cb2c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e162719-80c7-03dc-dc2a-29a46bc4cb2c@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_044215_881543_2854D4E3 
X-CRM114-Status: GOOD (  23.47  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/20 08:09AM, Tudor.Ambarus@microchip.com wrote:
> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> > whenever possible to get optimal transfer speeds.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
> >  drivers/mtd/spi-nor/core.h |  2 ++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 73a26e7e32c2..6b54a923002a 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3068,6 +3068,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
> >         return 0;
> >  }
> > 
> > +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
> > + * @nor:                 pointer to a 'struct spi_nor'
> > + * @enable:              whether to enable or disable Octal DTR
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +       int ret;
> > +
> > +       if (!nor->params->octal_dtr_enable)
> > +               return 0;
> > +
> > +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> > +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> > +               return 0;
> > +
> > +       ret = nor->params->octal_dtr_enable(nor, enable);
> 
> Ideally patch 9/15 and 10/15 should have been before 8/15. We should deny
> the access to octal dtr enable for NV flashes since moment 0.

Ok. I'll re-order them.
 
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (enable)
> > +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> > +       else
> > +               nor->reg_proto = SNOR_PROTO_1_1_1;
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * spi_nor_quad_enable() - enable Quad I/O if needed.
> >   * @nor:                pointer to a 'struct spi_nor'
> > @@ -3107,6 +3136,12 @@ static int spi_nor_init(struct spi_nor *nor)
> >  {
> >         int err;
> > 
> > +       err = spi_nor_octal_dtr_enable(nor, true);
> > +       if (err) {
> > +               dev_dbg(nor->dev, "octal mode not supported\n");
> > +               return err;
> > +       }
> > +
> >         err = spi_nor_quad_enable(nor);
> >         if (err) {
> >                 dev_dbg(nor->dev, "quad mode not supported\n");
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 9a33c8d07335..5cfe2db9ee13 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -203,6 +203,7 @@ struct spi_nor_locking_ops {
> >   *                      higher index in the array, the higher priority.
> >   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
> >   *                      Table.
> > + * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
> >   * @quad_enable:       enables SPI NOR quad mode.
> >   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
> >   * @convert_addr:      converts an absolute address into something the flash
> > @@ -226,6 +227,7 @@ struct spi_nor_flash_parameter {
> > 
> >         struct spi_nor_erase_map        erase_map;
> > 
> > +       int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
> >         int (*quad_enable)(struct spi_nor *nor);
> >         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
> >         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
> > --
> > 2.28.0
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
