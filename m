Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD610C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:20:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D56E206DD
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AkqxOL8k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RtTlsAu1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D56E206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UGY9HvzgieSH0XETiOlos1H3n1O26DoWPzOOMFbQH9Y=; b=AkqxOL8kHKGDzMORq/uhY6NGN
	eJJoOQxh6h9zPa5zvDLjDZIcfP2ByZ+LLPItZ2VkvhXoI+gXwGrszhakoTaDiPLN4IYuvwiuo7y81
	DCAxyxJ56ds80C0A0VBMKSRtq7lnXD9AKMzwHzaqyR0tPEkMBF7X5+OdpmaT55IxvB4X/eW5nKrXW
	96hzhS0V9QouJ+g4HBHchkF0YlAV4GRxyZy38A0N2cMMmpxGRjeCRRtM4T0Dlwy7IY7LiQzsUzqSl
	jm6UUHgo4EaiFvM0sDGo8o6L8CCwfiXAxw9k5MDUkRzg8jr8zyW9tR1X8ip/Wny1OFzQGaVmsOnrU
	Wb6PGrHtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPojO-0005rZ-UH; Tue, 06 Oct 2020 15:18:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPojI-0005r2-Gg
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 15:18:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096FI90q075440;
 Tue, 6 Oct 2020 10:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601997489;
 bh=cEvQkTPb5D58O6vqHt0d3zXE2tCjsask8K4wj8gkurE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RtTlsAu1TxRWSNrU3qD3A0ybovtKnGgzsRpKzxClmi4V/3v24A5c69ZfofbDDRemx
 5cgWZBGzjtk7bzNhJ+XiX7jpBhmwe1LqErkMhL0l+rRQ7idzQQ4OokpsbjugK2ieuJ
 ASnYHpUJMsfiHiDvuyCjcW/7VasZ+i6wiHdQdFVQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096FI9An078136
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Oct 2020 10:18:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 10:18:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 10:18:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096FI8wx005857;
 Tue, 6 Oct 2020 10:18:08 -0500
Date: Tue, 6 Oct 2020 20:48:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Bert Vermeulen <bert@biot.com>
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips
 > 16MB
Message-ID: <20201006151807.2pckm7ncply7uomc@ti.com>
References: <20201006132346.12652-1-bert@biot.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006132346.12652-1-bert@biot.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_111816_638139_06E9F0FF 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/10/20 03:23PM, Bert Vermeulen wrote:
> If a flash chip has more than 16MB capacity but its BFPT reports
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
> 
> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> did get set. This fixes that check.
> 
> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..a2c35ad9645c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>  		/* already configured from SFDP */
>  	} else if (nor->info->addr_width) {
>  		nor->addr_width = nor->info->addr_width;
> -	} else if (nor->mtd.size > 0x1000000) {
> -		/* enable 4-byte addressing if the device exceeds 16MiB */
> -		nor->addr_width = 4;
>  	} else {
>  		nor->addr_width = 3;
>  	}
>  
> +	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
Nitpick:    ^^^^^^^^^^^^^^^^^^^^^^^^ you can drop this part. But its 
fine either way.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> +		/* enable 4-byte addressing if the device exceeds 16MiB */
> +		nor->addr_width = 4;
> +	}
> +
>  	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
>  		dev_dbg(nor->dev, "address width is too large: %u\n",
>  			nor->addr_width);

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
