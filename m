Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407DFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kdOQm2Ew83wsoI0MOOGndsa9RuQaZW+awQnSuSVs5U=; b=PfQCB3y8G5LdCY
	KICMZlngkVXOlyD/g8BwZ4oUXPEb3NWsFo1n0DYfn1CtD/arMzNbBuFzbuuIR+ZKPM1+ZfB6MLAax
	t9OIM3aHcJhrNvTjOVtOTL+u2ZA4ixbB54DxcUy+KaKUzWWTvsu3qFpGh2eQrrxjzpd0+auuyw7bq
	VG84xgqKDnBfdwF3oSrG2Lu+IP9dfaSwtb5cS07eajCSk0HebbnLdPrb9Vm+STRBg5qtK/yi83cpF
	fobyEGeBh/eT91SNNi2PcX98t7r8oUCR18iTluV24nYaBAUPjbI/t5YwaWouR+uD+brcqjIwnpf5H
	iyqHoepSbSpSyqP3NbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZdOb-00HCEi-5t; Wed, 30 Mar 2022 18:50:17 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZdOU-00HCCv-7J
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 18:50:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UIo7dm071042;
 Wed, 30 Mar 2022 13:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648666207;
 bh=7yPkmWB7RA4x9BG7N2bncDXE8QQhEKBOp2TyXWFgNt0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dgPQiKqtGB2GyjIYKeuZUTbFtbKGiXGF70KJwLPBiFDNb4wmuWsEkVL2nBChoeUHu
 S8RhzWb9TyhlkhRgNEN2vU/SuHCmoZqLdak8EfdDRdiQQ8VFIJMxyXpECQqXT5AwqQ
 km0tAIDN052vZfYfhf3OpHIKWyBO7L0L6SBW6CF4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UIo7qs040142
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Mar 2022 13:50:07 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 13:50:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 13:50:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UIo656124238;
 Wed, 30 Mar 2022 13:50:06 -0500
Date: Thu, 31 Mar 2022 00:20:05 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <Tudor.Ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
Message-ID: <20220330185005.ohsb4bczuyav7xzs@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-4-tudor.ambarus@microchip.com>
 <20220321121455.bpql7x4ebhq7s36l@ti.com>
 <b4e8c044-f16a-a72d-6047-c42cdcc253f1@microchip.com>
 <20220321174251.ehhobu26tgoxrbps@ti.com>
 <148e6c16421e6a94a2ee41fa251130df@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <148e6c16421e6a94a2ee41fa251130df@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_115010_405265_61DFE554 
X-CRM114-Status: GOOD (  39.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/03/22 11:38PM, Michael Walle wrote:
> Am 2022-03-21 18:42, schrieb Pratyush Yadav:
> > On 21/03/22 12:50PM, Tudor.Ambarus@microchip.com wrote:
> > > On 3/21/22 14:14, Pratyush Yadav wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > >
> > > > On 28/02/22 01:17PM, Tudor Ambarus wrote:
> > > >> In case spi_nor_match_name() returned NULL, the auto detection was
> > > >> issued twice. There's no reason to try to detect the same chip twice,
> > > >> do the auto detection only once.
> > > >>
> > > >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > >> ---
> > > >>  drivers/mtd/spi-nor/core.c | 10 ++++++----
> > > >>  1 file changed, 6 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > > >> index f87cb7d3daab..b1d6fa65417d 100644
> > > >> --- a/drivers/mtd/spi-nor/core.c
> > > >> +++ b/drivers/mtd/spi-nor/core.c
> > > >> @@ -2894,13 +2894,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
> > > >>  static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> > > >>                                                      const char *name)
> > > >>  {
> > > >> -     const struct flash_info *info = NULL;
> > > >> +     const struct flash_info *info = NULL, *detected_info = NULL;
> > > >>
> > > >>       if (name)
> > > >>               info = spi_nor_match_name(nor, name);
> > > >>       /* Try to auto-detect if chip name wasn't specified or not found */
> > > >> -     if (!info)
> > > >> -             info = spi_nor_read_id(nor);
> > > >> +     if (!info) {
> > > >> +             detected_info = spi_nor_read_id(nor);
> > > >> +             info = detected_info;
> > > >> +     }
> > > >>       if (IS_ERR_OR_NULL(info))
> > > >>               return ERR_PTR(-ENOENT);
> > > >>
> > > >> @@ -2908,7 +2910,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> > > >>        * If caller has specified name of flash model that can normally be
> > > >>        * detected using JEDEC, let's verify it.
> > > >>        */
> > > >> -     if (name && info->id_len) {
> > > >> +     if (name && !detected_info && info->id_len) {
> > > >>               const struct flash_info *jinfo;
> > > >>
> > > >>               jinfo = spi_nor_read_id(nor);
> > > >
> > > > I think the flow can be a little bit better. How about:
> > > >
> > > >         if (name)
> > > >                 info = spi_nor_match_name();
> > > >
> > > >         if (!info) {
> > > >                 info = spi_nor_read_id();
> > > >                 if (IS_ERR_OR_NULL(info))
> > > >                         return ERR_PTR(-ENOENT);
> > > >
> > > >                 return info;
> > > >         }
> 
> +1 for the flow. But is it correct that we just ignore any former
> error and just replace it with ENOENT? Should we return NULL here
> and let the caller handle the translation from NULL to ENOENT (and
> keeping any other errors)
> 
> > > 
> > > Here we miss the IS_ERR check in case info is retrieved with
> > > spi_nor_match_name().
> > > Do you expect spi_nor_match_name() to ever return an error? As it is
> > > now it doesn't.
> > > I'm fine either way. In case you want me to follow your suggestion,
> > > give me a sign
> > > and I'll make a dedicated patch to move the IS_ERR_OR_NULL check.
> > > Will add your
> > > Suggested-by tag.
> > 
> > I think it should be safe to assume it won't ever return an error since
> > all it does is iterate over an array that is always present. I don't see
> > that changing in the foreseeable future either. So I think not having
> > the IS_ERR check is fine.
> 
> But what does it cost to just add the error check now so it won't
> be forgotten in the future?
> 
>          if (name) {
>                  info = spi_nor_match_name();
>                  if (IS_ERR(info))
>                          return info;
>          }
>          if (!info)
>                   return spi_nor_read_id();
> 
>          <flash model check code follows here>
> 
> And then let the caller handle NULL and translate it to ENOENT.

Sounds good to me.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
