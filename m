Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6F3C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:04:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7034F2072E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HyJ3teov";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W4ta0/Hu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7034F2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1POsK79LO9T1E6qUYvcU0oP9fulTugRV54Ab/c4/Co=; b=HyJ3teovMamnv7nVpnZidar/X
	spRI6YJIv5+dN22aFkobmxyIOJzOyPq5QcCDrzLgImoGFdjcGAC0CpP6B4SCwY6InAcTSisEfJ4F6
	8h9IqYGlELqQpkQixNINncoZNeAFq6I6wyGItQAk3vKm3G/uMkd6MCXBhY6d2SGI5Fqr5tEtZV9am
	mnxuUupV8Wxlo0jCXUxdFgL9lFsAVB2CXqoCHX2+tN348qRz5CyLJzbETAlj12WK8BrVH/LzQ5d49
	6owsVAeRQmZpty7WOInGLzeqPL0Go8mq3PwRg35XTE7RY0dCgQDmtlHxF29T7vnGHJuWuT2cELHci
	lc+w5Z/kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNX5G-0007W5-HT; Wed, 30 Sep 2020 08:03:30 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNX5D-0007Ve-DP
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:03:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U83Mjc007039;
 Wed, 30 Sep 2020 03:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601453002;
 bh=TURRr3OYeVMlDnx4zpyv8iXB01n2XSC3osa95n3/QHU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=W4ta0/Hu0YjOYM7k7PyeWgcqO6DWV+GDnWC9uLyEK3sS4F1oFvo1zDOvHvZEBL7it
 PHPWRCKCx1kz/RyN9/nilOOG2+xho0OB8YLkt6zIzzP7V+m0K1B6NlSSy9VnccDu/t
 FobHBe49TgPCvIoj+/+KelexPYJE0qk9hcfz82YA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U83LTi062209
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 03:03:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:03:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:03:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U83KLX034362;
 Wed, 30 Sep 2020 03:03:20 -0500
Date: Wed, 30 Sep 2020 13:33:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 13/15] mtd: spi-nor: core: expose
 spi_nor_default_setup() in core.h
Message-ID: <20200930080317.hy2h6hlkbaxqea3f@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-14-p.yadav@ti.com>
 <ef62bf4e-1b2c-aa3e-39b7-fd8d118e582d@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef62bf4e-1b2c-aa3e-39b7-fd8d118e582d@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_040327_587518_07D16877 
X-CRM114-Status: GOOD (  23.39  )
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

On 30/09/20 07:51AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Flashes might want to add a custom setup hook to configure the flash in
> > the proper mode for operation. But after that, they would still want to
> > run the default setup hook because it selects the read, program, and
> > erase operations. Since there is little point in repeating all that
> > code, expose the spi_nor_default_setup() in core.h to
> > manufacturer-specific files.
> 
> But you don't use it in the following patches. Can we drop this one for now?

I used it for earlier versions but not for the latest ones. This can be 
dropped for now.

> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 4 ++--
> >  drivers/mtd/spi-nor/core.h | 3 +++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index d5c92c9c7307..34edfcf33172 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2759,8 +2759,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
> >         return 0;
> >  }
> > 
> > -static int spi_nor_default_setup(struct spi_nor *nor,
> > -                                const struct spi_nor_hwcaps *hwcaps)
> > +int spi_nor_default_setup(struct spi_nor *nor,
> > +                         const struct spi_nor_hwcaps *hwcaps)
> >  {
> >         struct spi_nor_flash_parameter *params = nor->params;
> >         u32 ignored_mask, shared_mask;
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index e2c7324d997e..10dc03506f93 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -453,6 +453,9 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> >                              const struct sfdp_bfpt *bfpt,
> >                              struct spi_nor_flash_parameter *params);
> > 
> > +int spi_nor_default_setup(struct spi_nor *nor,
> > +                         const struct spi_nor_hwcaps *hwcaps);
> > +
> >  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
> >  {
> >         return mtd->priv;
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
