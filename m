Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CB8C64E90
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 13:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742E12084C
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 13:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3HrMGNs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u2RCJkWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742E12084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PdMqlMHuZqH4QF3pwGr4/Wf208Duu62m3PxN5rIya68=; b=D3HrMGNsXpE3JUJnrDNP9tdyn
	3HP25Qm4uHgO+547/GSgPgTHY7KMj//GOjr5CdxQPpuH3poZhMInZTFXL6OFJ0dGUrbHnmp7IgXe5
	87K1HXgujkYnHpkK6zRmyjmAdj0j0mZ3gtTQpEtHTWZiud277zm/aDaoAWCL3al3pyG3R1TDas5e/
	RM/kqP4qc8H9CJtqxRdt62HWuKm2aJiMLvUzPSGzJs6PIvOchLkDy7wn1QxZCrc5uV9/TiehJySz3
	VIYVLyJlaCS6kbUE6KKHPoxdItDK/Wy2SO/3fqmSefFc5SIKjOnr9MOWU2rR25YE5bPyD0ShrB+Dp
	oYMf5rZtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjj0F-0006E9-Hh; Mon, 30 Nov 2020 13:14:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjj0B-0006Bs-MN
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 13:14:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUDDrqr083502;
 Mon, 30 Nov 2020 07:13:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606742033;
 bh=ZMa7CqsWs8Y1MDXPkyCW/iCcme+i36HSODQwwL5Sy1U=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=u2RCJkWeoVqW5E56guTFni9BdpbnN9arVSBMfgEg8K6DdNwzNZmhALND+NMvZE18k
 BfVLvWnOsatGgQJYj/zg/8N0VSSBLnWIzLbJCIZyl5Aexd1CUMLAe9+KLSFLLS+ooQ
 0GOehTkS6O5I4i0QvYpzg/803eNmr6s1thziJlRo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUDDrYp046597
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 07:13:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 07:13:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 07:13:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUDDq4q044478;
 Mon, 30 Nov 2020 07:13:53 -0600
Date: Mon, 30 Nov 2020 18:43:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
Message-ID: <20201130131350.spqvde2al4ajf4fz@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201118182459.18197-3-p.yadav@ti.com>
 <939dcad9-b556-ea3e-9eca-c008a86fd01b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <939dcad9-b556-ea3e-9eca-c008a86fd01b@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_081359_877156_BAC587F1 
X-CRM114-Status: GOOD (  28.87  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/11/20 10:59AM, Tudor.Ambarus@microchip.com wrote:
> On 11/18/20 8:24 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Some flashes like the Cypress S28 family use ECC. Under this ECC scheme,
> > multi-pass writes to an ECC block is not allowed. In other words, once
> > data is programmed to an ECC block, it can't be programmed again without
> > erasing it first.
> > 
> > Upper layers like file systems need to be given this information so they
> > do not cause error conditions on the flash by attempting multi-pass
> > programming. This can be done by setting 'writesize' in 'struct
> > mtd_info'.
> > 
> > Set the default to 1 but allow flashes to modify it in fixup hooks. If
> > more flashes show up with this constraint in the future it might be
> > worth it to add it to 'struct flash_info', but for now increasing its
> > size is not worth it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> > 
> > Notes:
> >     New in v2.
> > 
> >  drivers/mtd/spi-nor/core.c | 4 +++-
> >  drivers/mtd/spi-nor/core.h | 3 +++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 5bee7c8da4dc..80fbcb9c0828 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3054,6 +3054,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
> >         if (!nor->params)
> >                 return -ENOMEM;
> > 
> > +       nor->params->writesize = 1;
> > +
> 
> please do default inits in spi_nor_info_init_params(). A good place would be:
> 
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2885,6 +2885,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>         nor->flags |= SNOR_F_HAS_16BIT_SR;
>  
>         /* Set SPI NOR sizes. */
> +       params->writesize = 1;
>         params->size = (u64)info->sector_size * info->n_sectors;
>         params->page_size = info->page_size;

Ok.
 
> 
> >         spi_nor_info_init_params(nor);
> > 
> >         spi_nor_manufacturer_init_params(nor);
> > @@ -3430,7 +3432,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >                 mtd->name = dev_name(dev);
> >         mtd->priv = nor;
> >         mtd->type = MTD_NORFLASH;
> > -       mtd->writesize = 1;
> > +       mtd->writesize = nor->params->writesize;
> >         mtd->flags = MTD_CAP_NORFLASH;
> >         mtd->size = nor->params->size;
> >         mtd->_erase = spi_nor_erase;
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 0a775a7b5606..413ea311e632 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -197,6 +197,8 @@ struct spi_nor_locking_ops {
> >   * @rdsr_dummy:                dummy cycles needed for Read Status Register command.
> >   * @rdsr_addr_nbytes:  dummy address bytes needed for Read Status Register
> >   *                     command.
> > + * @writesize          Minimal writable flash unit size. Defaults to 1. Set to
> > + *                     ECC unit size for ECC-ed flashes.
> >   * @hwcaps:            describes the read and page program hardware
> >   *                     capabilities.
> >   * @reads:             read capabilities ordered by priority: the higher index
> > @@ -222,6 +224,7 @@ struct spi_nor_flash_parameter {
> >         u32                             page_size;
> 
> I would put writesize before or after page_size, because they are related.
> Also, it would probably avoid padding.

Ok.
 
> With these addressed, one can add:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Thanks.
 
> >         u8                              rdsr_dummy;
> >         u8                              rdsr_addr_nbytes;
> > +       u32                             writesize;
> > 
> >         struct spi_nor_hwcaps           hwcaps;
> >         struct spi_nor_read_command     reads[SNOR_CMD_READ_MAX];
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
