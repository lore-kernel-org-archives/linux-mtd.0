Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5789C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0yAH9bkqf7lw9J5Oad/1P7qU3D72XUQVc/97QFcHzw=; b=Y8KMe8ZjBTHQkT
	JRmuWTxVXc2+DA1ww92i2toRwDdZXFxVvhC7SvkueMs78ya+aZ3Kf8JDgxlvOSkokbOtlQ+hA+V4G
	uISsSAYxnydde3zndabSgmGE2GxQ/73xANpmL/c0gxi7vf5RyvgmU9wvVLpYNLyqqkpI9IJ3iYIbS
	MUw/BrEnIVddt/pyeAUXxkNs32Cjux14/IxJDuQv+2jx46tzio2EkKhqhP5ziazFyeV7WCQEb2b6i
	PctUR0CzFXSx+BfnCwbhhr2ySaqvsN7oVihX6XOfW3FYz6xNh0RHVAAtk2wheJTAdGLghUhNhapHO
	xqwfAEIVsKeqLrJb+zpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cq3-0034En-38;
	Tue, 06 Jun 2023 19:59:31 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cq0-0034Cz-0H;
	Tue, 06 Jun 2023 19:59:30 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BDEFB5FD0C;
	Tue,  6 Jun 2023 22:59:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686081565;
	bh=HsbilSNXGprd3byyDOvNssmOWdlSZHdBWqrnSufFSSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=ZZU7Z6raDP6idx0UdSOQZRgPB1iO0AILrTTyExr92YK5bHZfxEpVbtSiu4qliHENJ
	 hmGzSGX2dnvidjfQyZhyDZkfIqciZLiliur0qlw+FpyIZrMPGmaY3JFscc0Yue3NZc
	 cO1rVDziwSPv7p50EkhIWA7jl+j9CeE/U3hGfzb9xpRcMiWeKQBb4Jb8xr9i+nr4yx
	 cvcD/P3/c313g/4NMHlEyjT8c1j6ozzvvCJI8Je4gj3pahH+Ca2k1p/qZom5fwS2vp
	 JJxYUUc0bl3pZJY/T2vZiPjGz5HVFqf1qELQlqx3JivNkzkYBVHxY/iRLfiPFRyJ9V
	 c4GC7fklO9sAg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 22:59:25 +0300 (MSK)
Message-ID: <2ed06841-6c9f-46c9-2d2d-2daffb0a9010@sberdevices.ru>
Date: Tue, 6 Jun 2023 22:54:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: waiting w/o wired ready/busy pin
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230606195128.83432-1-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230606195128.83432-1-AVKrasnov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230606_125928_483544_CC99C73C 
X-CRM114-Status: GOOD (  29.12  )
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



On 06.06.2023 22:51, Arseniy Krasnov wrote:
> If there is no wired ready/busy pin, classic way to wait for command
> completion is to use function 'nand_soft_waitrdy()'. Meson NAND has
> special command which allows to wait for NAND_STATUS_READY bit without
> reading status in a software loop (as 'nand_soft_waitrdy()' does). To
> use it send this command along with NAND_CMD_STATUS, then wait for an
> interrupt, and after interrupt send NAND_CMD_READ0. So this feature
> allows to use interrupt driven waiting without wired ready/busy pin.
> 
> Suggested-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 58 ++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 074e14225c06..f4c5309a9527 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -38,6 +38,7 @@
>  #define NFC_CMD_SCRAMBLER_DISABLE	0
>  #define NFC_CMD_SHORTMODE_DISABLE	0
>  #define NFC_CMD_RB_INT		BIT(14)
> +#define NFC_CMD_RB_INT_NO_PIN	((0xb << 10) | BIT(18) | BIT(16))
>  
>  #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
>  
> @@ -94,6 +95,7 @@
>  
>  /* nand flash controller delay 3 ns */
>  #define NFC_DEFAULT_DELAY	3000
> +#define NFC_NO_RB_PIN_DELAY	5
>  
>  #define ROW_ADDER(page, index)	(((page) >> (8 * (index))) & 0xff)
>  #define MAX_CYCLE_ADDRS		5
> @@ -179,6 +181,7 @@ struct meson_nfc {
>  	u32 info_bytes;
>  
>  	unsigned long assigned_cs;
> +	bool no_rb_pin;
>  };
>  
>  enum {
> @@ -392,7 +395,41 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
>  	}
>  }
>  
> -static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
> +static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms)
> +{
> +	u32 cmd, cfg;
> +
> +	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
> +	meson_nfc_drain_cmd(nfc);
> +	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
> +
> +	cfg = readl(nfc->reg_base + NFC_REG_CFG);
> +	cfg |= NFC_RB_IRQ_EN;
> +	writel(cfg, nfc->reg_base + NFC_REG_CFG);
> +
> +	reinit_completion(&nfc->completion);
> +	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_STATUS;
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +	meson_nfc_cmd_idle(nfc, NFC_NO_RB_PIN_DELAY);

^^^

> +
> +	/* use the max erase time as the maximum clock for waiting R/B */
> +	cmd = NFC_CMD_RB | NFC_CMD_RB_INT_NO_PIN | nfc->timing.tbers_max;
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +	meson_nfc_cmd_idle(nfc, NFC_NO_RB_PIN_DELAY);

^^^
Liang, I've implemented "new RB_INT" way instead of 'nand_soft_waitrdy()'. There were two numbers
2 and 5 in 'meson_nfc_cmd_idle()' as time argument (here and above). I've replaced both with
define of 5 == NFC_NO_RB_PIN_DELAY. Is it correct? 2 and 5 were from doc?

Thanks, Arseniy

> +
> +	if (!wait_for_completion_timeout(&nfc->completion,
> +					 msecs_to_jiffies(timeout_ms)))
> +		return -ETIMEDOUT;
> +
> +	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_READ0;
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +	meson_nfc_drain_cmd(nfc);
> +	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
> +
> +	return 0;
> +}
> +
> +static int meson_nfc_wait_rb_pin(struct meson_nfc *nfc, int timeout_ms)
>  {
>  	u32 cmd, cfg;
>  	int ret = 0;
> @@ -420,6 +457,23 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
>  	return ret;
>  }
>  
> +static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
> +{
> +	if (nfc->no_rb_pin) {
> +		/* This mode is used when there is no wired R/B pin.
> +		 * It works like 'nand_soft_waitrdy()', but instead of
> +		 * polling NAND_CMD_STATUS bit in the software loop,
> +		 * it will wait for interrupt - controllers checks IO
> +		 * bus and when it detects NAND_CMD_STATUS on it, it
> +		 * raises interrupt. After interrupt, NAND_CMD_READ0 is
> +		 * sent as terminator of the ready waiting procedure.
> +		 */
> +		return meson_nfc_wait_no_rb_pin(nfc, timeout_ms);
> +	} else {
> +		return meson_nfc_wait_rb_pin(nfc, timeout_ms);
> +	}
> +}
> +
>  static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
>  {
>  	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
> @@ -1412,6 +1466,8 @@ static int meson_nfc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	nfc->no_rb_pin = !of_property_read_bool(dev->of_node, "nand-rb");
> +
>  	writel(0, nfc->reg_base + NFC_REG_CFG);
>  	ret = devm_request_irq(dev, irq, meson_nfc_irq, 0, dev_name(dev), nfc);
>  	if (ret) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
