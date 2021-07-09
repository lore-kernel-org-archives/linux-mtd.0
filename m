Return-Path: <SRS0=zNLG=MB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2311CC07E99
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 10:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54EC613D1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 10:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54EC613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9kTv5p3jxp5SNI6ofsuhDQSA+3+hLZOr2mXSTz0irY=; b=vvZz+EnK++7QL8
	4s7yBeGguta1upBr2U6hdLJDtKaNhgfbIK3VCiXFHh+rIUMja0tiBXQMXshiWaQXQjEdId60cKUOg
	I2ZtdyBBQauDTLz7ed7s9+8BGIl9y9iA7YckZ8GAaUc5aKyHRiO3Grwu3oc4IsEQk1hZUN9zDMv97
	NvwzoPYQLSBilFDileV9PXBfxhYybv5f51vhcL8WIgDsEG/z16qYT8yv/RpwIm/8RuWFHcq65Y6mX
	zdnQtX3mfv1tWyyfsRvLgbZtm+Z8LzTakZ3eM5n9jq+4gfIknBuiwa4zhTTDjnzyIorc76kHGMsW5
	wyIO5fe2/j10R/eqps8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1nbw-001TZl-Go; Fri, 09 Jul 2021 10:19:56 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1nbt-001TYE-Hn
 for linux-mtd@lists.infradead.org; Fri, 09 Jul 2021 10:19:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169AJYpf117376;
 Fri, 9 Jul 2021 05:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625825974;
 bh=iqKr0hwTHm9gTdhTR5L91AWYelwae2Yw4pOENSOJ+Yk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=a5Sv58/tNAoVdZrRin+Z6N31jbaOkzW4OBph5QaTOxU16ioIZzFttkKkrQxeUqMtn
 /rH5ZGU3E7l/WvW8GQeK25ZuOAxBJZaAjUyC2OVMm8K/ySbiKZbbjSeu6JQ/VgskkY
 fdqpWpSk6QVpdN8AZRijdejL0Ry9083IEoKpO7Ok=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169AJY0S031015
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Jul 2021 05:19:34 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 9 Jul
 2021 05:19:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 9 Jul 2021 05:19:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169AJX5I095119;
 Fri, 9 Jul 2021 05:19:33 -0500
Date: Fri, 9 Jul 2021 15:49:32 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Evgeny Novikov <novikov@ispras.ru>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lee Jones <lee.jones@linaro.org>, Pan Bian <bianpan2016@163.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <ldv-project@linuxtesting.org>
Subject: Re: [PATCH] mtd: spi-nor: hisi-sfc: Remove excessive
 clk_disable_unprepare()
Message-ID: <20210709101930.dxgr22tl46turyhg@ti.com>
References: <20210709093542.18718-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210709093542.18718-1-novikov@ispras.ru>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_031953_785865_1609E8BC 
X-CRM114-Status: GOOD (  20.87  )
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

On 09/07/21 12:35PM, Evgeny Novikov wrote:
> hisi_spi_nor_probe() invokes clk_disable_unprepare() on all paths after
> successful call of clk_prepare_enable(), so, there is no need in one
> more clk_disable_unprepare() in hisi_spi_nor_remove(). The patch fixes
> that.

This is true, but I think the patch should also mention that the clock 
is enabled by hispi_spi_nor_prep() and disabled by 
hispi_spi_nor_unprep(). So at remove time it is not possible to have the 
clock enabled.

The big point is not that the probe disabled the clock, but that every 
path would make sure to disable the clock, so it will already be 
disabled when remove is called.

> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 

Fixes tag?

With these comments addressed,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> index 47fbf1d1e557..516e50269478 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -477,7 +477,6 @@ static int hisi_spi_nor_remove(struct platform_device *pdev)
>  
>  	hisi_spi_nor_unregister_all(host);
>  	mutex_destroy(&host->lock);
> -	clk_disable_unprepare(host->clk);
>  	return 0;
>  }
>  
> -- 
> 2.26.2
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
