Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574A9C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFOpKAU9122qldBH1hatWSA8GL/P8VyM33ti/7OVsEU=; b=WcoltIZJFDaL77
	BSmuad6gzCLtdeITfCtmOr1fOM2CClhRkxFa/Qf+JlLuSH+y1gy7aEMjkluXFp7h6VueAO9voPDOF
	b8vEEiMAqWIesjO67Pzq2HRSs8/+ZJylHUdA4G3XdkxEUDrz0bUMdUM3hel2QbwVaACFscts1AJXx
	clMTtJbDI1ShAsv+16NBigTXLsovk1DxKMfBwS7fYF4iyq9CY7QhRKO/+zw9m/WWKvLkSBib5UeAi
	AphugtoSBtQs3UBkX7l66crwTRUkiNgw0ms/MamH3q3EunShckbdKdRM4tHBR8ki2UsEhvhOUqe1j
	wXcc5DR9xbsf4IiNSBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaXD-00000000i0P-2Nfi;
	Mon, 26 Feb 2024 12:56:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaXA-00000000hyo-1uLQ;
	Mon, 26 Feb 2024 12:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708952200; x=1740488200;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZWGyD5hzgW44HzlR18tI17IUrY8Vy5u5/537CqTcSss=;
  b=WcPKrZPJWZxeLbkklxZwlt5S4hhddqHn2hVsrFkGFcIWIFp38jX9uEJc
   KbzwWGCcIPUHm/m5ZOrC22aI20x3ddJHs5K+fF+bGObgxS5Se35wNdLhi
   9YHv1bUfBL6ZekU3GtvV9AZImsdwZ2X81RcxSokXdXxjkUgsO1ZPJJJmx
   wMWSJrACTLgyuCpMGKhne7ilOSasJKG8NNMBysgMkKHBKlwaMNN0/zoGU
   cB3iwCsbrqZXAxawjp898PwdUZKrLfVQfv9f/bbQ4shXOJ7nZpfp29WkU
   +Cw4FvwMKSyWBPZJGTMMjc/7oOuqWfyj9JWMtadEDerFBIk6S1AtCxvWX
   Q==;
X-CSE-ConnectionGUID: kHv4xSMiQjOsauQ9YHuS0g==
X-CSE-MsgGUID: Lh8qfODeRFOytOATbH+2rg==
X-IronPort-AV: E=Sophos;i="6.06,185,1705388400"; 
   d="scan'208";a="184095717"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2024 05:56:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 05:55:58 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 05:55:57 -0700
Message-ID: <b4fadbb7-5263-4271-9728-b25cc78ebad0@microchip.com>
Date: Mon, 26 Feb 2024 13:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: raw: atmel: Fix comment in timings preparation
Content-Language: en-US, fr-FR
To: Alexander Dahl <ada@thorsis.com>, <linux-kernel@vger.kernel.org>
CC: Boris Brezillon <bbrezillon@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240226122537.75097-1-ada@thorsis.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240226122537.75097-1-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_045640_752401_747580DB 
X-CRM114-Status: GOOD (  16.68  )
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

On 26/02/2024 at 13:25, Alexander Dahl wrote:
> Looks like a copy'n'paste mistake introduced when initially adding the
> dynamic timings feature with commit f9ce2eddf176 ("mtd: nand: atmel: Add
> ->setup_data_interface() hooks").  The context around this and
> especially the code itself suggests 'read' is meant instead of write.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Looks indeed valid:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Alexander. Best regards,
   Nicolas

> ---
>   drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 4cb478bbee4a..dc75d50d52e8 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1370,23 +1370,23 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
>           *
>           * NRD_PULSE = tRP
>           */
>          ncycles = DIV_ROUND_UP(conf->timings.sdr.tRP_min, mckperiodps);
>          totalcycles += ncycles;
>          ret = atmel_smc_cs_conf_set_pulse(smcconf, ATMEL_SMC_NRD_SHIFT,
>                                            ncycles);
>          if (ret)
>                  return ret;
> 
>          /*
> -        * The write cycle timing is directly matching tWC, but is also
> +        * The read cycle timing is directly matching tRC, but is also
>           * dependent on the setup and hold timings we calculated earlier,
>           * which gives:
>           *
>           * NRD_CYCLE = max(tRC, NRD_PULSE + NRD_HOLD)
>           *
>           * NRD_SETUP is always 0.
>           */
>          ncycles = DIV_ROUND_UP(conf->timings.sdr.tRC_min, mckperiodps);
>          ncycles = max(totalcycles, ncycles);
>          ret = atmel_smc_cs_conf_set_cycle(smcconf, ATMEL_SMC_NRD_SHIFT,
>                                            ncycles);
> 
> base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
> --
> 2.39.2
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
