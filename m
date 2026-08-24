Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46189C5DF94
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCaNPH3DGmxVeIMrVZwitoSDX42Qb1R/QQkQPraI2Q8=; b=xD0oLyaCOHY0p2
	R9MjrwjSZLFp4XT25GXJbBJVGxlR42/yhLQaCuE9W4qoB7RPi9gZ02oUsQVN5uy9cADh/2pgz/4u5
	F89rNYYDS2LjxPLgJpAWpH+50F0LrxxctF6zy5YDaZpouYjfaj/wvjEuaexNlUc2ADKYLnbrIjLAP
	cO/wQnziLBZuHzfuiSifnfzltiNyVXzb4EQawDnBV5ml/A3Br6YkvP/jd8vDllSrRVAc0UmtliBZf
	jitVGZnjTOTNuhhGdM7GCXGNRDqIFMEak+43jzRaaDOHvFaYR+JKraw0BU0HfJkhMbdxFCG/q9ANu
	aYA7JjVzMfVQrlupiH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPXt-0000000GA3L-0OnY;
	Mon, 24 Aug 2026 07:56:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPXq-0000000GA2l-1rMB
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 07:56:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so17282465e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2026 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558195; x=1788162995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IE8kFIz49p9hLyGen3p2a/60iDUMeHiZ+R4qjtbPgPM=;
        b=jjcdKJ7Ae7rY3XBxV4Ek6IQmFvZPNnjFAOIq/0oMUFw5peOHFKIx4O/S/CWN5cwKyZ
         dH4SRcIdJXrog4GaiDSRD5hBHrvULf/N5L5TcDDK5kTHwOalN8Ir6fraceSTm+LrmHUK
         JTSwMmg/yiaV6HIySrrQ+5XU9jDwIc7OXQL1PIOpOrgIJyXf1viMX8PTXxEBUKVb58gt
         WH2USqYnfHoy1o0rq+BNBokgTaUV8o1k/+qyGaxA/HKZZeEXIKMSNvoexLJtg/lxDuNB
         3QGMRtKRgvw96PUnYA1GO8nMkr7J+D5w5phUhOPOMcWBqgJ6D7MgMacA3ea03EpPKCsb
         mRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558195; x=1788162995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE8kFIz49p9hLyGen3p2a/60iDUMeHiZ+R4qjtbPgPM=;
        b=PSDVMM3mFaBKmPCjyiF2YCi/ccCDrg+BG4Zb1sx+qGnrofLxLHZnNQrkAlhTsLrB9+
         8gQCmJf+VmSrzKUsBHtjeavuXXm2QkKEMkDe5oCtczOKAjrCes92v+blgZjZFuCWX6M4
         mXX8TL+/UWqut+jQxaQE86M4iYjMqb14e/Al4ihGm/bsdWCA3JPnR1OTF/EEG7cJQEsj
         K2ahZTQx7tmL6lCswuxDG/PK2uNuE5WKKQoEuPcH60VN6O1hPA34+EHIqXDgWC2Xau9S
         86gwZD5Vjro0N2rhqHKc2oGICttIAYomGUi5Fi/sU3wOLH5PaaRx41jVjxOfE0mh4qBV
         rtqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/efari5kyS+HWCJ2gsuSfRgs8nwk0zfs0bV3UltCqhlqry7Sz3a6G/ounLqkS6KrBglAAAJWeB5I=@lists.infradead.org
X-Gm-Message-State: AFuF++l3ERvCetlr/gfnOdDnKSLdMUetRU34v4TBee8dlBGU3HNhcjpS
	X8yZmnnxziWdMt4IGme+evxzCJHhIOlLDg9+buH5IoeRdDG02wPWXUPA
X-Gm-Gg: AR+sD10uSYJKgjzCrolBjB+BZXn3r9d16/1hm6UFpfkEw95yE3MY7aRf3WQQbMt3CnC
	84aEIamLCVSshyLe5rhv7gZ9ZC4QIutSJJPd/RnNARUfxT6HYOT6wLilqMadxeF7bsFbKXRwsgh
	aIgOZUbG8i8g+b/Cg98Wh3h+/cyCaTjFfSnGlg3AISNaDiYCjMlTn0LDeVBpzgWUi+/6kTWBuJf
	X6UAXdVkeWxsg16whh92RS9nKfpUdSpmIEMIZIU554HoQ36RWAKNbDXm5M50kgnTymvgUOUOHK+
	57kFJbcV/3FyZYODrQXL/bke+1F8j1KrbO3r+C645I2RLk+8Qfki9VL4o2soYW6nsIU6R23h8pW
	wyMXTIGEqL37Dg32KHGNw7DBqF3/2fZG3GwxaQnDgsLsueU2p6ojU4XnEXjNX94zmORbkydC579
	vUpNLudDwXnMMj8v4p0RT6vCq6Ru6ZKtgC8tgs468nj8TMz5hHo4QX4mvqYQlj9UZ+YSH+xUTfq
	oLXzheNbFTs7gp7wsY6ReQb3A==
X-Received: by 2002:a05:600c:1914:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499c3302280mr147710725e9.11.1787558195033;
        Mon, 24 Aug 2026 00:56:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm114555395e9.9.2026.08.24.00.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:56:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 08:56:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Lukas Wunner <lukas@wunner.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack
 frame
Message-ID: <20260824085632.2dd08ba9@pumpkin>
In-Reply-To: <20260824014703.56502-1-kmehltretter@gmail.com>
References: <20260824014703.56502-1-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005638_528149_7A11EF42 
X-CRM114-Status: GOOD (  29.82  )
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

On Mon, 24 Aug 2026 03:47:03 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> arm32 allmodconfig fails to build with gcc:
> 
>   drivers/mtd/chips/cfi_cmdset_0001.c:1883:1: error: the frame size of 1296
>   bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> With MTD_MAP_BANK_WIDTH_32 a map_word is 32 bytes, and with KASAN_STACK
> every temporary gets its own redzoned slot.  do_write_buffer() builds a
> map_word for each of the twelve commands it issues, and those temporaries
> dominate its frame.

Looks to me like pretty much all of mtd/map.h should be real functions
and not #defines or inlines.

The bloat from all those expansions is going to be significant.
They only time they get optimised to anything small is when only
CONFIG_MTD_MAP_BANK_WIDTH_1 is set.

The execution time of all those that do real io (especially reads)
will be dominated by the io access itself.

David

> 
> Issue the commands through a small noinline helper that takes the
> command as a plain value and builds the map_word in its own frame.  The
> sequence of reads and writes to the chip is unchanged.
> 
> The helper must not be inlined, and reusing one map_word local is not
> enough: clang cannot assume the callee does not observe the local, so it
> still returns each CMD() into a per-call-site temporary, and the frame
> grows (1760 -> 1824 bytes in cfi_intelext_writev(), into which clang
> inlines do_write_buffer()).
> 
> Frame sizes with MTD_MAP_BANK_WIDTH_32 and KASAN_STACK:
> 
>   gcc 15.2   do_write_buffer()      1296 -> 520
>   clang 21   cfi_intelext_writev()  1760 -> 896
> 
> The helper itself takes 168 (gcc) / 160 (clang) bytes.
> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/all/20260408211407.2295175-1-andriy.shevchenko@linux.intel.com/
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Link: https://lore.kernel.org/all/87ik9cfm6g.fsf@bootlin.com/
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 42 ++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index b73596a8e021..a7c77c4e76ae 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1716,12 +1716,24 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
>  }
>  
>  
> +/*
> + * Keep noinline: inlined, the map_word temporaries put do_write_buffer() over
> + * the frame-size limit with MTD_MAP_BANK_WIDTH_32 and KASAN_STACK.
> + */
> +static noinline void __xipram cfi_write_cmd(struct map_info *map,
> +					    unsigned long cmd, unsigned long adr)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +
> +	map_write(map, CMD(cmd), adr);
> +}
> +
>  static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  				    unsigned long adr, const struct kvec **pvec,
>  				    unsigned long *pvec_seek, int len)
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
> -	map_word status, write_cmd, datum;
> +	map_word status, datum;
>  	unsigned long cmd_adr;
>  	int ret, wbufsize, word_gap, words;
>  	const struct kvec *vec;
> @@ -1740,9 +1752,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	if (is_LH28F640BF(cfi))
>  		cmd_adr = adr;
>  
> -	/* Let's determine this according to the interleave only once */
> -	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
> -
>  	mutex_lock(&chip->mutex);
>  	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
>  	if (ret) {
> @@ -1759,7 +1768,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	   So we must check here and reset those bits if they're set. Otherwise
>  	   we're just pissing in the wind */
>  	if (chip->state != FL_STATUS) {
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  		chip->state = FL_STATUS;
>  	}
>  	status = map_read(map, cmd_adr);
> @@ -1767,21 +1776,22 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  		xip_enable(map, chip, cmd_adr);
>  		printk(KERN_WARNING "SR.4 or SR.5 bits set in buffer write (status %lx). Clearing.\n", status.x[0]);
>  		xip_disable(map, chip, cmd_adr);
> -		map_write(map, CMD(0x50), cmd_adr);
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x50, cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  	}
>  
>  	chip->state = FL_WRITING_TO_BUFFER;
> -	map_write(map, write_cmd, cmd_adr);
> +	cfi_write_cmd(map, (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? 0xe8 : 0xe9,
> +		      cmd_adr);
>  	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0, 0);
>  	if (ret) {
>  		/* Argh. Not ready for write to buffer */
>  		map_word Xstatus = map_read(map, cmd_adr);
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  		chip->state = FL_STATUS;
>  		status = map_read(map, cmd_adr);
> -		map_write(map, CMD(0x50), cmd_adr);
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x50, cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  		xip_enable(map, chip, cmd_adr);
>  		printk(KERN_ERR "%s: Chip not ready for buffer write. Xstatus = %lx, status = %lx\n",
>  				map->name, Xstatus.x[0], status.x[0]);
> @@ -1800,7 +1810,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	}
>  
>  	/* Write length of data to come */
> -	map_write(map, CMD(words), cmd_adr );
> +	cfi_write_cmd(map, words, cmd_adr);
>  
>  	/* Write data */
>  	vec = *pvec;
> @@ -1837,7 +1847,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	*pvec_seek = vec_seek;
>  
>  	/* GO GO GO */
> -	map_write(map, CMD(0xd0), cmd_adr);
> +	cfi_write_cmd(map, 0xd0, cmd_adr);
>  	chip->state = FL_WRITING;
>  
>  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
> @@ -1845,7 +1855,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  				   chip->buffer_write_time,
>  				   chip->buffer_write_time_max);
>  	if (ret) {
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  		chip->state = FL_STATUS;
>  		xip_enable(map, chip, cmd_adr);
>  		printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
> @@ -1858,8 +1868,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  		unsigned long chipstatus = MERGESTATUS(status);
>  
>  		/* reset status */
> -		map_write(map, CMD(0x50), cmd_adr);
> -		map_write(map, CMD(0x70), cmd_adr);
> +		cfi_write_cmd(map, 0x50, cmd_adr);
> +		cfi_write_cmd(map, 0x70, cmd_adr);
>  		xip_enable(map, chip, cmd_adr);
>  
>  		if (chipstatus & 0x02) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
