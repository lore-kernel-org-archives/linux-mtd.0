Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AD0C5DF62
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 16:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CCB2190F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 16:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMiD9nZc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t4XqoUa1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CCB2190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVSPEMb9+5oISoF1C0lE27f4UYJkcKlco5jGcjOZzpc=; b=qMiD9nZcFr36wY
	6yaVdFbXwjKVjEQdgkzu/zHuGqHUsgamcKuGhfHof/6Kxak+PDuckP4trKTlk0S8lbxHd2ISrafiN
	5zdhhClN078f9cp7MbO4zpUVaZx6EpGctHBWaqMvvJYCdq1qxQk5wpldCkuZVckrGvCYxwOTOWvwq
	I1OGjC0nmb2z9ODIog6xIRuRyL9ryQnrMz9ym2jx1YE1skdxvtGeY3KFpj6HB6BxkXdeAjJaXgsBr
	W5XEFvtKFL6ADase3QdPwySplB05Ir+Bsl+5KC+/MM2g9GQD8wB6rKz/7A3bbxz44AAZzXbTbO9Xb
	2COWxt0xVdqKweFpNwqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS1Kz-0004jl-Kj; Tue, 05 Nov 2019 16:05:45 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS1Kw-0004j9-O9
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 16:05:44 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5G5ZO6077804;
 Tue, 5 Nov 2019 10:05:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572969935;
 bh=ifqGbh2iK7gCjM34CfaUPg5dKbqv4hsuWqKdYPnSGWk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t4XqoUa1Q9IdKhWKcc6jvYqDlwYyx4v5DZ3z0peERQoohVdGZV5Ufg0o9wY0WMC4c
 dOoGP67ABI4bj8rK4RvJM74wEg60Ot0kYz16J94+YBY1QXgiJsSFg+ONC7c59sJmcX
 TNoZKvFnqWk3Xc1ydxGkAUYem8z1NzM0T6/rHuok=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5G5Z4T110661
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Nov 2019 10:05:35 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 10:05:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 10:05:20 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5G5W4W081978;
 Tue, 5 Nov 2019 10:05:33 -0600
Subject: Re: [PATCH v4 15/20] mtd: spi-nor: Extend the QE Read Back test to
 both SR1 and SR2
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-16-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b9a4e491-d081-1325-1532-b392f55fcaf9@ti.com>
Date: Tue, 5 Nov 2019 21:36:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191102112316.20715-16-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_080542_889734_425FBBD8 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> In case of 16-bit Write Status Register, check that both SR1 and
> SR2 were written correctly.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

This can be merged with previous patch as changes are quite similar

Regards
Vignesh

>  drivers/mtd/spi-nor/spi-nor.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 08fd2c97897d..8f11c00e8ae5 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2067,6 +2067,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
>  {
>  	u8 *sr_cr = nor->bouncebuf;
>  	int ret;
> +	u8 sr_written;
>  
>  	/* Keep the current value of the Status Register. */
>  	ret = spi_nor_read_sr(nor, sr_cr);
> @@ -2075,7 +2076,22 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
>  
>  	sr_cr[1] = CR_QUAD_EN_SPAN;
>  
> -	return spi_nor_write_sr(nor, sr_cr, 2);
> +	ret = spi_nor_write_sr(nor, sr_cr, 2);
> +	if (ret)
> +		return ret;
> +
> +	sr_written = sr_cr[0];
> +
> +	ret = spi_nor_read_sr(nor, sr_cr);
> +	if (ret)
> +		return ret;
> +
> +	if (sr_cr[0] != sr_written) {
> +		dev_err(nor->dev, "SR: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
>  }
>  
>  /**
> @@ -2116,6 +2132,17 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> +	sr_written = sr_cr[0];
> +
> +	ret = spi_nor_read_sr(nor, sr_cr);
> +	if (ret)
> +		return ret;
> +
> +	if (sr_written != sr_cr[0]) {
> +		dev_err(nor->dev, "SR: Read back test failed\n");
> +		return -EIO;
> +	}
> +
>  	sr_written = sr_cr[1];
>  
>  	/* Read back and check it. */
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
