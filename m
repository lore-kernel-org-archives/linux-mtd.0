Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEdviNaYGA9tBS1IeuescQtXnW5sNjil3IzAz6nEt1M=; b=Zc5HId9cCNLTIp
	EgPZwZ+GYWU0WcLfWRuWqvItanZK5EqamVRlc/xeKxKKGAohoqO/8kf5ggr2UVK+Z+bCPP2UCadUG
	/ZS6lAKXqg6RTvcMEOXHif061Q8RY4tOW8Ud+poco4JsDlFIl0Xie527EkWs0iUsKWpbNCLYHLeFh
	Gc8zWaobRbrmgY/gX+R5/fal7hCTtCcVUDHjz6LJ36g6ZOAYeQApy9dSerxfwL/B88hLXw7hocHi3
	NwVYykdRrEOPYV3lRWBsIkUBUEf76hlnltiXa4Ymj9vNEBrEbisEGZmnNcL6N/PP5zNBFqc2IVpAS
	/5Re2velVMvK5A/jxqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muD4K-003kvo-4i; Mon, 06 Dec 2021 12:26:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muD4E-003kt7-SY; Mon, 06 Dec 2021 12:26:06 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B6CPa8l009210;
 Mon, 6 Dec 2021 06:25:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638793536;
 bh=OmB8NvesvNZp4Z6131cagkvNVjae4lLB8WNMNmVNnVU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jR3lWbwpMkRUe2Lu+B2QLnSRj/Vwwi/g1+hFa5wzDaIClYh9DGMAC1yRpL2UZWCOZ
 Ylxp18jZeNCJ2AWi8HmV1Ci9KwOPfnNQ6S+K4jcKxKI2911UHnCfL6a1wv0xi4iOWb
 PPOeQMe2UCvs5k6S8piv5PhFO+zMd3F7UBb0eyCg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B6CPaNN111133
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Dec 2021 06:25:36 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 06:25:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 06:25:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B6CPZWX122346;
 Mon, 6 Dec 2021 06:25:36 -0600
Date: Mon, 6 Dec 2021 17:55:34 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v5 00/14] mtd: spi-nor: Clean params init
Message-ID: <20211206122532.5mhojts3ne55ppp6@ti.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_042603_007239_83607B66 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 03/12/21 04:22PM, Tudor Ambarus wrote:
> Clean spi_nor_scan() and the flash parameters initialization code. 
> Reworked how the flags are handled for the flash_info entries.
> Tested all the flashes from patch set.
> 
> Changes in v5:
> - new patch 0001-mtd-spi-nor-Fix-mtd-size-for-s3an-flashes.patch
> - update comment from
>   '[PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()',
>   s/'No mtd_info fields are used up to this point.'/
>     'No mtd_info fields should be used up to this point.'
> - collect R-b tags

I only have a small nitpick with patch 9. The rest of the series looks 
good to me. Let's apply this soon so it can get a chance to cook in next 
for a few rc cycles.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
