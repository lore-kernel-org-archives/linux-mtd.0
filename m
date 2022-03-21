Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E426C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IhU2xKMxsuwdmNIdCEwgxTZDp5p3zKHpWa9p6G47ho=; b=o/1PrluZQzZkGm
	PMcYclHpDKT70XycM+xgbdeJ9TOYXd5lyJ9f7ZYShlBiqffKV/CF/n1p8I0RbOvhqFHf8e/GNfzxQ
	4YGn/0KN2MBh9V5V4vrMq+6yVynqmg5c/wI6JZX0CcTj05QsITajpAbI8CqfK0yTLMP7UFJNCcpqg
	frqbl+822O92UGxTwU8GYQ17rpF7kC5hu2V5sF6h/gOEOM46L3jqs1osjNdUuZlDVo46tQBWzFp3p
	0fuMSY75EISjFAQ0oFk3GimBPDLmYEOsti1q9K0adp3qoIM38BnxyVgnXtp6g4GFpSUTHD9olNRHD
	5TxCKb9QRu9s7f7TI4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGiI-007YdM-IG; Mon, 21 Mar 2022 12:00:42 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGiF-007Yc5-AU
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:00:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LC0aw2074420;
 Mon, 21 Mar 2022 07:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647864036;
 bh=6hJ/5sK25zf8GQXvZeKEtNoEBPIsdJhE1Zr7R6mM+D4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dhq+qEZ8ub0hyqT2Df0fM2R7UMUjyqwbSaH4tGZc61VefHegc8djlYFHMxP1CDs9i
 xXE7/zQNFA7jcTAiQF6MDbn5DVu3dBe/G65QK0Ne9FapqcSgd/aYBaDtvEEMB8MPh+
 B7m8LHIsrbq4Kx1G7QFSZUjKMKPfhET2L62AZLPs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LC0a7Q030217
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 07:00:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 07:00:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 07:00:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LC0Z9P005787;
 Mon, 21 Mar 2022 07:00:35 -0500
Date: Mon, 21 Mar 2022 17:30:34 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 2/8] mtd: spi-nor: Introduce spi_nor_match_id()
Message-ID: <20220321120034.aemrcpo6xvjd3znm@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228111712.111737-3-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050039_482254_10D7E734 
X-CRM114-Status: UNSURE (   7.79  )
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
> Similar to spi_nor_match_name() extend the search of flash_info through
> all the manufacturers, this time doing the match by ID. There's no reason
> to limit the search per manufacturer yet, do it globally, search the flash
> in all the parts of all manufacturers in a single method.
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
