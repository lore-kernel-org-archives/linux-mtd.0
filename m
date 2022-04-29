Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2879C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg7YpIdz8Lpb1WpdwT9yoZs4dZmvD90Asxqs7WsMvl8=; b=EBbMId5bvOfeAa
	DC/dodBO1wE9eh6WA9KsfL7STXAgcbn/lJ1mDxGTyT6biWq2/Hq3ZKfepQEs9SqiGJGedr2JNl1Oi
	leOPwkhpYlyk5KCnbNOCJcCYSn3OQ6GlQN/7wewjN7GPbJUs/O2uw7c6f+9MXTxZmAwDpBH3y8oyo
	M8mCmjkS16O3GzaMXCSxpqRHu3Zmrl1HUcjkdhNrvWTQQUUuQD8SfBQ4xPzQXffyogaTvTSmAjOIS
	orZF5hwbluzgNDPtnZnM3/dDW3vtvwm35I+Dfty9NlXWZLH2GhbjAT1C81Nlph5nPtyv6h67GBMey
	dTcugY56Lq/OIVKEAuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJtk-009hy5-JJ; Fri, 29 Apr 2022 06:14:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJth-009hx9-Ok
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 06:14:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23T6EUd9077933;
 Fri, 29 Apr 2022 01:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651212870;
 bh=xXkrQ3q3z0PdAf/m6HeYDXI5BYXEer6eG+MZS/t7BHQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CJlYJhERM3SB4xjH5NOuMbeuATBA2za+toHXAeMzbcojYcENz/qtleUQO0v8bOWnL
 s+KFbenpw0YTQcC7AI/176jA6yf0fiywucv3y/TE1ClpcoU8/3NTNT8m1y8MspAlki
 TLlwN5d4LDNoTNxHVzhXTh7TBmOdLC77HDl6Ma60=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23T6EUiC123358
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Apr 2022 01:14:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Apr 2022 01:14:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Apr 2022 01:14:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23T6ETeq027808;
 Fri, 29 Apr 2022 01:14:29 -0500
Date: Fri, 29 Apr 2022 11:44:28 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Skip setting erase types when
 SPI_NOR_NO_ERASE is set
Message-ID: <20220429061428.uouoycktw2i3qamb@ti.com>
References: <20220308091135.88615-1-tudor.ambarus@microchip.com>
 <20220401200556.d6amfxdvyf66npyj@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401200556.d6amfxdvyf66npyj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_231433_918338_0F2250E0 
X-CRM114-Status: GOOD (  22.96  )
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

On 02/04/22 01:35AM, Pratyush Yadav wrote:
> On 08/03/22 11:11AM, Tudor Ambarus wrote:
> > Even if SPI_NOR_NO_ERASE was specified at flash declaration, the erase
> > type of size nor->info->sector_size was incorrectly set as supported.
> > Don't set erase types when SPI_NOR_NO_ERASE is set.
> 
> Does this have any practical implications? Since we set MTD_NO_ERASE, 
> erase should never be called for this flash anyway, right?
> 
> > 
> > Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: stable@vger.kernel.org
> > ---
> > v2:
> > - add comment, update commit message, split change in individual commit
> > - add fixes tag and cc to stable.
> > 
> >  drivers/mtd/spi-nor/core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index b4f141ad9c9c..64cf7b9df621 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2392,6 +2392,10 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
> >  					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
> >  	}
> >  
> > +	/* Skip setting erase types when SPI_NOR_NO_ERASE is set. */
> > +	if (nor->info->flags & SPI_NOR_NO_ERASE)
> > +		return;

Can you instead do

	if (!(nor->info->flags & SPI_NOR_NO_ERASE)) {
		...
	}

This way when someone adds code to the bottom of this function that sets 
something other than erase types it will execute for flashes with 
SPI_NOR_NO_ERASE as well.

> > +
> >  	/*
> >  	 * Sector Erase settings. Sort Erase Types in ascending order, with the
> >  	 * smallest erase size starting at BIT(0).
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
