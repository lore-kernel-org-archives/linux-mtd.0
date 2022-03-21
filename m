Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GlC068tPoWlBkrXsaBHMomyG3eYv4Fw6VJ+gta6Qcs=; b=zQeDgsHwcG8cfO
	r7J4DayPX2kEHWa6Jh+3RbeFeUvNKlRyVdpQbg+/nBwfiHeabmyCI+0m7jJJPTl/aYiJ3vYDzQiw+
	D8BIdGZ24MqynIviyJBX7prn95+UqKeCvehd9hYz5BFWsTV5arooyaZAQjKATGqryMleTynh2NUaB
	4qcYusjqF+eIXEHfp15twnPrMbbqvxYh8mXswIQlKTHD4mPyC4HA3OM4XqiwbbsbZJ03W03wTyiXC
	qWeuJgdUZ44/02wtdnrGCHs2WRw5l60EDPOBJLqpasYZK/zAYfmgm4/svpLdyN6sIz+kZfWCSLYKs
	vJf8FGtSSsY32X6hZWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHE7-007iVO-N4; Mon, 21 Mar 2022 12:33:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHE5-007iUy-Fg
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:33:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LCXUqt008541;
 Mon, 21 Mar 2022 07:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647866010;
 bh=MEA3swct/gXS3CRD+xbJHu0YGsdqqaAsegYmAfs8ewg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QDpl/chQJ3vvpFqNCkobRi1OgHb95nXuQrycQCRRq7XWUSIPLd5eng4ODuMmwycs+
 1m6uUpkgRKItyjIhA/rV3E2XkPNZTcFQQDn7+9idb5h1ogkLo6Q0CSsSqNGWtRbI8B
 HRTsQqbVARlvKmx78eZJ+kBtYer8GRxVz620dPQg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LCXUna004124
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 07:33:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 07:33:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 07:33:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LCXTDg063280;
 Mon, 21 Mar 2022 07:33:29 -0500
Date: Mon, 21 Mar 2022 18:03:28 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 7/8] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Message-ID: <20220321123328.pmronanogv6oveut@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-8-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228111712.111737-8-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_053333_587221_D064458D 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
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

On 28/02/22 01:17PM, Tudor Ambarus wrote:
> Introduce template operation to remove code duplication.
> Split spi_nor_micron_octal_dtr_enable() in spi_nor_micron_octal_dtr_en()
> and spi_nor_micron_octal_dtr_dis() as it no longer made sense to try to
> keep everything alltogether: too many "if (enable)" throughout the code,
> which made the code difficult to follow.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Will send my tested-by separately once I get a chance to test this.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
