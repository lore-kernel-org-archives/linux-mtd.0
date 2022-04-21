Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78BFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJJEMH1pZD3UMmOgw/qIoYAyNHM+65TKuZ1HRSNOcC0=; b=hagpIg5UdjPr3s
	OFEuaQmZLA8y4p09P5VapbglYVJINp6acKhIOSXHUiX3ppFu+ci3NqsnDVfu8U1V5TX37fyQYG5kA
	gzULqt1TW+sPu95hb/8P8NzLdQxO/psvXJLUWrrP+Jc6RRNxbBtYb2FHkK1nzvKSfM4VUFVCqgqQw
	5105xyF7IfIjGV0j9RrcOQRKq9J5MNwnSBEptb90OixB1tDBgf5aKYpwKW+pJxjj+H3v1u6ijtX0H
	vOX/CnyMy+fdtAVIVNnYGj9Ip7G71EBj1uqNL6eAbn+0xjut6uvXCHxwCCJlPBC5XVJNPxBuTWQ48
	YbswV4gFzs/V5/ifRgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhWgI-00DWRf-PC; Thu, 21 Apr 2022 13:17:10 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhWgF-00DWQy-Sb
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:17:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LDGwnA039803;
 Thu, 21 Apr 2022 08:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650547018;
 bh=9gasxuhjKsknOjBQ7Lu0eRSpIFqA65jpKhr8t+Z92rs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=wkCDCNWX3QlDsP3307ZTUwvtFHweDdbWEHsJs2a72zcdNkLK07ekZ/vmh+5VuA2vY
 zJ1oKiXIhQ8Pv6Tq5WoxJo9v+6CezzjFyeLpd1WXt4YbTEC7aqjLj9AJzYFbLyAzHf
 5j5c9ETuYBUxbOXQZiyXF/FG3unNOs57PD/It1TE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LDGwH3064946
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Apr 2022 08:16:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 08:16:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 08:16:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LDGvQk073404;
 Thu, 21 Apr 2022 08:16:58 -0500
Date: Thu, 21 Apr 2022 18:46:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Message-ID: <20220421131657.d6hm7rltyxcb24wo@ti.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-4-tudor.ambarus@microchip.com>
 <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_061708_138158_15C976EE 
X-CRM114-Status: GOOD (  25.91  )
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

On 21/04/22 07:18AM, Tudor.Ambarus@microchip.com wrote:
> Hi, Pratyush,
> 
> I forgot to remove few checks, would you please remove them when applying?
> See below.
> 
> On 4/20/22 13:34, Tudor Ambarus wrote:
> > In case spi_nor_match_name() returned NULL, the auto detection was
> > issued twice. There's no reason to try to detect the same chip twice,
> > do the auto detection only once.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Reviewed-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index b9cc8bbf1f62..b55d922d46dd 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> >  {
> >  	const struct flash_info *info = NULL;
> >  
> > -	if (name)
> > +	if (name) {
> >  		info = spi_nor_match_name(nor, name);
> > +		if (IS_ERR(info))
> > +			return info;
> 
> As Michael suggested spi_nor_match_name() returns NULL or valid entry, so this
> check is not necessary, let's remove them.
> 
> > +	}
> >  	/* Try to auto-detect if chip name wasn't specified or not found */
> >  	if (!info)
> > -		info = spi_nor_read_id(nor);
> > -	if (IS_ERR_OR_NULL(info))
> > -		return ERR_PTR(-ENOENT);
> > +		return spi_nor_read_id(nor);
> >  
> >  	/*
> >  	 * If caller has specified name of flash model that can normally be
> > @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  		return -ENOMEM;
> >  
> >  	info = spi_nor_get_flash_info(nor, name);
> > -	if (IS_ERR(info))
> > +	if (!info)
> > +		return -ENOENT;
> 
> also according to Michael, this change is not needed as spi_nor_get_flash_info() can't
> return NULL. Here we can keep the code as it was. Let me know if you want me to respin.

TBH I don't think a NULL check here hurts much since the behaviour might 
change later, and error paths don't get exercised as often. But I have 
made both changes when applying. You can double-check at [0] if you 
want.

[0] https://github.com/prati0100/linux-0day/commit/67d913746833ee54bf4c661040f3ef13657dffd8

> 
> > +	else if (IS_ERR(info))
> >  		return PTR_ERR(info);
> >  
> >  	nor->info = info;
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
