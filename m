Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FDAC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4B961945
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4B961945
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYEP8ahAAhr0+bO86qyyyjju3XaS8Z4BvL7vKB8+txQ=; b=zS7CkqKtB8lBGe
	WaSC2hBnh7JwfwjZErz26OTemedL1s8+MlOHKvXlvoROs6Vm/A/2H9QoHBQhHjrjYrCCa1CU8Wsz0
	Boq+6WDqtWGV/RMU5UJnziSpsyHZa8yluMhJbPqSAiaoCjq9hujH6PCSUTSiVZkSOSmxAuuBe25G7
	3eCzcNnGLXV9TcfepbJpNpvTZmDuxzoC7wDhhHMyLycqNPqnm8a+S5zG7dd/tCc+PN2uBVej2OL1k
	DgEnz5vd6g3mx1POmv+ve8vMConTpKNSNzvO8V1nZhtvWmjU6fDSbKb72sNJ9Y1kJ185gftGNSi2+
	s8eXDOl2ov3mPu5DFBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0epe-00Aa2x-Ru; Tue, 06 Jul 2021 06:45:23 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ekd-00AXqK-4w
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:40:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666doZZ016171;
 Tue, 6 Jul 2021 01:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625553590;
 bh=XjjmIAxbxBZDCeoTZqJ2+ChnO6P3rfJzXgcFIHwyKk4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=OX+bgLMLmIvXVzmRK+XoPkpfaA7WC2G7/9Pfg9LnIvKM8RnFGAI2F7iNHsxQ3jbMR
 DqKFqDHs37ouRjrWX9/hqpwB1IaJeXWXWpYMpHMsEIwvhWC2hS1nsmUxNhK/zddRT7
 HQ+nRGttlZ+vFOO5K89bCrNv88+sIxzafeMsLYHM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666doZR054552
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:39:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:39:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:39:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666dmx2051160;
 Tue, 6 Jul 2021 01:39:49 -0500
Date: Tue, 6 Jul 2021 12:09:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of
 ID collisions
Message-ID: <20210706063946.opvrwdp34mmt4snf@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
 <20210705131328.ik765ywjryr44pyv@ti.com>
 <579514fe-3134-c964-48ac-af729c4ccffc@microchip.com>
 <20210705160950.yaablyujefffhz7o@ti.com>
 <8653c22e-09ef-6457-819e-636249840149@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8653c22e-09ef-6457-819e-636249840149@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_234011_353041_9C189302 
X-CRM114-Status: GOOD (  35.51  )
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

On 06/07/21 05:19AM, Tudor.Ambarus@microchip.com wrote:
> On 7/5/21 7:09 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 05/07/21 01:24PM, Tudor.Ambarus@microchip.com wrote:
> >> On 7/5/21 4:13 PM, Pratyush Yadav wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On 02/07/21 05:41PM, Tudor Ambarus wrote:
> >>>> Provide a way to report the correct flash name in case of ID collisions.
> >>>> There will be a single flash_info entry when flash IDs collide, and the
> >>>> differentiation between the flash types will be made at runtime
> >>>> if possible.
> >>>
> >>> I am not sure if having one entry for all flashes with a collision is a
> >>> good idea. For example, say we have one flash which supports SFDP and
> >>> that's all we need for it. Another flash with the same ID does not
> >>> support SFDP so it needs the SPI_NOR_DUAL_READ, etc. flags. How would
> >>> you handle this case with the same entry? You would have to set all the
> >>> flags in the disambiguation function. And nor->info is declared as const
> >>> so you can't change the flags in there. Any code checking for
> >>> info->flags would not work properly for these type of flashes. Wouldn't
> >>> it be better to have multiple entries with the same ID and just pick the
> >>> one we need in the disambiguation function?
> >>
> >> Your scenario is hit in patches 3/7 and 4/7. In case of ID collisions between
> >> a SFDP and a non-SFDP compliant flash, I propose to set SPI_NOR_PARSE_SFDP, as
> >> well as all the other required flash info flags that statically init the flash.
> >> The SFDP flash will init all its NOR flags at runtime, while the non-SFDP flash
> >> will issue a RDSFDP command that will fail, and then it will init all the NOR
> >> flags based on the flash info flags.
> > 
> > spi_nor_info_init_params() is called before spi_nor_sfdp_init_params().
> > So if flash A sets SPI_NOR_QUAD_READ, flash B will also inherit it even
> > though it might not actually support quad mode reads. You would need to
> > refactor the parameter initialization path to do SFDP first and skip the
> > flags based init.
> > 
> > But that doesn't solve all the problems. What about the flags that can't
> > be discovered by SFDP? I see SPI_NOR_NO_ERASE, SPI_NOR_BP3_SR_BIT6, etc.
> > that are not set by the SFDP path. Some of those might be discoverable,
> > and we just don't do it yet, but I am not convinced all of them can be.
> > For example, I don't see any way to discover SPI_NOR_NO_ERASE via SFDP.
> > Erase type 1 field in BFPT is not optional and has to be specified.
> > 
> > How will you differentiate from the SFDP-discoverable and
> > non-SFDP-discoverable flags? How can you which belongs to which flash? I
> > know this is a bit far fetched but let's solve this problem once and for
> > all.
> > 
> 
> Yeah, that's my goal, to solve all these once and for all. I've started working on it,
> and refactored the params init sequence. I have a WIP branch at:
> https://github.com/ambarus/linux-0day/commits/spi-nor/next-id-collisions.
> I'll post everything after I finish, we can ignore all this for the moment.

Fair enough. Let's pick this topic up again once you have everything 
ready.

> 
> Thanks Pratyush for your insights!

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
