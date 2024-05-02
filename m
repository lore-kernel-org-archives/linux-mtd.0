Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24EFC25B4F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2024 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ls62xstpPXyu8XcmZe42oa4MC+StM4JdinjWkbOgod0=; b=adyd7ftdG48psC
	kOIfFv6/wItqrhXMhbCPw6grWVe2Gh0d4Btq0Cg9CtCK+PFopHSi564N9l27ah8MCYQKqCEx6emUJ
	M83DnyyUy4zZYfNyWDhsBZe1J0HQjoLUM34X2lpVJNaCCTowBs+41O3lGInCdcWOxn9UDiBbMoFsU
	P21N7S12EhYqQ5QVfFlAsWyNiB4QSNNIKAORcY0QyT3lhHRyshdGfoj4osJgHGzVrgFnEBS+i2Q3d
	IXloL6tsKXFWRpR0tCdsjGfltnrc5Pf7lGjf9B7h8Q0bvhsEB6HtMBqfW5CWoMfXq/D3MU1sP0fkF
	krI/27/1287zBwZXtWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Orz-0000000BVdl-31AJ;
	Thu, 02 May 2024 05:20:35 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Ors-0000000BVcQ-2XPa;
	Thu, 02 May 2024 05:20:31 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 133CC100006;
	Thu,  2 May 2024 08:20:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 133CC100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714627219;
	bh=jyt21ymV/baNJUH86P4QwCA/H74Wl5dAgGlilTBLYBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=M1sT6ackbpYhkzdLsuUzsiOYrFUZLPewyJkMWT9ge5xjkzAgU2kBqAnuOlBE9O/iM
	 mhYdVc1SIQR9eCCpmROoBV2u51NwgJL2ueElBzZhYWnhh1bo8P1ip0VD8srmvMkcO7
	 p5RSs+5yr9pkZuidKXgFpcO0yQ/RCi5V0Or7AXRx/vAfr6st23arRekp8bqfEubW62
	 LtqXJ6kofWCoUY82iMLeEd7cPJbARneQYVKuTCGl4G++Ju+BNbT6g0vHztQ7sp8iLQ
	 WyMWbSlB00iQ2KoTHx4mbHex953C2qA1Jk6C8elLbad/hatI9ngyQQYT2oGScGgGHy
	 HnYMVbHQcRObA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  2 May 2024 08:20:18 +0300 (MSK)
Received: from [192.168.0.106] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 2 May 2024 08:20:18 +0300
Message-ID: <2e5b39a1-ffe6-1186-2ce7-51b61c5006d3@salutedevices.com>
Date: Thu, 2 May 2024 08:09:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/2] mtd: rawnand: meson: support R/W mode for boot ROM
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
 <20240416085101.740458-3-avkrasnov@salutedevices.com>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240416085101.740458-3-avkrasnov@salutedevices.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184990 [May 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/01 20:56:00 #25053682
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_222029_377967_EDADABA0 
X-CRM114-Status: GOOD (  25.73  )
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

Hello, sorry, pls ping, 2 weeks :)

Thanks, Arseniy

On 16.04.2024 11:51, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages located with the specified interval
> within specified offset. Both interval and offset are located in the
> device tree and used by driver if 'nand-is-boot-medium' is set for
> NAND chip.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 88 +++++++++++++++++++++----------
>  1 file changed, 59 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 00ce0e5bb970..9ee11243b257 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -35,6 +35,7 @@
>  #define NFC_CMD_RB		BIT(20)
>  #define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
>  #define NFC_CMD_SCRAMBLER_DISABLE	0
> +#define NFC_CMD_SHORTMODE_ENABLE	1
>  #define NFC_CMD_SHORTMODE_DISABLE	0
>  #define NFC_CMD_RB_INT		BIT(14)
>  #define NFC_CMD_RB_INT_NO_PIN	((0xb << 10) | BIT(18) | BIT(16))
> @@ -78,6 +79,8 @@
>  #define DMA_DIR(dir)		((dir) ? NFC_CMD_N2M : NFC_CMD_M2N)
>  #define DMA_ADDR_ALIGN		8
>  
> +#define NFC_SHORT_MODE_ECC_SZ	384
> +
>  #define ECC_CHECK_RETURN_FF	(-1)
>  
>  #define NAND_CE0		(0xe << 10)
> @@ -125,6 +128,8 @@ struct meson_nfc_nand_chip {
>  	u32 twb;
>  	u32 tadl;
>  	u32 tbers_max;
> +	u32 boot_pages;
> +	u32 boot_page_step;
>  
>  	u32 bch_mode;
>  	u8 *data_buf;
> @@ -298,28 +303,49 @@ static void meson_nfc_cmd_seed(struct meson_nfc *nfc, u32 seed)
>  	       nfc->reg_base + NFC_REG_CMD);
>  }
>  
> -static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
> -				 int scrambler)
> +static int meson_nfc_page_is_boot(struct nand_chip *nand, int page)
> +{
> +	const struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
> +
> +	return (nand->options & NAND_IS_BOOT_MEDIUM) &&
> +	       !(page % meson_chip->boot_page_step) &&
> +	       (page < meson_chip->boot_pages);
> +}
> +
> +static void meson_nfc_cmd_access(struct nand_chip *nand, bool raw, bool dir, int page)
>  {
> +	const struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
>  	struct mtd_info *mtd = nand_to_mtd(nand);
>  	struct meson_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
> -	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
> -	u32 bch = meson_chip->bch_mode, cmd;
>  	int len = mtd->writesize, pagesize, pages;
> +	int scrambler;
> +	u32 cmd;
>  
> -	pagesize = nand->ecc.size;
> +	if (nand->options & NAND_NEED_SCRAMBLING)
> +		scrambler = NFC_CMD_SCRAMBLER_ENABLE;
> +	else
> +		scrambler = NFC_CMD_SCRAMBLER_DISABLE;
>  
>  	if (raw) {
>  		len = mtd->writesize + mtd->oobsize;
>  		cmd = len | scrambler | DMA_DIR(dir);
> -		writel(cmd, nfc->reg_base + NFC_REG_CMD);
> -		return;
> -	}
> +	} else if (meson_nfc_page_is_boot(nand, page)) {
> +		pagesize = NFC_SHORT_MODE_ECC_SZ >> 3;
> +		pages = mtd->writesize / 512;
> +
> +		scrambler = NFC_CMD_SCRAMBLER_ENABLE;
> +		cmd = CMDRWGEN(DMA_DIR(dir), scrambler, NFC_ECC_BCH8_1K,
> +			       NFC_CMD_SHORTMODE_ENABLE, pagesize, pages);
> +	} else {
> +		pagesize = nand->ecc.size >> 3;
> +		pages = len / nand->ecc.size;
>  
> -	pages = len / nand->ecc.size;
> +		cmd = CMDRWGEN(DMA_DIR(dir), scrambler, meson_chip->bch_mode,
> +			       NFC_CMD_SHORTMODE_DISABLE, pagesize, pages);
> +	}
>  
> -	cmd = CMDRWGEN(DMA_DIR(dir), scrambler, bch,
> -		       NFC_CMD_SHORTMODE_DISABLE, pagesize, pages);
> +	if (scrambler == NFC_CMD_SCRAMBLER_ENABLE)
> +		meson_nfc_cmd_seed(nfc, page);
>  
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  }
> @@ -743,15 +769,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
>  	if (ret)
>  		return ret;
>  
> -	if (nand->options & NAND_NEED_SCRAMBLING) {
> -		meson_nfc_cmd_seed(nfc, page);
> -		meson_nfc_cmd_access(nand, raw, DIRWRITE,
> -				     NFC_CMD_SCRAMBLER_ENABLE);
> -	} else {
> -		meson_nfc_cmd_access(nand, raw, DIRWRITE,
> -				     NFC_CMD_SCRAMBLER_DISABLE);
> -	}
> -
> +	meson_nfc_cmd_access(nand, raw, DIRWRITE, page);
>  	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>  	meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tPROG_max), false);
> @@ -829,15 +847,7 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
>  	if (ret)
>  		return ret;
>  
> -	if (nand->options & NAND_NEED_SCRAMBLING) {
> -		meson_nfc_cmd_seed(nfc, page);
> -		meson_nfc_cmd_access(nand, raw, DIRREAD,
> -				     NFC_CMD_SCRAMBLER_ENABLE);
> -	} else {
> -		meson_nfc_cmd_access(nand, raw, DIRREAD,
> -				     NFC_CMD_SCRAMBLER_DISABLE);
> -	}
> -
> +	meson_nfc_cmd_access(nand, raw, DIRREAD, page);
>  	ret = meson_nfc_wait_dma_finish(nfc);
>  	meson_nfc_check_ecc_pages_valid(nfc, nand, raw);
>  
> @@ -1436,6 +1446,26 @@ meson_nfc_nand_chip_init(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> +	if (nand->options & NAND_IS_BOOT_MEDIUM) {
> +		ret = of_property_read_u32(np, "amlogic,boot-pages",
> +					   &meson_chip->boot_pages);
> +		if (ret) {
> +			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
> +				ret);
> +			nand_cleanup(nand);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32(np, "amlogic,boot-page-step",
> +					   &meson_chip->boot_page_step);
> +		if (ret) {
> +			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
> +				ret);
> +			nand_cleanup(nand);
> +			return ret;
> +		}
> +	}
> +
>  	ret = mtd_device_register(mtd, NULL, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register MTD device: %d\n", ret);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
