Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07D9C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FA160240
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81FA160240
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIWzJQEk+yMQyrMiMMeX34A3TFlwB3R9uaW/MkOPV3E=; b=NWJ8n5xhILUuWA
	eaQ7/W3Tf59sijVz8BI6GPeERSoVC/Vp8A13RHJsLmS4kDmrSvXOTdo2vrjKcVA3rlt09O8eXOJG4
	KlFlrpk1XsN2pGR+nWAfoRvdncmmGhKS8ttk94GEHtmVTi176GrZY9o8t6MiwUuma4eciRXN/nPJ1
	KOrgfkAJ8lczIiUbhN6aRtE3ef+SMbV/LT9DH8nuUUSiXUG1R5y2dw49kPq/oOXRdhvG4ZGhRsbxr
	LeYHcMpqOrYvLBsNyibimOVxC9kblsRBXZVEdIJZqMdHROIpzFNcih5YKHv8ETvUGC/JvnDBzZ4Zp
	6DLcnLodbu/Fg2uAGjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhcD-0000tQ-Ji; Mon, 16 Aug 2021 18:45:41 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhc8-0000s4-Mj; Mon, 16 Aug 2021 18:45:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GIjCh3094118;
 Mon, 16 Aug 2021 13:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629139512;
 bh=eMswC0kqw47ovDQI59iAFSRPofbMplsaX8miCv5feIM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=cMADYU037H7uX15xWgeUp9sA4HfAYIw2T7ERXobI31+GtpBoTtB871HPrQLuZWdBt
 euCxkVtPr2mc8LAcaAq+cDLdPj1I9Wa64Z7eAW8EGL/9edGtPfpEG8lAZKs+W7SJCl
 f6PzB1I0o4x75AfcyP7RZ0rMZc2HmG7uyGFfk7Zs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GIjCqd038703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 13:45:12 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 13:45:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 13:45:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GIjAMD052223;
 Mon, 16 Aug 2021 13:45:11 -0500
Date: Tue, 17 Aug 2021 00:15:10 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 07/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xm25qh64c
Message-ID: <20210816184508.jbgix66frh6m3dqs@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-8-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-8-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_114536_865731_BD8E0A33 
X-CRM114-Status: GOOD (  16.27  )
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

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> Flash ignores the manufacturer continuation codes and is likely to
> collide with other manufacturers flashes.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Do not apply without the SFDP tables hexdump.

... and all the other sysfs params that we usually ask for. See 
Michael's replies on patch 35.

> 
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
> index db31470ebf6a..f3ba00d17c68 100644
> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -14,6 +14,9 @@ static const struct flash_info id_collision_parts[] = {
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  
> +	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
> +	{ "xm25qh64c", INFO(0x204017, 0, 64 * 1024, 128, SPI_NOR_PARSE_SFDP) },
> +
>  	/* XTX (XTX Technology Limited) */
>  	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
>  			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
