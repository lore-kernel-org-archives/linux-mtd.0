Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2E1C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVpy4bpQ70f8MFl0RaqUk2s5R+ubBZBJMEw+0d8/nrI=; b=E3iG1okun5PDN5
	fRdsarl1YC8pYeRfehoBMCrkKbRJkLELFv/Lnxqgm7kIT+SctdB6T3O6a2HxS4uJ4rZ6fU1NNi319
	v0WMZy1XCDpfNbhSrfg2dacS1M5PPeb6Z+mnO7IP46ocyzOTjR0z/3L6QMYLXK37xsqPGp5B2ySPR
	+lhdcueOdplyQKFi3NK4NyM07DgAkGRyIMu8kVhq7koQBNeU9XQPlCdUQMvgba/2iqHfHZBrzTRYm
	keYllrvBEFbTSLwnQU06XN2Fo0dwNJenyu7E7h/w6hx8lmjVecc8RAYUMdA/ZVWorCtiZP6x9a+I2
	e8+OZi3CVXKPvzhDgG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzZ6-004Mc5-Sx; Tue, 30 Nov 2021 09:36:44 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzZ4-004Maq-F7
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 09:36:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AU9aSvb088095;
 Tue, 30 Nov 2021 03:36:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638264988;
 bh=N+Gbrxz85CPm2g1QNSdZgtR2Dpod+ABYilbEGbZO5Vk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=f11y++twHtndHk25Su6Mv+3/Lu8qRYpj0fY7iIWSNqli/sTizzbV0az831WGznz0L
 nPWDgwDhcVJo4iNGWwn8TrkREBTubVLhaCJq+9K+knxRNIPE+NJktul9fE9L2m5vd+
 HyikD39b08tkzACMfG4bVnEBwjc4EXEzhUFZN/vA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AU9aS62050668
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Nov 2021 03:36:28 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 30
 Nov 2021 03:36:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 30 Nov 2021 03:36:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AU9aRFI051313;
 Tue, 30 Nov 2021 03:36:28 -0600
Date: Tue, 30 Nov 2021 15:06:26 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Michael
 Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Add bindings for peripheral-specific SPI
 controller properties
Message-ID: <20211130093624.kc5ivrhzjwfo7rke@ti.com>
References: <20211109181911.2251-1-p.yadav@ti.com>
 <20211129180935.nmymboy336hllly7@ti.com>
 <YaUY1gKnyoOEvo/M@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaUY1gKnyoOEvo/M@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_013642_722695_38CB3878 
X-CRM114-Status: GOOD (  16.99  )
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

On 29/11/21 06:15PM, Mark Brown wrote:
> On Mon, Nov 29, 2021 at 11:39:35PM +0530, Pratyush Yadav wrote:
> > On 09/11/21 11:49PM, Pratyush Yadav wrote:
> 
> > > This is the best approach that I came up with with my limited knowledge
> > > of JSON schema. It has some limitations that are mentioned in patch 1. I
> > > don't know of any better ways to model this. Suggestions are welcome!
> 
> > Do you plan to take this series through your tree or should I poke Mark 
> > about it?
> 
> I'd expect to take it through my tree but please allow a reasonable time
> for reviews...

Sure, thanks. I just wanted to make sure this series didn't fall through 
the cracks if there was some confusion on who is supposed to pick it up.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
