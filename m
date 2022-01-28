Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF7C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgTw6WVH59j7+KQBIZVOAsPiLS3tuaDTUJEo9DXf3ew=; b=dBjTWxHqda4z6q
	kx1GR/+k21tS9M3jIF88qvhcICrOY8KkhYVBVvkYFW11UY03L+cPdxUJRVeUUueYjpavVwqEExXJK
	jfJ0RyLiqsXzDYqgEsY0mYVx09oyO66lNYmXXHm03pO6Gktc4b1azQYxf6bdgH8bUbrd3hT/853kI
	KDzlFhu5sme+TQqWwFNKB6Wq6QvNmV5C5lRRNg8vLEcjsc5Tpuj8nIXaYfLmDBPlsoRh2V7An0+o/
	ajdbmz/DzBmp4HTAnq4t2G0sEq7FbieaGbtat4Bn6myIwixGF/wGELZam3EWLmiGM4U6kfqTBsgW2
	7kQzfdrltrDVQHzVVa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDTtq-002ubQ-W9; Fri, 28 Jan 2022 16:14:59 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTtn-002uYS-9D
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 16:14:56 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20SGEWRI012070;
 Fri, 28 Jan 2022 10:14:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643386472;
 bh=gE688ExdogvCPKToOIBjzqFYYVk92OO30aF7+rdLB2M=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oNYxkL1/Oa40/xKLCGywNM9+iZN6kjTtwwOIJKR5X+9tgRbU+RonTzfieOpfQFwGI
 ILWqjQgkSn3mdei6mJrBZcwMKvSzcXaBAhD5yr7B1D5QHOb4+FmENBpD9VhcQAEvgj
 qKIQZCQ3xdFkaPiHWGnvSiBg3B+T/qWMW0tonMGI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20SGEWFR070882
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jan 2022 10:14:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 28
 Jan 2022 10:14:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 28 Jan 2022 10:14:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20SGEVmg073381;
 Fri, 28 Jan 2022 10:14:31 -0600
Date: Fri, 28 Jan 2022 21:44:30 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Lima <mauro.lima@eclypsium.com>, Alexander Sverdlin
 <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans-Gert Dahmen
 <hans-gert.dahmen@immu.ne>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20220128161430.lfa3s6e3bu4urspu@ti.com>
References: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
 <20211220164625.9400-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220164625.9400-3-mika.westerberg@linux.intel.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_081455_601246_37880E5D 
X-CRM114-Status: GOOD (  12.45  )
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

On 20/12/21 07:46PM, Mika Westerberg wrote:
> The preferred way to implement SPI-NOR controller drivers is through SPI
> subsubsystem utilizing the SPI MEM core functions. This converts the
> Intel SPI flash controller driver over the SPI MEM by moving the driver
> from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> SPI MEM functions. The driver name will be changed from intel-spi to
> spi-intel to match the convention used in the SPI subsystem.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mauro Lima <mauro.lima@eclypsium.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

I remember acking this patch but maybe it got dropped along the way. 
Anyway,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
