Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EAFC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAliLGlKr7Unqpo3bvYBxDmVfBAQpj3Jx7+jRkh0QWU=; b=efamGsafzszUQr
	9U5R8nXK0NJJnA5ykok7fxfig8RHMg7z+g3adA3srRW/UoYmBHpUqCCUnUj5LgR/WgbPGCCy87Mn5
	rsynYbsuCa5vUKSGqNb/bt3qFc/Ey4oH/e+md9h1wnfiOKuitGaajKEJrmgeaFCH0SK6Dmry08s5q
	ll1ojVTTNhxNHpu++NF0M8xB8quxO4F+p6IdE68UH8lKSEGV2WwU54gBTZAtUqlmH2c171BPnA8gl
	Aw4G0K2KIdmbFKffUf9Uvb7EAtaFZye+Z3FqsJZ1uDlNMGF0m/EKxQ0GDkh1grNFQ7BFX2nFDUGO1
	kOvOxJU4X7diwutt60xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCbz-003eAx-QN; Mon, 06 Dec 2021 11:56:51 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCbo-003e5n-45; Mon, 06 Dec 2021 11:56:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B6BuBZv001845;
 Mon, 6 Dec 2021 05:56:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638791771;
 bh=dVnoAFVaPZWgf6t6uLDhnxqC8MwjoeUC/Wi4AfPvOcQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=P/qGQwVgO/yaIJdl3dI4RMQPzS7j+5szO9cVr8m6ymtjOn5ROp0vza5XPBTRuNQqg
 qyjHEF5LPHuC2u7aH5/L+p2loqk/fU3Gdzfkiti5HAV7F0C1bokIA07XLSXwRNkJdV
 Sep/gBM5H4rRTxfIekJI6bRhFUTqylNNhRO856vU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B6BuA4r093351
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Dec 2021 05:56:11 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 05:55:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 05:55:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B6BtETr042373;
 Mon, 6 Dec 2021 05:55:14 -0600
Date: Mon, 6 Dec 2021 17:25:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v5 02/14] mtd: spi-nor: core: Don't use mtd_info in the
 NOR's probe sequence of calls
Message-ID: <20211206115511.4ritqhgy363tlk7s@ti.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203142256.47370-3-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_035640_242945_F91C3682 
X-CRM114-Status: UNSURE (   8.52  )
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

On 03/12/21 04:22PM, Tudor Ambarus wrote:
> Use NOR parameters in the probe's sequence of calls, thus
> nor->params->size instead of nor->mtd.size and let the mtd_info
> fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
> mtd_info fields should not be used during probe because we haven't
> registered mtd yet. It's safe to drop xilinx's setting of nor->mtd.size,
> now that we use nor->params->size in spi_nor_set_addr_width().
> 
> Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
