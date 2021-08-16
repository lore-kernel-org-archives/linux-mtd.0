Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F21C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:30:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D3360E90
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5D3360E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8N5Sy7FChxfaUXKlScxno0NKPi3vRNy/KsXRcqdtAA=; b=lgD5wPs4nyz+dB
	HGCktfbkf19TQ88upR+aZBTGLOi4PI3M932R1H7aNRtScvezyx26uzQNTUYdE5gBHdr7k/mNcUf9Z
	A/3xLuZLPTApoMjspwXh4YD0LuoVelCuv6eaG5I0tqYXEhSah3srMjBLqwY1F0MXswgq/J08NJneg
	dyd+0VIinJr354WEtCbmjUgXMbMer5BAp42sx3x1hNOa7hQFfjs3wB7gSjwRSsmov5fCaYB8R7e+Q
	hYteSgyzNDwc+RDK6XdrbtJt6EiOVnitj1qI7fVYCKZ18Rme1tEIKglELlXuiNBGbvXRzKvESzUqk
	1uJnREnlYP5QlYnrMxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhMO-00HaLK-4s; Mon, 16 Aug 2021 18:29:20 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhMJ-00HaKI-LJ; Mon, 16 Aug 2021 18:29:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GISeJG030231;
 Mon, 16 Aug 2021 13:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629138520;
 bh=eG3krkhBIqbBv3C0QJHDD4aMM9jgjgHCgs3sm1OduKc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=HPUKYFXtavCygsUL8gBL31Owt2m/Lki1WUSXMuBGkPs+lycenJwH4PSbXWYG/gj77
 oBs5ei4uJRVSPc4Q9KtYChYDvSJUdV09+6P0xHl6m1rAFR5PzGEhTRt1qXbr+caQ5+
 9oRODPGtBuedNATdB51HfUqYBGRhobx5oPkfGKDs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GISeom030364
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 13:28:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 13:28:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 13:28:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GISd1X023086;
 Mon, 16 Aug 2021 13:28:39 -0500
Date: Mon, 16 Aug 2021 23:58:38 +0530
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
Subject: Re: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Message-ID: <20210816182836.oidwlrgoomb2f5kd@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-6-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-6-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_112915_889330_B69FE87D 
X-CRM114-Status: GOOD (  12.92  )
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
> Some manufacturers completely ignore the manufacturer's identification code
> standard (JEP106) and do not define the manufacturer ID continuation
> scheme. This will result in manufacturer ID collisions.
> 
> An an example, JEP106BA requires Boya that it's manufacturer ID to be
> preceded by 8 continuation codes. Boya's identification code must be:
> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores the
> continuation scheme and its ID collides with the manufacturer defined in
> bank one: Convex Computer.
> 
> Introduce the manuf-id-collisions driver in order to address ID collisions
> between manufacturers. flash_info entries will be added in a first come,
> first served manner. Differentiation between flashes will be done at
> runtime if possible. Where runtime differentiation is not possible, new
> compatibles will be introduced, but this will be done as a last resort.
> Every new flash addition that define the SFDP tables, should dump its SFDP
> tables in the patch's comment section below the --- line, so that we can
> reference it in case of collisions.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
