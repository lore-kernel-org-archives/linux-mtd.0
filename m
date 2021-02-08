Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC46AC433E6
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F2560231
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88F2560231
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YbJ+4NDpJjiGSlk7NhJFQ+Qp5o1Zu9g6OYtqWmoEkOs=; b=YIq7JtI2Yx5zIXIoVo9EUnRe6
	FtjEjRG8AZ2HrEC9PGCmANlvSjWrNyVcmzuR2T2H2UIE8hAlqxlviWtbNE9vhNNEIa7tIZTG6C/vU
	It4rBIO9Ik2jxwTm58tOmSHjQ/qNc6qDvy5k2VNSfuxjeHTJKEkve/JiK4pMva5FLE0La1BwylKIB
	owrnvnBP/EZW6cwc27Wm81L444RNeehO3j7zb85uQLzaF4ZfV2usN2j+00lrTF1RkEwEuSgDYzdpx
	mGQfCaVsb2Ay39V5VFL/Y9CjqBwp9IYA6lpabSMUYPxoPqY9y1tdMCKI5fvvzJscgzY0TZfJ6PR8h
	bmhUcy4+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94vD-0001wN-Dm; Mon, 08 Feb 2021 11:41:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94vA-0001ud-3f
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 11:41:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 118BfR6O078342;
 Mon, 8 Feb 2021 05:41:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612784487;
 bh=MZ32ADHMP4HrZdls4wTuSvREGiKYZ3Atrn/ctT/TVUc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jHS4lTaqa4w9bLDX+a0tS/8dYRm8pvqc3/mibz7aXWYv5vOj6j6leeNai72/CnTEU
 VggfnXWqWPIiRbSFTFILMfjt0Rxsai7+vsT63ivtfw1KZXH+8GK5ODsAndd00NQqm3
 b971cIFYKHeWCmxRHXTd0/kz4QWAon8c08mtWj+Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 118BfRHv047531
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Feb 2021 05:41:27 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Feb
 2021 05:41:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Feb 2021 05:41:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 118BfQe8113623;
 Mon, 8 Feb 2021 05:41:26 -0600
Date: Mon, 8 Feb 2021 17:11:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: core: Add dbg msg for
 spi_nor_erase_multi_sectors()
Message-ID: <20210208114125.5bmdvywjcruvhu7a@ti.com>
References: <20210205135253.675793-1-tudor.ambarus@microchip.com>
 <20210205135253.675793-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205135253.675793-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_064136_232825_31B91DC9 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Takahiro.Kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/02/21 03:52PM, Tudor Ambarus wrote:
> Useful when debugging non-uniform erase.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bcaa161bc7db..7401c60b53e6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1622,6 +1622,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>  			if (ret)
>  				goto destroy_erase_cmd_list;
>  
> +			dev_dbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %d\n",
> +				cmd->size, cmd->opcode, cmd->count);
> +

I don't like the position of this debug message. This prints cmd->count 
_after_ the erase is done but _before_ cmd->count is updated. It might 
end up giving some wrong or misleading information. Can you either move 
it before the start of the erase or after all the bookkeeping is done?

>  			addr += cmd->size;
>  			cmd->count--;
>  		}
> -- 
> 2.25.1

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
