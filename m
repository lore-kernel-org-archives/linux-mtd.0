Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D67C369A8
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F31YVA9a0ddqoZ0iStSJym9reSVoEpNzUGuKdftzP6M=; b=NjXEAWB+mW7+ze
	tuV5SGmcASvJauBKT+bEaIHk/Q1wJ3pkRvAmiHX531PhQSoBho7yHmvNkjFDTdsYda0/GC742i+1q
	QvC3GnKr0zJktzVEDHhj4Phx3XGL+8d9rqLzZ8ZXuwmXNIGGiNdaQ+cWFJjuAj4wXoqFjQ50hmXbi
	kauvEdBltHPjyTBj1XtcpDrlwEzzy4vkFtxEb4rWrLCswrHCGAtZODV2D55dnB7PRZi7rgv4R7x48
	4Zuia/MhygoLLrw+/ElNIC7OuVsFMo0Eb70lgdYGKsBT2sXRCZ2ciJfAh+Du5D9toBI9bM5CJ9QZS
	7adCjeIGlsxRgfNpRlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yyu-000000080UY-1U3p;
	Wed, 09 Apr 2025 17:12:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yli-00000007y21-2TBy;
	Wed, 09 Apr 2025 16:59:19 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-af5085f7861so4509520a12.3;
        Wed, 09 Apr 2025 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744217957; x=1744822757; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UF0piylxy01Y9o78lp9CSclPliCcrf/Gy/Xprs9X0Fc=;
        b=EdgJe2EKZ88jaUcjULXHM7Plkl+dvTLfy3c1wOMPbo/7pXzqCdW8YaNoFoRXjgxY9J
         M8YfcjJ6Yedj34B3EeHw9m8fTMVlG9oynZRJ18DAYll7WnxQgPrCOqKEpKZKvAHt8tK5
         2nG1uk7zEr/hBmw3pSfxKGMRm6mO4iatIdLaMO74SrGSEhVMq71FU5fFT29sBlb7WPTt
         3GtQi/xVTqrY3F5I628ubBRXpS0vSuZ7ylBXQ9Hzmi/5TBrW+fZGrHnYdP3dDgURgBSE
         XgFrAO8k+hPOCISen8Fc9StSiDtMVDRWZoD+9NEJ/NtH6+DMuhEYO7OudGptqgi+v/Rv
         +aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217957; x=1744822757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF0piylxy01Y9o78lp9CSclPliCcrf/Gy/Xprs9X0Fc=;
        b=KuvQv7ZqUNY5HGdBoMGtLGBBmSBlYdQMcg3Qkdm4QeesxosSM3XKY0mtCP/Mvetkf3
         DhQHI4ViyR+FWFY5efutm0aYelvgbuzvrjCN8BaSkMFmCgPvvTnB1v/23+e5wpUhPEoO
         4GsX5P7mI2KXMYVJVCN6mzM9c3u2aVa0n8klRvKEpphSr+IsJG7wePQnZt7StSloJFpb
         ADDSJP62ep7XiasQhuTystQ/saH51zHF9BbNqKjyML+GkLIwgPcfmpKl5/OQeBaRUfV3
         +hW1XHQwtlNlgVtv/vigSbtBLB7ImiyeukTphDuOa6sMDMWrhoFOzSR7/hyuZrLNx20d
         JJyA==
X-Forwarded-Encrypted: i=1; AJvYcCVOVAk0/dcxW1G6Qwx4KpFzOpRPq6OA+aFZLDphe1Gz7E0CtvXYUT0DBQ9fbEfCNNJAdkteVPJAXBin@lists.infradead.org, AJvYcCWpxr2IRyVRhLM9lI5H4cQ9ZG+WZqB3dX+LhOhllNWAS/GfMMg2BqakULc2hWilMa7Dey476ouD8Cc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCjdzpJPZP0tccHzqXgLmA+uuCzgXUL6JEUoG/fEncSVVkz6to
	LGNmktJRxc8Jpciz0EmVd0r6OXVBM8RVulSW6a0melwA8xoGITtU
X-Gm-Gg: ASbGnctynkvdzVAsKY9+V4vNHAKPVrABrHExdKXDhI7x8zD//yKXokfjYTPTxL0sHtd
	cq7RcQYPry6ezHPD/zy/ePIT2Pb2w8d0Uh1IGOStvypFppdChi1AZzCgsZ4N53TPh8Z5LeuYyn4
	vFuOpD+x5IUNRrwtBtm0UkW13XA+PXzJJA68QnWZ3xrbOwpW6VuqDWYvqtQIohqRW2pQKC4M0Sr
	5TPtIk277CgZvQjCjchh/bdFMsejHDvjldPzZZIIajT9R6X6qWtLY/e41E2yxXIHMuCTdSurJB1
	nzv+LauMfYTwhl6YU/NtQlmi4LecQhWYEWbTgchZ
X-Google-Smtp-Source: AGHT+IE+ebVDkjWM2U+vTuxOaEi2gePK7lA6ZcliczZ6QreHuVJL0X/7gkTIx9gAEQ4c3jyrVxUT+Q==
X-Received: by 2002:a05:6a21:9211:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-2015aeca12bmr4752416637.17.1744217957454;
        Wed, 09 Apr 2025 09:59:17 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d298esm1284868a12.34.2025.04.09.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:59:16 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:59:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
Message-ID: <Z_anYpZw_E8ehN21@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-2-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_095918_633411_C1F977D3 
X-CRM114-Status: GOOD (  27.81  )
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

On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> Redesign the parity8() helper as parity_odd(), changing its input type
> from u8 to u64 to support broader use cases and its return type from
> int to bool to clearly reflect the function's binary output. The
> function now returns true for odd parity and false for even parity,
> making its behavior more intuitive based on the name.
> 
> Also mark the function with __attribute_const__ to enable better
> compiler optimization, as the result depends solely on its input and
> has no side effects.
> 
> While more efficient implementations may exist, further optimization is
> postponed until a use case in performance-critical paths arises.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  arch/x86/kernel/bootflag.c               |  4 ++--
>  drivers/hwmon/spd5118.c                  |  2 +-
>  drivers/i3c/master/dw-i3c-master.c       |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c     |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
>  include/linux/bitops.h                   | 19 ++++++++++++-------
>  6 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 73274d76ce16..86aae4b2bfd5 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
>  	unsigned long flags;
>  
>  	if (sbf_port != -1) {
> -		if (!parity8(v))
> +		if (!parity_odd(v))
>  			v ^= SBF_PARITY;
>  
>  		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> @@ -57,7 +57,7 @@ static bool __init sbf_value_valid(u8 v)
>  {
>  	if (v & SBF_RESERVED)		/* Reserved bits */
>  		return false;
> -	if (!parity8(v))
> +	if (!parity_odd(v))
>  		return false;
>  
>  	return true;
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 358152868d96..15761f2ca4e9 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -298,7 +298,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   */
>  static bool spd5118_vendor_valid(u8 bank, u8 id)
>  {
> -	if (parity8(bank) == 0 || parity8(id) == 0)
> +	if (!parity_odd(bank) || !parity_odd(id))
>  		return false;
>  
>  	id &= 0x7f;
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c15..dc61d87fcd94 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -867,7 +867,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		master->devs[pos].addr = ret;
>  		last_addr = ret;
>  
> -		ret |= parity8(ret) ? 0 : BIT(7);
> +		ret |= parity_odd(ret) ? 0 : BIT(7);
>  
>  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
>  		       master->regs +
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index fd3752cea654..df14f978a388 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -889,7 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
>  	ret |= (addr & GENMASK(9, 7)) << 6;
>  
>  	/* RR0[0] = ~XOR(addr[6:0]) */
> -	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
> +	ret |= parity_odd(addr & 0x7f) ? 0 : BIT(0);
>  
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 85c4916972e4..d692a299607d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -114,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
>  	dat_w0 = dat_w0_read(dat_idx);
>  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
>  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> -		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
> +		  (parity_odd(address) ? 0 : DAT_0_DYNADDR_PARITY);
>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..7c4c8afccef1 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -230,35 +230,40 @@ static inline int get_count_order_long(unsigned long l)
>  }
>  
>  /**
> - * parity8 - get the parity of an u8 value
> - * @value: the value to be examined
> + * parity_odd - get the parity of an u64 value
> + * @val: the value to be examined
>   *
> - * Determine the parity of the u8 argument.
> + * Determine the parity of the u64 argument.
>   *
>   * Returns:
> - * 0 for even parity, 1 for odd parity
> + * false for even parity, true for odd parity
>   *
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity_odd(val))
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (!parity_odd(val))
>   *		val ^= BIT(7);
>   */
> -static inline int parity8(u8 val)
> +#ifndef parity_odd

Please don't add this guard. We've got no any arch implementations
so far, and this is a dead code. Those adding arch code will also
add the ifdefery.

> +static inline __attribute_const__ bool parity_odd(u64 val)
>  {
>  	/*
>  	 * One explanation of this algorithm:
>  	 * https://funloop.org/codex/problem/parity/README.html
>  	 */
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
>  	val ^= val >> 4;
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
> +#endif
>  
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
> -- 
> 2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
