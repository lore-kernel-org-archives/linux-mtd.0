Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55269C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiPdieB9+u9XJNcopKjolHK7OSvm8//bMAK5A2yu30s=; b=gngu3zI19Sd2mY
	y2wHPN/00XHd6yDVOjtCjhhZDVjLZwWsy1U5A2lwS9s1RDo9QY8rqynKmLogzxFTVahCevIiftjj3
	0QDS2DJRH11U2mpSn/aZ9BYUIu6mvuoLWk47AcXT4dOyGjHkiD2Dzx3FQjcSrU+VIIqIueojhr6Nr
	eORBPM2HPZIa8qDoWX2TzQBocoSvrUM8N2xL7AHzHNS9M67OpyoyPfozyDKG60n2hqCPmxn2XHj6K
	9HP6+5/FSd1jQa6YLv1Wyh30D/ksuZlCgaHg80c/AsRks3+/WantplYHyYEGsUI7y2lI0JP1CploQ
	IwT2pzBvW0gN5VtFeRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dGV-002TDu-2Q;
	Thu, 01 Jun 2023 08:02:35 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dGR-002TCS-18;
	Thu, 01 Jun 2023 08:02:33 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5FF405FD7D;
	Thu,  1 Jun 2023 11:02:28 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685606548;
	bh=05ZloG7zqiJsyOiLjkyE+HV8a6tzHOTec90OEL4emow=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=KDNV4hypqz71qUV2Y/CXm3QLm9UEOOv8THT7kz6pBYCHZybbd3RfHvBrtbcHfxRqF
	 9Wa2wUZT7gGsXAZWafUJ0fsBQxaF83zJatnm2m541B/JHG3IjVBs69yqf/ZsBYks4V
	 O/OmuL7WLdUtayXlXNZhFJwDswKCvffwrY3eQQeGKEMYa74MnwWuwyvsaR9G+r12a+
	 zqZdKXA+ZkJjSllWFHwDl/Fp+xFl2vR939foySnaLr4kHGjXZCLTlJxPlhciU14SGB
	 AJjSvu/cPgNU8LK0FWuXp6jdYJ/4KYRyBn5ibPFi0BLf3zbtZqDWvFjWxdzN9PGGJY
	 mfSNqtBaV91Og==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  1 Jun 2023 11:02:28 +0300 (MSK)
Message-ID: <439ff8b6-4282-08f7-46ef-425c0c009f09@sberdevices.ru>
Date: Thu, 1 Jun 2023 10:57:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/01 03:13:00 #21393813
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_010231_750895_1E1BCD0A 
X-CRM114-Status: GOOD (  21.67  )
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



On 01.06.2023 09:18, Arseniy Krasnov wrote:
> This adds support of waiting for command completion in sofyware polling

                                                         ^^^ will fix it

> mode. It is needed when ready/busy pin is not implemented in hardware.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 53 ++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 9dd4a676497b..82a629025adc 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -179,6 +179,7 @@ struct meson_nfc {
>  	u32 info_bytes;
>  
>  	unsigned long assigned_cs;
> +	bool use_polling;
>  };
>  
>  enum {
> @@ -392,32 +393,38 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
>  	}
>  }
>  
> -static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
> +static int meson_nfc_queue_rb(struct nand_chip *nand, int timeout_ms)
>  {
> -	u32 cmd, cfg;
> -	int ret = 0;
> +	struct meson_nfc *nfc = nand_get_controller_data(nand);
>  
> -	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
> -	meson_nfc_drain_cmd(nfc);
> -	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
> +	if (nfc->use_polling) {
> +		return nand_soft_waitrdy(nand, timeout_ms);
> +	} else {
> +		u32 cmd, cfg;
> +		int ret = 0;
>  
> -	cfg = readl(nfc->reg_base + NFC_REG_CFG);
> -	cfg |= NFC_RB_IRQ_EN;
> -	writel(cfg, nfc->reg_base + NFC_REG_CFG);
> +		meson_nfc_cmd_idle(nfc, nfc->timing.twb);
> +		meson_nfc_drain_cmd(nfc);
> +		meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
>  
> -	reinit_completion(&nfc->completion);
> +		cfg = readl(nfc->reg_base + NFC_REG_CFG);
> +		cfg |= NFC_RB_IRQ_EN;
> +		writel(cfg, nfc->reg_base + NFC_REG_CFG);
>  
> -	/* use the max erase time as the maximum clock for waiting R/B */
> -	cmd = NFC_CMD_RB | NFC_CMD_RB_INT
> -		| nfc->param.chip_select | nfc->timing.tbers_max;
> -	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +		reinit_completion(&nfc->completion);
>  
> -	ret = wait_for_completion_timeout(&nfc->completion,
> -					  msecs_to_jiffies(timeout_ms));
> -	if (ret == 0)
> -		ret = -1;
> +		/* use the max erase time as the maximum clock for waiting R/B */
> +		cmd = NFC_CMD_RB | NFC_CMD_RB_INT
> +			| nfc->param.chip_select | nfc->timing.tbers_max;
> +		writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  
> -	return ret;
> +		ret = wait_for_completion_timeout(&nfc->completion,
> +						  msecs_to_jiffies(timeout_ms));
> +		if (ret == 0)
> +			return -ETIMEDOUT;
> +
> +		return 0;
> +	}
>  }
>  
>  static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
> @@ -623,7 +630,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  	if (in) {
>  		nfc->cmdfifo.rw.cmd1 = cs | NFC_CMD_CLE | NAND_CMD_READSTART;
>  		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
> -		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max));
> +		meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tR_max));
>  	} else {
>  		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
>  	}
> @@ -669,7 +676,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
>  
>  	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> -	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
> +	meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tPROG_max));
>  
>  	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
>  
> @@ -952,7 +959,7 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
>  			break;
>  
>  		case NAND_OP_WAITRDY_INSTR:
> -			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms);
> +			meson_nfc_queue_rb(nand, instr->ctx.waitrdy.timeout_ms);
>  			if (instr->delay_ns)
>  				meson_nfc_cmd_idle(nfc, delay_idle);
>  			break;
> @@ -1412,6 +1419,8 @@ static int meson_nfc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	nfc->use_polling = of_property_read_bool(dev->of_node, "polling");
> +
>  	writel(0, nfc->reg_base + NFC_REG_CFG);
>  	ret = devm_request_irq(dev, irq, meson_nfc_irq, 0, dev_name(dev), nfc);
>  	if (ret) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
