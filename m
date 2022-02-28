Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC008C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+Hki6Gvk9doeG5bTJC5JSGFRfNFpFoFjejZWV8qhUA=; b=lJdcRHeXmF2C62
	B/SS6eEZnVhgMw15NWDnjE0+4KbmQ8f0NpBsMWd2Qu4KTtGse3PnxooVm5UumOge0f0xFej8owfWn
	9xusTJJniSTxHqec2Wyd0yRpVi7S1Fd4JyRrf++SGZ2McZxM39pqaltGacfzf2mwg7HCpxg6xpDyh
	tQ2IEigF7rE/f1Wa00cGw6UZeFFxVHR8SegOg1Zt3ax9RtH+/lmwOOdr0wAj2F69eUrruJSlqWlX4
	v4lzeDX+MGUHoZ0aNq9WRx8ya4VEs9aBRv3wREeGBrj1//GUyagW0a6Y6p8UqwWr6+D8HnM8bquY6
	+zLt2XhNnh/pbm1aPMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOi3g-00DAcU-Sh; Mon, 28 Feb 2022 15:35:32 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOi3c-00DAc3-Si
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 15:35:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21SFZOO4073276;
 Mon, 28 Feb 2022 09:35:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1646062524;
 bh=jBRTdblN1RAmc+4Nczn8RlsQ7gDEaz21mwBipojhJ7Q=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=PS/cMYq5au6dzgrnCq4DJyWTyJw0LRODiYXFnuyk1tSoObC4V/P4PknzYuJYjaYCt
 qgwOUJwLCRRl800D+sUMXZchtSlSsAkG081dqAhA54J0f5RYU0011rSwskFCCuWISo
 9GTTgNw9KYtPQW38wpDqPfaReXzqGTRl+plHLaOQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21SFZOPm081253
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 28 Feb 2022 09:35:24 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 28
 Feb 2022 09:35:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 28 Feb 2022 09:35:23 -0600
Received: from [10.250.233.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21SFZLxK077386;
 Mon, 28 Feb 2022 09:35:22 -0600
Message-ID: <e9cb486d-b775-896c-93b5-3a1154bd9f3e@ti.com>
Date: Mon, 28 Feb 2022 21:04:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 <stable@vger.kernel.org>
References: <20220214182011.8493-1-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20220214182011.8493-1-ikegami.t@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_073529_052482_7495C3E2 
X-CRM114-Status: GOOD (  32.75  )
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

Hi,

On 14/02/22 11:50 pm, Tokunori Ikegami wrote:
> The regression issue has been caused on S29GL064N and reported it.
> Also the change mentioned is to use chip_good() for buffered write.
> So disable the change on S29GL064N and use chip_ready() as before.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> ---
Thanks for working on the fix.

Please CC maintainers from

./scripts/get_maintainer.pl -f drivers/mtd/chips/cfi_cmdset_0002.c

Else, patch would not get attention in time.

>  drivers/mtd/chips/cfi_cmdset_0002.c | 105 ++++++++++++++++------------
>  1 file changed, 59 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index a761134fd3be..a0dfc8ace899 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -48,6 +48,7 @@
>  #define SST49LF040B		0x0050
>  #define SST49LF008A		0x005a
>  #define AT49BV6416		0x00d6
> +#define S29GL064N_MN12		0x0c01
>  
>  /*
>   * Status Register bit description. Used by flash devices that don't
> @@ -109,6 +110,8 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
>  	.module		= THIS_MODULE
>  };
>  
> +static bool use_chip_good_for_write;
> +

Can we use per device private flag? Else this wont work on systems with
multiple CFI flashes with one of them being S29GL064N_MN12.

>  /*
>   * Use status register to poll for Erase/write completion when DQ is not
>   * supported. This is indicated by Bit[1:0] of SoftwareFeatures field in
> @@ -283,6 +286,17 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
>  }
>  #endif /* !FORCE_WORD_WRITE */
>  
> +static void fixup_use_chip_good_for_write(struct mtd_info *mtd)
> +{
> +	struct map_info *map = mtd->priv;
> +	struct cfi_private *cfi = map->fldrv_priv;
> +
> +	if (cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12)
> +		return;
> +
> +	use_chip_good_for_write = true;
> +}
> +
>  /* Atmel chips don't use the same PRI format as AMD chips */
>  static void fixup_convert_atmel_pri(struct mtd_info *mtd)
>  {
> @@ -462,7 +476,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
>  	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
>  	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
> -	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
> +	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
>  	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
>  	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
>  	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
> @@ -474,6 +488,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  #if !FORCE_WORD_WRITE
>  	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
>  #endif
> +	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_chip_good_for_write },
>  	{ 0, 0, NULL }
>  };
>  static struct cfi_fixup jedec_fixup_table[] = {
> @@ -801,42 +816,61 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
>  	return NULL;
>  }
>  
> -/*
> - * Return true if the chip is ready.
> - *
> - * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
> - * non-suspended sector) and is indicated by no toggle bits toggling.
> - *
> - * Note that anything more complicated than checking if no bits are toggling
> - * (including checking DQ5 for an error status) is tricky to get working
> - * correctly and is therefore not done	(particularly with interleaved chips
> - * as each chip must be checked independently of the others).
> - */
> -static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
> -			       unsigned long addr)
> +static int __xipram chip_check(struct map_info *map, struct flchip *chip,
> +			       unsigned long addr, map_word *expected)
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
> -	map_word d, t;
> +	map_word oldd, curd;
> +	int ret;
>  
>  	if (cfi_use_status_reg(cfi)) {
>  		map_word ready = CMD(CFI_SR_DRB);
> +
Unrelated change?

>  		/*
>  		 * For chips that support status register, check device
>  		 * ready bit
>  		 */
>  		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>  				 cfi->device_type, NULL);
> -		d = map_read(map, addr);
> +		curd = map_read(map, addr);
>  
> -		return map_word_andequal(map, d, ready, ready);
> +		return map_word_andequal(map, curd, ready, ready);
>  	}
>  
> -	d = map_read(map, addr);
> -	t = map_read(map, addr);
> +	oldd = map_read(map, addr);
> +	curd = map_read(map, addr);
> +
> +	ret = map_word_equal(map, oldd, curd);
> +
> +	if (!ret || !expected)
> +		return ret;

Why even read oldd and curd if !expected ?

> +
> +	return map_word_equal(map, curd, *expected);
> +}
> +
> +static int __xipram chip_good_for_write(struct map_info *map,
> +					struct flchip *chip, unsigned long addr,
> +					map_word expected)
> +{
> +	if (use_chip_good_for_write)
> +		return chip_check(map, chip, addr, &expected);
>  
> -	return map_word_equal(map, d, t);
> +	return chip_check(map, chip, addr, NULL);
>  }
>  
> +/*
> + * Return true if the chip is ready.
> + *
> + * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
> + * non-suspended sector) and is indicated by no toggle bits toggling.
> + *
> + * Note that anything more complicated than checking if no bits are toggling
> + * (including checking DQ5 for an error status) is tricky to get working
> + * correctly and is therefore not done	(particularly with interleaved chips
> + * as each chip must be checked independently of the others).
> + */
> +#define chip_ready(map, chip, addr) chip_check(map, chip, addr, NULL)
> +
>  /*
>   * Return true if the chip is ready and has the correct value.
>   *
> @@ -855,28 +889,7 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
>  static int __xipram chip_good(struct map_info *map, struct flchip *chip,
>  			      unsigned long addr, map_word expected)
>  {
> -	struct cfi_private *cfi = map->fldrv_priv;
> -	map_word oldd, curd;
> -
> -	if (cfi_use_status_reg(cfi)) {
> -		map_word ready = CMD(CFI_SR_DRB);
> -
> -		/*
> -		 * For chips that support status register, check device
> -		 * ready bit
> -		 */
> -		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
> -				 cfi->device_type, NULL);
> -		curd = map_read(map, addr);
> -
> -		return map_word_andequal(map, curd, ready, ready);
> -	}
> -
> -	oldd = map_read(map, addr);
> -	curd = map_read(map, addr);
> -
> -	return	map_word_equal(map, oldd, curd) &&
> -		map_word_equal(map, curd, expected);
> +	return chip_check(map, chip, addr, &expected);
>  }
>  
>  static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
> @@ -1699,7 +1712,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
>  		 * "chip_good" to avoid the failure due to scheduling.
>  		 */
>  		if (time_after(jiffies, timeo) &&
> -		    !chip_good(map, chip, adr, datum)) {
> +		    !chip_good_for_write(map, chip, adr, datum)) {
>  			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
>  			xip_disable(map, chip, adr);
> @@ -1707,7 +1720,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
>  			break;
>  		}
>  
> -		if (chip_good(map, chip, adr, datum)) {
> +		if (chip_good_for_write(map, chip, adr, datum)) {
>  			if (cfi_check_err_status(map, chip, adr))
>  				ret = -EIO;
>  			break;
> @@ -1979,14 +1992,14 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
>  		 * "chip_good" to avoid the failure due to scheduling.
>  		 */
>  		if (time_after(jiffies, timeo) &&
> -		    !chip_good(map, chip, adr, datum)) {
> +		    !chip_good_for_write(map, chip, adr, datum)) {
>  			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
>  			       __func__, adr);
>  			ret = -EIO;
>  			break;
>  		}
>  
> -		if (chip_good(map, chip, adr, datum)) {
> +		if (chip_good_for_write(map, chip, adr, datum)) {
>  			if (cfi_check_err_status(map, chip, adr))
>  				ret = -EIO;
>  			break;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
