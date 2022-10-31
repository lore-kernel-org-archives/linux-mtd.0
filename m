Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E10FA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eaJUBQQ0aB6NpDmt3JgRE+/o6uLnypyWXliqchtQFM=; b=tRuUfPDOYwxxJN
	41gmH7KkgaCThZ5b/Vu+Q5AqxLcHe2CJJGlEv5FMGz6/SeKhpyJ5wdudtjP6FdJxcY0y4s3yHcmoG
	/vqluAdfftq7zzrY5rfTxt6FLY/Z5WXywdk7sYCm/Rel5ooKQ/lLnEF/gYycd6C8lvJJOg5TH0DKD
	QpnLdNrRcFh8TVOWj7NQeXBROdyhGSzKtO6iA0PVW5antIr7j9Y0pBAGwLZgnpRyt9eCT8sg/VojK
	9Ot4JCWKhZvS16UwSnEZ9D9Km8JT42Hvtp4DuJ1HrPpRaL8/BkM9so/eqspVW2XPSIb5fQ1voGMez
	HM7nOWfw009eUGzvZ58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW0d-00CKra-7t; Mon, 31 Oct 2022 14:43:27 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW0Q-00CKnE-9P; Mon, 31 Oct 2022 14:43:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29VEh2LZ002087;
	Mon, 31 Oct 2022 09:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667227382;
	bh=xKMheBe6+tALckGCgXRgq0Nenx9e5EqobLOp//FbZXY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EEEOmiorUFfhlYJP4Kmp+Tqf3wLsmqWR8VoUSQQuL9bG3CnyXcDGVfEXzItcJDkYw
	 /zH1whRx6xA+3ul9TnsKgSdght7iimEz4LkD5hcW9igiQVVPxru4JLh1ECQzz3/diM
	 sOjEbNeTiSRneF9jkWzMR23AZX2EESkSBVTSKoUY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29VEh299006573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Oct 2022 09:43:02 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 31
 Oct 2022 09:43:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 31 Oct 2022 09:43:02 -0500
Received: from [10.250.234.171] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29VEgu2P021939;
	Mon, 31 Oct 2022 09:42:57 -0500
Message-ID: <ceaf4036-12f8-0cfe-9cdc-37d2ef96bd76@ti.com>
Date: Mon, 31 Oct 2022 20:12:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [EXTERNAL] [PATCH] mtd: spi-nor: Fix the number of bytes for the
 dummy cycles
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Tudor Ambarus
	<tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael
 Walle <michael@walle.cc>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard
 Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        <linux-mtd@lists.infradead.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Bayi Cheng
	<bayi.cheng@mediatek.com>
References: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
Content-Language: en-US
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_074314_488448_0E769563 
X-CRM114-Status: GOOD (  17.36  )
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

On 31/10/22 18:16, Allen-KH Cheng wrote:
> The number of bytes used by spi_nor_spimem_check_readop() may be
> incorrect for the dummy cycles. Since nor->read_dummy is not initialized
> before spi_nor_spimem_adjust_hwcaps().
>
> We use both mode and wait state clock cycles instead of nor->read_dummy.
>
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Co-developed-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---

Tested-by: Dhruva Gole <d-gole@ti.com>

>   drivers/mtd/spi-nor/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6c921eb3fadb..8b9c318a0ad4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1914,7 +1914,8 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>   	spi_nor_spimem_setup_op(nor, &op, read->proto);
>   
>   	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
> +			  op.dummy.buswidth / 8;
>   	if (spi_nor_protocol_is_dtr(nor->read_proto))
>   		op.dummy.nbytes *= 2;
>   
Tested on my AM625 SK EVM having spi nor flash and no obvious 
regressions observed :)

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
