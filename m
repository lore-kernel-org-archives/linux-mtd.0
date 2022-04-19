Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56E5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXNgvSBeetvPL8mchgFa136oKS5UrMKWFRJNmGcbjDc=; b=XMoGlCMn2fsOaRQ9zzIoElPc9q
	wOw3HAgISMD0c+/8W3pRefghhZNOBwIBeGbHYLaNr1QwbAoZ69lTQc0intm0bAiixcExhODtEqFCF
	7bncXMPb661vs3atVGKJ5i+ZTbzDjGTHHR+/vGxKIYR2OWUJBbFyp+++eNecmxS2BZgvxPJz7j+dc
	n5Rdm2H+bhzM+FHryul6vxk2xP/oU5PDbIoAavHj0hQBvhsVjDTpWb7TGgLJE3rgxQx4qGFyMalKE
	i1e/fXpWz+H08ghm+49BinJk6JVWta03Ajx3A7KkdG4DDknK6ikjE1HIDXlqu3MF0HF8sQKbd3ATo
	Wdx4ohXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nglov-0031P5-Az; Tue, 19 Apr 2022 11:14:57 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nglos-0031Nd-5o
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 11:14:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7529D2223A;
 Tue, 19 Apr 2022 13:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650366892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOmFS9aO47VVvSQgneAePnRstYH8GvaUVzpVYBw99LA=;
 b=XXxcDjx7zmn26130gcpxcwxX0vhgrnVRkqUJNjWKDqJOLeJXU4MXbQcWt0oCDyXmBrdhDh
 9WxgjurRqoYpox6m5tXra9ACsWLJz0d98Z5L4RF7Ckd6uo/80QrzwpRiajWNbwJJIun5rS
 MhYuQps0eg7r1qYEQFMKZT6Dhf1GDT0=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 13:14:52 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 5/9] mtd: spi-nor: manufacturers: Use spi_nor_read_id()
 core method
In-Reply-To: <20220411091033.98754-6-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e9fb855b93d814977838bf65a1e2a283@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_041454_434159_832134D9 
X-CRM114-Status: GOOD (  17.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> Use spi_nor_read_id() core method to avoid duplication of code. Now the 
> ID
> is read on the full SPI_NOR_MAX_ID_LEN instead of
> round_up(nor->info->id_len, 2), but it doesn't harm to read more ID 
> bytes,
> so the change comes with no secondary effects. dev_dbg messages in case
> spi_nor_read_id() fails, will be added in a further patch after we 
> split
> the octal DTR enable/disable methods.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

I like it, but maybe add a

/* SPI_NOR_MAX_ID_LEN is also used for octal readid and needs to be even 
*/
static_assert(SPI_NOR_MAX_ID_LEN % 2 == 0);

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
> v3: collect R-b, update commit message
> 
>  drivers/mtd/spi-nor/micron-st.c | 13 +++----------
>  drivers/mtd/spi-nor/spansion.c  | 13 +++----------
>  2 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 8a20475ce77a..41b87868ecf9 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -91,17 +91,10 @@ static int micron_st_nor_octal_dtr_enable(struct
> spi_nor *nor, bool enable)
>  		return ret;
> 
>  	/* Read flash ID to make sure the switch was successful. */
> -	op = (struct spi_mem_op)
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> -			   SPI_MEM_OP_NO_ADDR,
> -			   SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
> -			   SPI_MEM_OP_DATA_IN(round_up(nor->info->id_len, 2),
> -					      buf, 1));
> -
>  	if (enable)
> -		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> -
> -	ret = spi_mem_exec_op(nor->spimem, &op);
> +		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
> +	else
> +		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
>  	if (ret)
>  		return ret;
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c 
> b/drivers/mtd/spi-nor/spansion.c
> index f24e546e04a5..c5988312cc91 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -98,17 +98,10 @@ static int cypress_nor_octal_dtr_enable(struct
> spi_nor *nor, bool enable)
>  		return ret;
> 
>  	/* Read flash ID to make sure the switch was successful. */
> -	op = (struct spi_mem_op)
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> -			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
> -			   SPI_MEM_OP_DUMMY(enable ? 3 : 0, 1),
> -			   SPI_MEM_OP_DATA_IN(round_up(nor->info->id_len, 2),
> -					      buf, 1));
> -
>  	if (enable)
> -		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> -
> -	ret = spi_mem_exec_op(nor->spimem, &op);
> +		ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
> +	else
> +		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
>  	if (ret)
>  		return ret;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
