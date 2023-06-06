Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9169C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aroyfAIy1LNJBZ/P9nczJNLhSI2ORmgKfpugXNf0jLk=; b=htjAwe85tKYgdZ
	5qFRkF79+0hnIH9D+7yDEofzvFEnx+fU6193I54p1m4z4WiTfEV464emeUOReVrPTz6lLUqc+RPAb
	KD71hvNMbmXR3lMoGkYlglCP9EFhZv+W1SEG8NHSOzJt/ObsBnuO6vWhm/76F2UyJsJRjlgPQ2fw9
	1E1ZWtzEdQH2vU1qkLB94Qr9qtQ3E65a1FsyOM6qrY5xdLjLXbfHZ/2yzkkI862QlxwYsGAyoMijc
	3i5o8dHh4Ztd2P2fxRZjRvDBZnGPNs+WlfR+BtFl8Kc7nqc9PJRmCMEvbWqv4lDPs6wgRylys1Q3T
	v8FfFp7l8Mz3ZiX4NJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Zde-002S6y-0x;
	Tue, 06 Jun 2023 16:34:30 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ZdZ-002S4f-2l;
	Tue, 06 Jun 2023 16:34:27 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BE77C5FD4D;
	Tue,  6 Jun 2023 19:34:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686069262;
	bh=KeCk+CRAEx23TImhdTYEGwdkCy7ggB8JZkD//dGVlCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Mdo2TX3tO67daG6Y7EPXaMQZhGF9M520wjm+1ZlYLAjzvtxRKk2pBFpStrcPu//P7
	 bnEzuYqzjiZPaadF0DDlp+tFO6QkQ1SlrSu8GwGfQjFmcJdwIhFmhf4tUYOtncABm7
	 IJE48T9FPZ648Gqb9Ti/FgSq2ZNXYo6U5p+JkxcoFa6VOeqjRPFzyLEa5dkhHYTrI5
	 3Go/2n1zizfGM9i9OXU6xgbxU2H2wZWEy7xbt9y0nQdX9DU903Rod94T2Ei7RVXBif
	 LUGUgwA9TY9cttM7PQG5PTpbYyjAzwoPSFeer7MxcKAuQR9tBcQAgLaSqPNpGMpBvQ
	 zDcfLj/09TshA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 19:34:20 +0300 (MSK)
Message-ID: <9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
Date: Tue, 6 Jun 2023 19:29:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 14:43:00 #21444531
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_093426_237930_B26EFDF8 
X-CRM114-Status: GOOD (  21.75  )
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

Sorry, here is changelog:
v1 -> v2:
* Move checks from 'switch/case' which executes commands in 'meson_nfc_exec_op()' to a special
  separated function 'meson_nfc_check_op()' which is called before commands processing.

On 06.06.2023 13:16, Arseniy Krasnov wrote:
> Meson NAND controller has limited buffer length, so check it before
> command execution to avoid length trim. Also check MTD write size on
> chip attach.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 23a73268421b..db6b18753071 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -111,6 +111,8 @@
>  
>  #define PER_INFO_BYTE		8
>  
> +#define NFC_CMD_RAW_LEN	GENMASK(13, 0)
> +
>  struct meson_nfc_nand_chip {
>  	struct list_head node;
>  	struct nand_chip nand;
> @@ -284,7 +286,7 @@ static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
>  
>  	if (raw) {
>  		len = mtd->writesize + mtd->oobsize;
> -		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
> +		cmd = len | scrambler | DMA_DIR(dir);
>  		writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  		return;
>  	}
> @@ -573,7 +575,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>  	if (ret)
>  		goto out;
>  
> -	cmd = NFC_CMD_N2M | (len & GENMASK(13, 0));
> +	cmd = NFC_CMD_N2M | len;
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  
>  	meson_nfc_drain_cmd(nfc);
> @@ -597,7 +599,7 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>  	if (ret)
>  		return ret;
>  
> -	cmd = NFC_CMD_M2N | (len & GENMASK(13, 0));
> +	cmd = NFC_CMD_M2N | len;
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  
>  	meson_nfc_drain_cmd(nfc);
> @@ -1007,6 +1009,31 @@ meson_nand_op_put_dma_safe_output_buf(const struct nand_op_instr *instr,
>  		kfree(buf);
>  }
>  
> +static int meson_nfc_check_op(struct nand_chip *chip,
> +			      const struct nand_operation *op)
> +{
> +	int op_id;
> +
> +	for (op_id = 0; op_id < op->ninstrs; op_id++) {
> +		const struct nand_op_instr *instr;
> +
> +		instr = &op->instrs[op_id];
> +
> +		switch (instr->type) {
> +		case NAND_OP_DATA_IN_INSTR:
> +		case NAND_OP_DATA_OUT_INSTR:
> +			if (instr->ctx.data.len > NFC_CMD_RAW_LEN)
> +				return -ENOTSUPP;
> +
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int meson_nfc_exec_op(struct nand_chip *nand,
>  			     const struct nand_operation *op, bool check_only)
>  {
> @@ -1015,10 +1042,12 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
>  	const struct nand_op_instr *instr = NULL;
>  	void *buf;
>  	u32 op_id, delay_idle, cmd;
> +	int err;
>  	int i;
>  
> -	if (check_only)
> -		return 0;
> +	err = meson_nfc_check_op(nand, op);
> +	if (err || check_only)
> +		return err;
>  
>  	meson_nfc_select_chip(nand, op->cs);
>  	for (op_id = 0; op_id < op->ninstrs; op_id++) {
> @@ -1293,6 +1322,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
>  	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
>  	struct mtd_info *mtd = nand_to_mtd(nand);
>  	int nsectors = mtd->writesize / 1024;
> +	int raw_writesize;
>  	int ret;
>  
>  	if (!mtd->name) {
> @@ -1304,6 +1334,13 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
>  			return -ENOMEM;
>  	}
>  
> +	raw_writesize = mtd->writesize + mtd->oobsize;
> +	if (raw_writesize > NFC_CMD_RAW_LEN) {
> +		dev_err(nfc->dev, "too big write size in raw mode: %d > %ld\n",
> +			raw_writesize, NFC_CMD_RAW_LEN);
> +		return -EINVAL;
> +	}
> +
>  	if (nand->bbt_options & NAND_BBT_USE_FLASH)
>  		nand->bbt_options |= NAND_BBT_NO_OOB;
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
