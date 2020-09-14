Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81359C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 12:01:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26ADC207BB
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 12:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/S5CadI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="muxrOerW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26ADC207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FQyFx4ysEMEafCg+Fla8KJnLhLbLTXXecYTW/66+Nc4=; b=K/S5CadI5w1+bUXgAI1BJLk7W
	4xJfSIEotTM564f7ahvy858SC15Fcd6l1Ja6dBXcehVSqHBJZHvieR9GaV2qxYa/wwT4V1xPsj0C3
	aFukGTxFrDJa6nvnHio0crbXseBGvZBIMPLZ0YtYZOzs/VitRufdeis03RuNmV6die24mnzc8OfuB
	kjTq1ECuXI/Lrv/k0bjjLJACOaO+bmvc0igp5NLyv5ZuTQx1T5SAoTSkgE2VWbFlWp6TXY9M2qIsM
	on8DQ2jckReDcB9kVbwSO1bnwrdToY1iJDRQMC1ITp+s2je2GIF0c55o09n+mXi2kJR29q1HSlEOK
	f+cmwLtkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHnAK-0001UO-O0; Mon, 14 Sep 2020 12:01:00 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHnAH-0001TU-Vg
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 12:00:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08EC0iP5130965;
 Mon, 14 Sep 2020 07:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600084844;
 bh=RDHuKPy8mKrjcYu0NQ4FQ0Fc7xmwGprvqmX5xWjnGbs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=muxrOerW8n3EOwJDD2MGefnErXTaO9jA4+nkbijtWShwHXrIZpKabH4P5LwpnPnxW
 PwTo198QOZVtGJfnDgEZL/Owge2250TuFghQhkl4hvw4Ufdw5QSNFFqtsMiQRtmBXx
 vhIvM4BfR6f0P9m9K0A+gpkxnbts72fS8vfV1lPY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08EC0icu121790
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Sep 2020 07:00:44 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 07:00:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 07:00:43 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08EC0dgP075243;
 Mon, 14 Sep 2020 07:00:40 -0500
Subject: Re: [PATCH 1/3] mtd: spi-nor: sst: fix write support for SST_WRITE
 marked devices
To: Marco Felsch <m.felsch@pengutronix.de>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <sergei.shtylyov@cogentembedded.com>, <boris.brezillon@collabora.com>,
 <michael@walle.cc>, <j.neuschaefer@gmx.net>
References: <20200911144703.25409-1-m.felsch@pengutronix.de>
 <20200911144703.25409-2-m.felsch@pengutronix.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <dc80d00a-27a3-6c75-5820-97ad2e297d8e@ti.com>
Date: Mon, 14 Sep 2020 17:30:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911144703.25409-2-m.felsch@pengutronix.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_080058_113582_C9A65104 
X-CRM114-Status: GOOD (  24.24  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/11/20 8:17 PM, Marco Felsch wrote:
> The sst write support for devices using the special SST_WRITE routine
> is broken since commit commit df5c21002cf4 ("mtd: spi-nor: use spi-mem
> dirmap API") because the spi_nor_create_write_dirmap() function checks
> SPINOR_OP_AAI_WP and sst_write_second. These checks are not valid during
> probe. The check seems also to be broken since the "op->addr.nbytes = 0"
> causes the devm_spi_mem_dirmap_create() function to return
> PTR_ERR(-EINVAL) and the probe() function will fail.
> 
> It seems that the commit only copy'n'pasted the existing logic. Use the
> correct SST_WRITE flag and return 0 to fix both issues.
> 
> Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/core.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65eff4ce6ab1..31869ac245a8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3289,15 +3289,21 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
>  	};
>  	struct spi_mem_op *op = &info.op_tmpl;
>  
> +	/*
> +	 * Most SST SPI-NOR's have a special write routine.which should so

s/SPI-NOR/SPI NOR.

> +	 * dirmap.wdesc is not supported for these.

Or How about more readable version:

"Most SST flashes have special sequence for writing data to the flash
and therefore cannot support writes through direct mapping APIs."

> +	 */
> +	if (nor->info->flags & SST_WRITE) {
> +		nor->dirmap.wdesc = NULL;

nor->dirmap.wdesc is known to be NULL at this point. So no need to set
to NULL again.

> +		return 0;
> +	}
> +
>  	/* get transfer protocols. */
>  	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
>  	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
>  	op->dummy.buswidth = op->addr.buswidth;
>  	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
>  
> -	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
> -		op->addr.nbytes = 0;
> -
>  	nor->dirmap.wdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
>  						       &info);
>  	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
