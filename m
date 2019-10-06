Return-Path: <SRS0=6Y1V=X7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E651EC4360C
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Oct 2019 20:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75CC2077B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Oct 2019 20:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZoXHGXPn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsFVsQds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75CC2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q8MlPQQRndHpDVEDrTHSCYU5rtgN0g1qNKISetUpms4=; b=ZoXHGXPnYoteFMii31YwGz6X0
	WmsqW1iU6/okBpokwVnBBOJgoVEp6rfR94+Ci33b/fSVY0VsZOWEqqUfCbcepzTUOk1e+3X8by2Dv
	G9IApWkOB5yuZurIM4LaHNij4KLLs3D8l0eg2CXnyEw1UhBDd72pSJDeY/w5yztoQwzXA0F/0ECcu
	QAqzjQMWFsGHqt/aRt/VGXKYp49HHh0gY9Xe0IsXOILlaz9lk4iOEfdkwDhft4fFxuQobOwdY1Uy/
	xwziEzq4p4Ly5nwyiBms09p3wpUHOr8uGbXZlxQ7vBqPSz8cSfbELkIUH0cBQqFhgBjM24xmuy4qa
	PVL37czgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHDYQ-0004kX-Ao; Sun, 06 Oct 2019 20:54:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHDYN-0004jz-CZ
 for linux-mtd@lists.infradead.org; Sun, 06 Oct 2019 20:54:57 +0000
Received: by mail-pg1-x544.google.com with SMTP id 23so6927938pgk.3
 for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2019 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Oto0iGuUF6i//YiRM1HUoy4cNZ89Cr3FtnBGS4SxQWY=;
 b=jsFVsQdsr2yAMMW9s1G/Etw+UOWRugSKFmlrVnMamW6IqwpKBC650Wq2O73QE+Dnet
 6VUUdsSA3x2SrLf6yVvOww/UDay3mitt9uj/vD95yI5YlDQMLlOzQNDKOqvyWrL3rJUG
 stdoLnObOwox7EjL6/EJhU+wX1Dh4WQWXya6l6ND8MiwZxWmnB50yGBqGg05yuVmPi/f
 oJl94ky9kIB4loBXwTYcQ6/giZVyNol+3dBF/KekphIHbpTjB1Tsjaop/BcR115K9HhR
 8PDB7ZLsS2gJ3PjXx92Kx7Utq7CGdGOd+BBH4xoA10t8PEIfZZUVOSRyDNny0KA2LWE2
 yjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Oto0iGuUF6i//YiRM1HUoy4cNZ89Cr3FtnBGS4SxQWY=;
 b=EmmX1W8IToWNbyc+l/qSzU2J/NZepYdrDx1fgzfzKGE64UzdpPMyyRCtI0ul70VFxI
 jhxCPBX4oU7Ang3CNAzir/9Ee74oUBxI/mvUKEgVvKG6rXstuBSVc98rQmBPHFgYbJzP
 YvhJz4TzPBq66EU4U2gVmaFzoxgeV3NQNQcfD4dEcUNbkqujGkHPzZu89YOnNho22q8T
 wnfrntg5zD/2MdBgPqQtgsrNYQzpVOXnDljGtO8Se5kIeBtdi1v0jTz7XREGiAnX1VbP
 rIC/Dhme9MsbKqPsRfRyYtO0vuV7HNAzPwtMVtMowk2fKLXb1HSCcBLFxd+OO1ymdWGI
 iksA==
X-Gm-Message-State: APjAAAU3L9TcApBzPhEk4ZCiHlp7fOZhYv2ct0FDnD1wIknvHC8cJODo
 Sm4Sa1J2ZL4x2yixl08MTuhYWumd
X-Google-Smtp-Source: APXvYqyytAxgy+ya1nH34JKffwY+DuRpnFlhzhVuJxSo+s0oPt2qz7857Do7Qdjsk8/EnxwlSKQaqg==
X-Received: by 2002:a63:8943:: with SMTP id v64mr11850709pgd.209.1570395291949; 
 Sun, 06 Oct 2019 13:54:51 -0700 (PDT)
Received: from ?IPv6:240b:10:2720:5510:ecbc:2810:d938:25e3?
 ([240b:10:2720:5510:ecbc:2810:d938:25e3])
 by smtp.gmail.com with ESMTPSA id q204sm14906824pfc.11.2019.10.06.13.54.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Oct 2019 13:54:50 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
 <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
Message-ID: <b4d19e66-83e6-d7a2-8aa6-85034460725e@gmail.com>
Date: Mon, 7 Oct 2019 05:54:46 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191006_135455_435535_DE6DFA6E 
X-CRM114-Status: GOOD (  26.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2019/10/04 3:34, Sergei Shtylyov wrote:
> The commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
> status register") added checking for the status register error bits into
> chip_good() to only return 1 if these bits are zero. Unfortunately, this
> means that polling using chip_good() always reaches a time-out condition
> when erase or program failure bits are set. I think the status register
> error checking should be fully delegated to cfi_check_err_status() that
> should return whether any error bits were set or not...
>
> Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>   drivers/mtd/chips/cfi_cmdset_0002.c |   55 +++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 25 deletions(-)
>
> Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
> ===================================================================
> --- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -123,14 +123,14 @@ static int cfi_use_status_reg(struct cfi
>   		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
>   }
>   
> -static void cfi_check_err_status(struct map_info *map, struct flchip *chip,
> -				 unsigned long adr)
> +static int cfi_check_err_status(struct map_info *map, struct flchip *chip,
> +				unsigned long adr)
>   {
>   	struct cfi_private *cfi = map->fldrv_priv;
>   	map_word status;
>   
>   	if (!cfi_use_status_reg(cfi))
> -		return;
> +		return 0;
>   
>   	cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>   			 cfi->device_type, NULL);
> @@ -138,7 +138,7 @@ static void cfi_check_err_status(struct
>   
>   	/* The error bits are invalid while the chip's busy */
>   	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
> -		return;
> +		return 0;
>   
>   	if (map_word_bitsset(map, status, CMD(0x3a))) {
>   		unsigned long chipstatus = MERGESTATUS(status);
> @@ -155,7 +155,9 @@ static void cfi_check_err_status(struct
>   		if (chipstatus & CFI_SR_SLSB)
>   			pr_err("%s sector write protected, status %lx\n",
>   			       map->name, chipstatus);
> +		return 1;
Is it okay to be returned 1 for the errors CFI_SR_WBASB and CFI_SR_SLSB 
also?
Before the change only CFI_SR_ESB and CFI_SR_PSB were checked by 
chip_good().
>   	}
> +	return 0;
>   }
>   
>   /* #define DEBUG_CFI_FEATURES */
> @@ -852,20 +854,16 @@ static int __xipram chip_good(struct map
>   
>   	if (cfi_use_status_reg(cfi)) {
>   		map_word ready = CMD(CFI_SR_DRB);
> -		map_word err = CMD(CFI_SR_PSB | CFI_SR_ESB);
> +
>   		/*
>   		 * For chips that support status register, check device
> -		 * ready bit and Erase/Program status bit to know if
> -		 * operation succeeded.
> +		 * ready bit
>   		 */
>   		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>   				 cfi->device_type, NULL);
>   		curd = map_read(map, addr);
>   
> -		if (map_word_andequal(map, curd, ready, ready))
> -			return !map_word_bitsset(map, curd, err);
> -
> -		return 0;
> +		return map_word_andequal(map, curd, ready, ready);
>   	}
>   
>   	oldd = map_read(map, addr);
> @@ -1703,8 +1701,11 @@ static int __xipram do_write_oneword_onc
>   			break;
>   		}
>   
> -		if (chip_good(map, chip, adr, datum))
> +		if (chip_good(map, chip, adr, datum)) {
> +			if (cfi_check_err_status(map, chip, adr))
> +				ret = -EIO;
>   			break;
> +		}
>   
>   		/* Latency issues. Drop the lock, wait a while and retry */
>   		UDELAY(map, chip, adr, 1);
> @@ -1777,7 +1778,6 @@ static int __xipram do_write_oneword_ret
>   	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
>   	if (ret) {
>   		/* reset on all failures. */
> -		cfi_check_err_status(map, chip, adr);
>   		map_write(map, CMD(0xF0), chip->start);
>   		/* FIXME - should have reset delay before continuing */
>   
> @@ -1974,12 +1974,17 @@ static int __xipram do_write_buffer_wait
>   		 */
>   		if (time_after(jiffies, timeo) &&
>   		    !chip_good(map, chip, adr, datum)) {
> +			pr_warn("MTD %s(): software timeout, address:0x%.8lx.\n",
> +				__func__, adr);

Is there any reason to change the message to use pr_warn() from pr_err()?
In the past it was changed to use pr_err() from printk(KERN_WARNING) as 
mentioned by the maintainer.

Regards,
Ikegami

>   			ret = -EIO;
>   			break;
>   		}
>   
> -		if (chip_good(map, chip, adr, datum))
> +		if (chip_good(map, chip, adr, datum)) {
> +			if (cfi_check_err_status(map, chip, adr))
> +				ret = -EIO;
>   			break;
> +		}
>   
>   		/* Latency issues. Drop the lock, wait a while and retry */
>   		UDELAY(map, chip, adr, 1);
> @@ -2075,12 +2080,8 @@ static int __xipram do_write_buffer(stru
>   				chip->word_write_time);
>   
>   	ret = do_write_buffer_wait(map, chip, adr, datum);
> -	if (ret) {
> -		cfi_check_err_status(map, chip, adr);
> +	if (ret)
>   		do_write_buffer_reset(map, chip, cfi);
> -		pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
> -		       __func__, adr);
> -	}
>   
>   	xip_enable(map, chip, adr);
>   
> @@ -2275,9 +2276,9 @@ retry:
>   		udelay(1);
>   	}
>   
> -	if (!chip_good(map, chip, adr, datum)) {
> +	if (!chip_good(map, chip, adr, datum) ||
> +	    cfi_check_err_status(map, chip, adr)) {
>   		/* reset on all failures. */
> -		cfi_check_err_status(map, chip, adr);
>   		map_write(map, CMD(0xF0), chip->start);
>   		/* FIXME - should have reset delay before continuing */
>   
> @@ -2471,8 +2472,11 @@ static int __xipram do_erase_chip(struct
>   			chip->erase_suspended = 0;
>   		}
>   
> -		if (chip_good(map, chip, adr, map_word_ff(map)))
> +		if (chip_good(map, chip, adr, map_word_ff(map))) {
> +			if (cfi_check_err_status(map, chip, adr))
> +				ret = -EIO;
>   			break;
> +		}
>   
>   		if (time_after(jiffies, timeo)) {
>   			printk(KERN_WARNING "MTD %s(): software timeout\n",
> @@ -2487,7 +2491,6 @@ static int __xipram do_erase_chip(struct
>   	/* Did we succeed? */
>   	if (ret) {
>   		/* reset on all failures. */
> -		cfi_check_err_status(map, chip, adr);
>   		map_write(map, CMD(0xF0), chip->start);
>   		/* FIXME - should have reset delay before continuing */
>   
> @@ -2568,8 +2571,11 @@ static int __xipram do_erase_oneblock(st
>   			chip->erase_suspended = 0;
>   		}
>   
> -		if (chip_good(map, chip, adr, map_word_ff(map)))
> +		if (chip_good(map, chip, adr, map_word_ff(map))) {
> +			if (cfi_check_err_status(map, chip, adr))
> +				ret = -EIO;
>   			break;
> +		}
>   
>   		if (time_after(jiffies, timeo)) {
>   			printk(KERN_WARNING "MTD %s(): software timeout\n",
> @@ -2584,7 +2590,6 @@ static int __xipram do_erase_oneblock(st
>   	/* Did we succeed? */
>   	if (ret) {
>   		/* reset on all failures. */
> -		cfi_check_err_status(map, chip, adr);
>   		map_write(map, CMD(0xF0), chip->start);
>   		/* FIXME - should have reset delay before continuing */
>   
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
