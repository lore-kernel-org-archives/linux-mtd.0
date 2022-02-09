Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5008C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0/TpZzHN0nzq5OHwCEkEMzkElZ1+qczssFy7yiBnSA=; b=Rw+AT1LMMN6Ntb
	OWbhuokIoroK+wQNkrieBxmjKPCXy2bb+oMjaGqKCHLMbXQ1YmgpL1QnerPZ8LYwKRNVV+G5P3JzV
	NqOrf2JKsatcIenT0tL3kjAQ7Rs4sq5SFHu5qIvl0CU0vqTK1CnyFYsiX5EP/D1Tjk+FNp+uO0aPE
	3RFt+Jz+RW3CKaMIywjQQKD8WG1APGJy3QjdsVhydy8ymNayjyea84nrCMRvAcOxT0Dftr3D9dY/Q
	sDStndYI1NuJXknBG7tfNvKKh+/Wcq8zL3THQBdmCJX5C7ndMChjnhWJ5JrErDmoLm0RJnaFac1lt
	1KSrkFmAGy7FtDUte34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnyF-000Mb4-F5; Wed, 09 Feb 2022 14:29:23 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnyD-000Ma7-7t
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 14:29:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 219ET5t3033107;
 Wed, 9 Feb 2022 08:29:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644416945;
 bh=INMBu7PPL0wGBid1gx4F4e097L/7OHc2MPdshLnO7UU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CvnIYOKF4pXBywPyb3NY8+8oqz4Mccnm9sEvHExMjItbQuDBLnlF9eusuvMDfWRFu
 B4z0pcIHac/n9WKeQljUoMt0r3eczMv56NY6FyIs8I2tiAfq7OdmKZl+ru6uzTCnkY
 iDwct/95X0/8RKEtvG/nP1cMbPvNLniOXwW7z/8E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 219ET5x0043742
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Feb 2022 08:29:05 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 08:29:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 08:29:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 219ET41V095968;
 Wed, 9 Feb 2022 08:29:04 -0600
Date: Wed, 9 Feb 2022 08:29:04 -0600
From: Nishanth Menon <nm@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, <broonie@kernel.org>,
 <mhocko@suse.cz>, <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <mm-commits@vger.kernel.org>, Roger Quadros
 <rogerq@kernel.org>, <linux-mtd@lists.infradead.org>, Uwe
 =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Subject: Re: mmotm 2022-02-08-15-31 uploaded (drivers/mtd/nand/raw/Kconfig)
Message-ID: <20220209142904.ye22csd2zh5vynik@stack>
References: <20220208233156.E2CA6C004E1@smtp.kernel.org>
 <b18fc937-9cc2-bb7b-fb58-3ba2555371c7@infradead.org>
 <20220209090300.43241711@xps13>
 <20220209135439.qcyge32xinvazn43@chewer>
 <20220209150703.253b16bd@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209150703.253b16bd@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_062921_372532_BB0B3C4A 
X-CRM114-Status: GOOD (  10.89  )
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

On 15:07-20220209, Miquel Raynal wrote:
Hi Miquel,

> > > Maybe we should have added K3 people in Cc but their MAINTAINERS entry
> > > is incomplete so get_maintainers.pl did not immediately found them.  
> > 
> > What are we missing there?
> 
> Actually nothing is missing, I overlooked the file name. I touched
> arch/arm64/Kconfig.platforms in my patch and of course
> get_maintainers.pl didn't look at the symbol owners. I should have
> checked that myself manually in the first place.

Sure. thanks for cross checking.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
