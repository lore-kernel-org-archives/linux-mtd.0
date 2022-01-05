Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E532C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 05:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYIwcy/8PPd12FWjbyrB3ur11+PFwXVZxOgbs+Wtyvg=; b=HZUsnjgRgrifG/
	j2qWde4QEJ6aYUk5wR5Xprv36itT5Ca+YVeeLNmFvHv89vqyaRZTSDQ4eDbigZROaBi2khhGlnQsM
	b5FEerKqlNz0Kk9ERvE8Nk0J/Hp2TqbYr6ta4nWR+Z2skeTDiNtmWfakijTdaFI0PKh+O5jrZSKIX
	Px3St/+oAAT77sr9vO60DpKeKcZNsaHdOrJj29rJJtBGvAX9G5bZ+wgLY862z24nIYfpgbkYEnRP0
	YbXA4uuusUOMpLW14BdB2rsGHjMsP1bMQL9CB27fPe2F5SmkLYPZSHrUdOmjUaQsxUeA11eKrBuZc
	cHt2tdtBXaN5qt3ZXtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4zEU-00Dc3E-Tl; Wed, 05 Jan 2022 05:53:10 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4zES-00Dc2h-DM
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 05:53:09 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2055r0Ad001334;
 Tue, 4 Jan 2022 23:53:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641361980;
 bh=/WMiPucFmgFtZ2e4Rr8TyX/mCLA1MdVKUZrRErTD3Es=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=j6msjA9nyx23L4TJshzpZD9mEJWM85Y2JaFXcDAqnKzYQjGmA9FtvZwtozIsYsW9q
 wlSLCg0oQO11Agwr+tZgOBUbZylx7PJHMwZCci0uzFmuBG6tlt2PjFCSAqlpuv2/Hf
 yavt3uAYuioTXHOAbw6XBggbFN1Lp1IGEgxeK7BE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2055r04q046086
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Jan 2022 23:53:00 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 4
 Jan 2022 23:53:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 4 Jan 2022 23:52:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2055qxsA031870;
 Tue, 4 Jan 2022 23:52:59 -0600
Date: Wed, 5 Jan 2022 11:22:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Message-ID: <20220105055256.whshpo2pdbqfkzuh@ti.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
 <20220104083631.40776-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104083631.40776-2-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_215308_520030_1A6633E3 
X-CRM114-Status: GOOD (  10.25  )
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

On 04/01/22 09:36AM, Miquel Raynal wrote:
> Create a spi_controller_mem_caps structure and put it within the
> spi_controller structure close to the spi_controller_mem_ops
> strucure. So far the only field in this structure is the support for dtr
> operations, but soon we will add another parameter.
> 
> Also create a helper to parse the capabilities and check if the
> requested capability has been set or not.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
