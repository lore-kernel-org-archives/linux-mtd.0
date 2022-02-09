Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1103AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEJ0UZau2WFjbyBSwjUbtOQ1zRtcX5tmGMx/QWXqc8U=; b=q93CGnWLm7v6Ek
	m6u4HkYcZv50CQq9Ds1l2B9rnsxbQ6sVuOjiChvhKpHoHJno4uI+51rz8LYC5b/olnGQ0dU9M65Y/
	F/2G2oIfrI0a6h2IP4vt5XT3UWpHKMkxw1K+EVhmkNvAqP7oHflz5KpDuxJ5xa52a4wVEGMHUaQdr
	cI+hTXbew7t4I7A5P74nWVqFR4q09glvb+YP2hjZoJ42LrTEMzxTYIRZBvVXno5XieVDKbKVBe7pD
	aZt5wxAMrVPx0VKjlYbvBMp/ZkpiUwKjS3TkTbkxsLDEOySVs+tT/rLP/0oP0jwK5y0poIGEFy4VF
	LHy2b5txCSf1B0Bygsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHomY-000Xhf-0i; Wed, 09 Feb 2022 15:21:22 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHomU-000XgH-M1; Wed, 09 Feb 2022 15:21:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 219FL7m2050630;
 Wed, 9 Feb 2022 09:21:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644420067;
 bh=x8CHErw85oTq1LwE40VoUbtkQlKTvz9zxt4GS+SbkLw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Edux0JQjypwqPrtL8iCbEBP2jOQ6+KxzO/Ais9o3gsCBsdyTS1/+itkviM+djYtQl
 ysZ+O6DE49Q/V/Bu0pAM9jQJV5HpP/LPtGpSmzpP9C06crmNDny6BUlk/WTK+AFV7c
 odIQbnwCWdWsmJbOoxmVWvv/ROudBFjwWBwdQOWA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 219FL7Ne084458
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Feb 2022 09:21:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 09:21:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 09:21:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 219FL7rg008725;
 Wed, 9 Feb 2022 09:21:07 -0600
Date: Wed, 9 Feb 2022 09:21:07 -0600
From: Nishanth Menon <nm@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Uwe
 =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/memory: omap: Fix build dependencies
Message-ID: <20220209152107.5h2zpcpe5gyqwmuj@bottom>
References: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
 <20220209135732.fig35edxzgwdgugd@those>
 <7572e50b-3e6b-2888-a9e0-3ca5020c7e0e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7572e50b-3e6b-2888-a9e0-3ca5020c7e0e@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_072118_832892_C9E73E5B 
X-CRM114-Status: GOOD (  14.37  )
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

On 16:39-20220209, Roger Quadros wrote:
> >>  config OMAP_GPMC
> >>  	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> >> -	depends on OF_ADDRESS
> > 
> > Thoughts Roger?
> 
> OMAP_GPMC is not visible entry so someone has to select it.
> We first tried selecting it in ARCH_K3 but that was not accepted for fair reason.
> Then we tried to select it from MTD_NAND_OMAP2 and it caused the issue this patch is trying to fix.
> 
> Only other option left is to make OMAP_GPMC a visible entry and just mark MTD_NAND_OMAP2 to depend on it?
> The relevant SoC defconfig files can enable OMAP_GPMC and MTD_NAND_OMAP2.
> 
> Does this sound ok?

Given that of_address.h is handling OF_ADDRESS smartly, and the fact
that there are quite the many drivers that are actually OF only, I am
not entirely sure why the dependency is needed in Kconfig, but that is
just me..

I'd suggest to see with the randconfig that Randy provided in [1]


[1] https://lore.kernel.org/all/b18fc937-9cc2-bb7b-fb58-3ba2555371c7@infradead.org/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
