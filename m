Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMuLgT2dJmRQAdkkXpOdazxOel95dXcxzwVuHk5v96c=; b=CxKYcoHqEynBbj
	QVbD1AyjGSPGjjspR2uD4860m91hfuGEHMKJzw9526pgvGL1BCP6zO/VIZtoIEtjhGcqlmNQ1N+Xl
	61eHxjImguVr+cYlt8SeXMNh+/RISvTSCGo+qH3CQw6x/cAlGzAlzrej9PSFwaY+XwlCXB1O5Pypn
	1k2ftAk6pKnvIycJ5xlohTkZ+PKB8OQ4AXkokWPZo92KjvsVxD6fnv1onl0usqpBz1R+DHr3Q4d9J
	SniIH62ce53D3NozAQdTvLQlNScnZbSanqa7WvTc3rG7T4ZBxwyQ74dp5fxEh2VcnKzohj1qTZaIi
	M89pX0GNxyI8tOsnwTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msiGN-00BWx5-6k; Thu, 02 Dec 2021 09:20:23 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msiGJ-00BWvy-8V; Thu, 02 Dec 2021 09:20:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B29JooU084807;
 Thu, 2 Dec 2021 03:19:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638436790;
 bh=slsIjx/nu8Ohm27SWvuWYoQZmWo5TqWYAeLKphApGJ8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=P17JhlZ8686oGv3og81s/o2EsVTDfTTcDns1+smmAQ+K2yFTtCaO8aPOyI0ZTwWw2
 Stjk36drT0x38p6NIDXdqa0inUCilJ5My0tOczoL3TBjc8Z1NsVXj6CWSRGxtschvR
 u99BKltGRPDtkMhtae6AA/itgWUbTVwVK8YgSioo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B29Jn3U118029
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 Dec 2021 03:19:49 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Dec 2021 03:19:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Dec 2021 03:19:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B29Jmgv094325;
 Thu, 2 Dec 2021 03:19:49 -0600
Date: Thu, 2 Dec 2021 14:49:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Message-ID: <20211202091946.ysjwdneo5x2pin6x@ti.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211122095020.393346-3-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_012019_429552_62B3F802 
X-CRM114-Status: GOOD (  13.13  )
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

On 22/11/21 11:50AM, Tudor Ambarus wrote:
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> While here use common naming scheme for functions that are setting
> mtd_info fields:
> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
> The functions names are self explanatory, get rid of the comment
> for the OTP function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

I am not particularly happy with spi_nor_try_unlock_all() using 
nor->mtd, but I can live with it.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

One small nitpick below.

>  
> -	/* Configure OTP parameters and ops */
> -	spi_nor_otp_init(nor);
> +	/* No mtd_info fields are used up to this point. */

How about "No mtd_info fields should be used up to this point" so we 
give the programmer a command to not use mtd_info fields rather than 
just stating a fact.

> +	spi_nor_set_mtd_info(nor);
>  
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
