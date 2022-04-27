Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C78C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yzvmiVEvmTw3HV8hYxXiE/hgRXd+/uwi9irTkWYTFk=; b=GgCvUFZBxncvyr
	6jdp8TEbHcFo1zCy79nFPP7pDrTd3+8oIYY1oKbcABRgVRpHRAPxoz+Na+L4fSbrIKmxCHSSebd+B
	s1LzSeqZ+H4pH5bNKXKfEitcldlhHBApriCfV9T2H3zjUF5YO0We87URN4hXpNwMK8FkH0O3y6qVt
	HBnJ5xZT+9eE46bj5FQcV4SMI3L7iSPJJ2H8OFYAhsnGW1RASW9aj4mNJPTemcCntqb4vWqD+dRtB
	SyXo4bAQqF59ksAHi/V8v6Ke8KeWhtWn46eX30tHkT5JZQUgcs1ohqDkP3igpI/78s6CKcwiRM48S
	EbqC7AzLDhyS4zzWIKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nja62-00HSQ4-Ti; Wed, 27 Apr 2022 05:20:14 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nja5z-00HSPY-PC
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 05:20:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R5K1t2034919;
 Wed, 27 Apr 2022 00:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651036801;
 bh=0AmkD8zt2rETd63AIgsc7SZozKwzmYyr6rHa69mBUwo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WDW1LPuemF4RxOvKfA71QVBokXZaSt6nhgVC2U/sj4HOtYLS5anc5V2aRarW9GJYN
 NAHcR2lVVyqI9YuBSSkrGlyYIpW0++dAx+9DaKyFwLIucWhl841Srz/oN3f0ob/U8d
 pxaTfHjA+ikPYVepyAJDZw7t6rtxIB16LhIYk/i4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R5K1DP126433
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Apr 2022 00:20:01 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 00:20:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 00:20:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R5K0LO055716;
 Wed, 27 Apr 2022 00:20:00 -0500
Date: Wed, 27 Apr 2022 10:50:00 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Message-ID: <20220427052000.xmctvowj4kuc727d@ti.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-4-tudor.ambarus@microchip.com>
 <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
 <20220421131657.d6hm7rltyxcb24wo@ti.com>
 <6f81d38b-5e4b-eaf7-0466-3c6fe5e84996@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f81d38b-5e4b-eaf7-0466-3c6fe5e84996@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_222012_006884_EA04E14F 
X-CRM114-Status: GOOD (  30.61  )
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

On 21/04/22 01:41PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 16:16, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 21/04/22 07:18AM, Tudor.Ambarus@microchip.com wrote:
> >> Hi, Pratyush,
> >>
> >> I forgot to remove few checks, would you please remove them when applying?
> >> See below.
> >>
> >> On 4/20/22 13:34, Tudor Ambarus wrote:
> >>> In case spi_nor_match_name() returned NULL, the auto detection was
> >>> issued twice. There's no reason to try to detect the same chip twice,
> >>> do the auto detection only once.
> >>>
> >>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> Reviewed-by: Michael Walle <michael@walle.cc>
> >>> ---
> >>>  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
> >>>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >>> index b9cc8bbf1f62..b55d922d46dd 100644
> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>> @@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> >>>  {
> >>>     const struct flash_info *info = NULL;
> >>>
> >>> -   if (name)
> >>> +   if (name) {
> >>>             info = spi_nor_match_name(nor, name);
> >>> +           if (IS_ERR(info))
> >>> +                   return info;
> >>
> >> As Michael suggested spi_nor_match_name() returns NULL or valid entry, so this
> >> check is not necessary, let's remove them.
> >>
> >>> +   }
> >>>     /* Try to auto-detect if chip name wasn't specified or not found */
> >>>     if (!info)
> >>> -           info = spi_nor_read_id(nor);
> >>> -   if (IS_ERR_OR_NULL(info))
> >>> -           return ERR_PTR(-ENOENT);
> >>> +           return spi_nor_read_id(nor);
> >>>
> >>>     /*
> >>>      * If caller has specified name of flash model that can normally be
> >>> @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>>             return -ENOMEM;
> >>>
> >>>     info = spi_nor_get_flash_info(nor, name);
> >>> -   if (IS_ERR(info))
> >>> +   if (!info)
> >>> +           return -ENOENT;
> >>
> >> also according to Michael, this change is not needed as spi_nor_get_flash_info() can't
> >> return NULL. Here we can keep the code as it was. Let me know if you want me to respin.
> > 
> > TBH I don't think a NULL check here hurts much since the behaviour might
> > change later, and error paths don't get exercised as often. But I have
> 
> I agree, but at the same time we're introducing checks gratuitously. Since
> Michael cared about it, it's fine that we removed it. I don't care too much
> about it.
> 
> > made both changes when applying. You can double-check at [0] if you
> > want.> 
> > [0] https://github.com/prati0100/linux-0day/commit/67d913746833ee54bf4c661040f3ef13657dffd8
> 
> looks good.
> 
> btw: I think this patch
> https://github.com/prati0100/linux-0day/commit/b45bbff85d49529f8daff83c341a292f6c6492ca
> may introduce a regression on some atmel chips. Let me try it please.

Did you get a chance to try this out? If it works fine, I would like to 
apply it.

> > 
> >>
> >>> +   else if (IS_ERR(info))
> >>>             return PTR_ERR(info);
> >>>
> >>>     nor->info = info;
> >>
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
