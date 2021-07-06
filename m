Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A358C07E9B
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CAD6196A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CAD6196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heFR2subH6liP42Eyqla51/1j/H3KQTaNaepdr4wpTM=; b=T6MmclBLW+LyqI
	pzhL2hrsiIOdAV1oOwTHlhGtTMt8uGXJeAAJ7Gofs34f4eBDvGd3eN5+kRBDvqK22/MR+4mmKIsYo
	u+fOknqOVLc70DEb7//qozWJbgJx0pw6XsCj+uwX5QrFqMugZHH0UMxdLvekLrHLgWyHnWzxp+i/4
	nQvz/4WgzwICubGR0DKHpNqRRnOSpWasGrdPgxOdlFon2iFEBpp9/0xI+HE9emjBoCojL1ZkCmsa5
	nk7Lbt6482WgLuGPaiXgMW1mSklYJt1wTjwv7y0h2OF579OEhxiSK2R+pkLnNvR6Pzqk3bwbbPhT/
	rDGQYIOCvK6B417xZGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0erU-00Aafs-Ka; Tue, 06 Jul 2021 06:47:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0emk-00AYn6-RB
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:42:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666fx6P089147;
 Tue, 6 Jul 2021 01:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625553719;
 bh=8/GYp3JY6/Lqd6uDCI0W+X0W0o8r93R616q0ECU9tpQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QaBLgnnIdsRKNoZ0z3DmrXdhV/MN2bv/kzJ7OAOjO82mO/gggsQBbkEjNFPvjhOgW
 dxGn/DaVUQxqLF8ZuMepKJ39hB9hPEamWKCJga/Q36EEh7ZLirJfp6pF3vVPr1e4xt
 yc4aqEAd3AtkGyoY6rybaGJHHAC5OZscIUj7lREY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666fxIa057053
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:41:59 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:41:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:41:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666fwOj112095;
 Tue, 6 Jul 2021 01:41:59 -0500
Date: Tue, 6 Jul 2021 12:11:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Message-ID: <20210706064156.47xp3pe3cicw6nuc@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-7-tudor.ambarus@microchip.com>
 <20210706062806.m63v2kaqkckmwgwx@ti.com>
 <56f48714-b7c5-40c5-d95f-4cbc4c51953f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56f48714-b7c5-40c5-d95f-4cbc4c51953f@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_234223_103631_5A77464A 
X-CRM114-Status: GOOD (  19.97  )
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

On 06/07/21 06:39AM, Tudor.Ambarus@microchip.com wrote:
> On 7/6/21 9:28 AM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 02/07/21 05:41PM, Tudor Ambarus wrote:
> >> Flash does not support continuation codes and may collide with a flash
> >> of other manufacturer, Intersil being an example .
> >>
> >> This flash addition is just for demonstration purposes. As I don't
> >> have the flash, I assumed that it supports SFDP.
> > 
> > I found a datasheet for this flash via Google [0]. It does indeed
> > support SFDP (section 6.36). The data in the SFDP table is not listed so
> > we can't say if it is completely correct though.
> > 
> > I am not sure if we should add support for an untested flash. We ask
> > people to only add tested flashes and I think it is a good principle to
> > stick to.
> > 
> 
> We won't apply it if not tested and without the SFDP tables dump. This applies
> for all the flashes. Chris Morgan (in Cc) proposed to introduce support for this
> flash a while ago. If we get support from Chris, we'll consider applying it, if not,
> not.

Ok. Makes sense.

BTW, I forgot to add the reference [0] earlier. So here it is below.

[0] https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F128BWOIGT_C558846.pdf

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
