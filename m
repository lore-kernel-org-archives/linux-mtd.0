Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B882C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gor5EVPC7SqBCxaynithQn9QrOp01ReRhJv6fjD3XY=; b=QTrS3/6t4fG4yj
	kMvYBP2i0HhjfhdMOJ3ke6shFTig8D5EwrFP/9C+uwXXbpX+F/D6ZLbFvphmFmFVuH/CrjDDUqQ4u
	o5/cZxk9Pi7UnYgG6TyusxQIqhaO8dpQfWfUqFAR7vkpNV5c+MxV0jISoiUbwlBrsfYp0xkM9np+U
	uajnXUuLFdkuWHdRSAKL8vCi2bIWkUzUXMjb71O67wkIfKS2CEkNNY1swHPZ9krQMjShbzOY08RDE
	jmrTbtYUNFmByItcEzuZ8bfS2a5+A5PITsLzhIkGJMNugGeSuZehssPba8SIQqJjrAY+EQjT7D+8u
	7CUfnRlv16fvSlpO+EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd37W-0017bF-2O;
	Fri, 17 Mar 2023 05:59:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd37T-0017a0-0Q
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 05:59:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id o12so16201400edb.9
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679032750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6/4eWWDbTpYIygjY2AgKVFhfdIBjRTyGATiv8KCpYo=;
        b=MVGlFCIchcwjrGHoAKlGxJ7r0by505zXyGOwDBNPKk03OxamhRYi/QsmYspvhhcLJu
         5pQdWmE2yraTxwwdjoNBXMdGHYbjYPo+PdbpurxPfptVR4gwmSup+KWvNQZ9ljPhivPU
         MuUlqsH+5DEruFTFe89D8DnhoUyF0U2DWPu0tGjpOid+Cfk1mMN5FzGjFDnv6t/zR+xF
         TIyLP7dJSTb4FAzmVRdwUsmeHhCX4iN1jcmxcrxV67ABsW5ouZY02wTWrAnxMAdRe5+B
         1XZxIBRK9p0mZQopbgzZDvsS/BmGSPmdcFx9o25hGM1MpepzNYn4jLlzMo2U39ctH21Y
         7Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679032750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6/4eWWDbTpYIygjY2AgKVFhfdIBjRTyGATiv8KCpYo=;
        b=uCCjRXyA1s5JzYdhDgk51Jy4cutwFe6ZBgia6zVeMvISyOjjGHTrnWcY9D3pR++6it
         c6z94LuLRN3hsi347VWHP54kEu0b5HXv4bOgC02J7V/3K0G7UalfOG+Xj4n/pPyXh4OG
         RnnUup+8Z4kb9RSw/in4Y0SwpJyGa2/VsrRPlweGKkMXBjk0jZEYqK0zBCYRYlHsv8ta
         TsEjbEGhQXkNjqcE4s6uLTyeCYQbxwp9tH/6kd7Qpf2U1b3AlHhWqG7xVxde/zhGGvXt
         vFA/16PFk/PavY0L7cEbIkxQl/OHL42dRAUG3RVkZb0Mnu492geQJSa3pAvxzu4/+vsB
         kSwQ==
X-Gm-Message-State: AO0yUKUxQqOL8b0KFQAoqkS/zoQYT5Olub/YjyYjdIZkG/CwNJH9o5jJ
	yLnknrKYjnVjVJPBgkBAt/ezzg==
X-Google-Smtp-Source: AK7set8W9NY8O7RVy7U8n2xGnfHjvXLKr90o6gUwrE7HKUU8/GORKOQJnYT9BW+b/e4GX/mQKWZLsw==
X-Received: by 2002:a17:906:8609:b0:8b2:8876:2a11 with SMTP id o9-20020a170906860900b008b288762a11mr11493419ejx.28.1679032750464;
        Thu, 16 Mar 2023 22:59:10 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906199600b008b1797b77b2sm514100ejd.221.2023.03.16.22.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 22:59:10 -0700 (PDT)
Message-ID: <c76eb1cf-3555-d042-a18f-93f240e1cd64@linaro.org>
Date: Fri, 17 Mar 2023 05:59:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 7/8] mtd: spi-nor: Enhance locking to support reads
 while writes
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-8-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201113603.293758-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_225915_170548_6FE7C87C 
X-CRM114-Status: GOOD (  49.80  )
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

Hi, Miquel,

I find the overall idea good.

On 2/1/23 11:36, Miquel Raynal wrote:
> On devices featuring several banks, the Read While Write (RWW) feature
> is here to improve the overall performance when performing parallel
> reads and writes at different locations (different banks). The following
> constraints have to be taken into account:
> 1#: A single operation can be performed in a given bank.
> 2#: Only a single program or erase operation can happen on the entire
>     chip (common hardware limitation to limit costs)
> 3#: Reads must remain serialized even though reads on different banks
>     might occur at the same time.

3# is unclear if one limits just at reading the commit message. Are the
reads serialized per bank or per flash?

After reading the code, it looks like all the reads are serialized per
flash regardless if it reads registers or memory. I assume you meant
that crossing a bank boundary with a single read is fine. But can you
really read from bank 1 and bank 3 at the same time? The code doesn't
take this into consideration.

> 4#: The I/O bus is unique and thus is the most constrained resource, all
>     spi-nor operations requiring access to the spi bus (through the spi
>     controller) must be serialized until the bus exchanges are over. So
>     we must ensure a single operation can be "sent" at a time.
> 5#: Any other operation that would not be either a read or a write or an
>     erase is considered requiring access to the full chip and cannot be
>     parallelized, we then need to ensure the full chip is in the idle
>     state when this occurs.
> 
> All these constraints can easily be managed with a proper locking model:
> 1#: Is enforced by a bitfield of the in-use banks, so that only a single
>     operation can happen in a specific bank at any time.
> 2#: Is handled by the ongoing_pe boolean which is set before any write
>     or erase, and is released only at the very end of the
>     operation. This way, no other destructive operation on the chip can
>     start during this time frame.
> 3#: An ongoing_rd boolean allows to track the ongoing reads, so that
>     only one can be performed at a time.
> 4#: An ongoing_io boolean is introduced in order to capture and serialize
>     bus accessed. This is the one being released "sooner" than before,
>     because we only need to protect the chip against other SPI accesses
>     during the I/O phase, which for the destructive operations is the
>     beginning of the operation (when we send the command cycles and
>     possibly the data), while the second part of the operation (the
>     erase delay or the programmation delay) is when we can do something
>     else in another bank.
> 5#: Is handled by the three booleans presented above, if any of them is
>     set, the chip is not yet ready for the operation and must wait.
> 
> All these internal variables are protected by the existing lock, so that
> changes in this structure are atomic. The serialization is handled with
> a wait queue.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 319 ++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h |  13 ++
>  2 files changed, 317 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ac4627e0d6c2..ad2436e3688f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -589,6 +589,66 @@ int spi_nor_sr_ready(struct spi_nor *nor)
>  	return !(nor->bouncebuf[0] & SR_WIP);
>  }
>  
> +/**
> + * spi_nor_parallel_locking() - Checks if the RWW locking scheme shall be used
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: true if parallel locking is enabled, false otherwise.
> + */
> +static bool spi_nor_parallel_locking(struct spi_nor *nor)
> +{
> +	if (nor->controller_ops &&
> +	    (nor->controller_ops->prepare || nor->controller_ops->unprepare))
> +		return false;

We won't allow controller drivers in spi-nor/controllers to benefit of
this feature, just do:
	if (nor->controller_ops)
		return false;
> +
> +	return nor->info->n_banks > 1 && nor->info->no_sfdp_flags & SPI_NOR_RWW;

we don't play with flash info flags throughout the core. Introduce a
SNOR_F equivalent flag, see how they're used. You'll be able to get rid
of the n_banks check as well.

> +}
> +
> +/* Locking helpers for status read operations */
> +static int spi_nor_rww_start_rdst(struct spi_nor *nor)
> +{
> +	int ret = -EAGAIN;

you can have a pointer to rww here, you'll avoid all those dereferences
from nor. I would add such a pointer wherever there is more than one
dereference, so the comment is for the entire patch.
> +
> +	mutex_lock(&nor->lock);
> +
> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd)
> +		goto busy;
> +
> +	nor->rww.ongoing_io = true;
> +	nor->rww.ongoing_rd = true;
> +	ret = 0;
> +
> +busy:
> +	mutex_unlock(&nor->lock);
> +	return ret;
> +}
> +
> +static void spi_nor_rww_end_rdst(struct spi_nor *nor)
> +{
> +	mutex_lock(&nor->lock);
> +
> +	nor->rww.ongoing_io = false;
> +	nor->rww.ongoing_rd = false;
> +
> +	mutex_unlock(&nor->lock);
> +}
> +
> +static int spi_nor_lock_rdst(struct spi_nor *nor)
> +{
> +	if (spi_nor_parallel_locking(nor))
> +		return spi_nor_rww_start_rdst(nor);
> +
> +	return 0;
> +}
> +
> +static void spi_nor_unlock_rdst(struct spi_nor *nor)
> +{
> +	if (spi_nor_parallel_locking(nor)) {
> +		spi_nor_rww_end_rdst(nor);
> +		wake_up(&nor->rww.wait);
> +	}
> +}
> +
>  /**
>   * spi_nor_ready() - Query the flash to see if it is ready for new commands.
>   * @nor:	pointer to 'struct spi_nor'.
> @@ -597,11 +657,21 @@ int spi_nor_sr_ready(struct spi_nor *nor)
>   */
>  static int spi_nor_ready(struct spi_nor *nor)
>  {
> +	int ret;
> +
> +	ret = spi_nor_lock_rdst(nor);
> +	if (ret)
> +		return 0;
> +
>  	/* Flashes might override the standard routine. */
>  	if (nor->params->ready)
> -		return nor->params->ready(nor);
> +		ret = nor->params->ready(nor);
> +	else
> +		ret = spi_nor_sr_ready(nor);
>  
> -	return spi_nor_sr_ready(nor);
> +	spi_nor_unlock_rdst(nor);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -1087,7 +1157,81 @@ static void spi_nor_unprep(struct spi_nor *nor)
>  		nor->controller_ops->unprepare(nor);
>  }
>  
> +static void spi_nor_offset_to_banks(struct spi_nor *nor, loff_t start, size_t len,

pass directly the bank_size instead of the pointer to nor, you'll avoid
the double dereference.

> +				    unsigned int *first, unsigned int *last)

unsigned long long *first, *last ?

> +{
> +	*first = DIV_ROUND_DOWN_ULL(start, nor->params->bank_size);
> +	*last = DIV_ROUND_DOWN_ULL(start + len - 1, nor->params->bank_size);
> +}
> +
>  /* Generic helpers for internal locking and serialization */
> +static bool spi_nor_rww_start_io(struct spi_nor *nor)
> +{
> +	bool start = false;
> +
> +	mutex_lock(&nor->lock);
> +
> +	if (nor->rww.ongoing_io)
> +		goto busy;
> +
> +	nor->rww.ongoing_io = true;
> +	start = true;
> +
> +busy:
> +	mutex_unlock(&nor->lock);
> +	return start;
> +}
> +
> +static void spi_nor_rww_end_io(struct spi_nor *nor)
> +{
> +	mutex_lock(&nor->lock);
> +	nor->rww.ongoing_io = false;
> +	mutex_unlock(&nor->lock);
> +}
> +
> +static int spi_nor_lock_device(struct spi_nor *nor)
> +{
> +	if (!spi_nor_parallel_locking(nor))
> +		return 0;
> +
> +	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
> +}
> +
> +static void spi_nor_unlock_device(struct spi_nor *nor)
> +{
> +	if (spi_nor_parallel_locking(nor))
> +		spi_nor_rww_end_io(nor);

shall we wake_up here too?

> +}
> +
> +/* Generic helpers for internal locking and serialization */
> +static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
> +{
> +	bool start = false;
> +
> +	mutex_lock(&nor->lock);
> +
> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd || nor->rww.ongoing_pe)
> +		goto busy;
> +
> +	nor->rww.ongoing_io = true;
> +	nor->rww.ongoing_rd = true;
> +	nor->rww.ongoing_pe = true;
> +	start = true;
> +
> +busy:
> +	mutex_unlock(&nor->lock);
> +	return start;
> +}
> +
> +static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
> +{
> +	mutex_lock(&nor->lock);
> +	nor->rww.ongoing_io = false;
> +	nor->rww.ongoing_rd = false;
> +	nor->rww.ongoing_pe = false;
> +	mutex_unlock(&nor->lock);
> +}
> +
>  int spi_nor_prep_and_lock(struct spi_nor *nor)
>  {
>  	int ret;
> @@ -1096,19 +1240,71 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&nor->lock);
> +	if (!spi_nor_parallel_locking(nor))
> +		mutex_lock(&nor->lock);
> +	else
> +		ret = wait_event_killable(nor->rww.wait,
> +					  spi_nor_rww_start_exclusive(nor));
>

No, don't touch spi_nor_prep_and_lock() and spi_nor_unlock_and_unprep(),
you're giving the impresion that users of it (OTP, SWP) are safe to use
them while reads or PE are in progress, which is not the case, because
you don't guard the ops that they're using. You'll also have to document
the flash info RWW flag ands say it is mutual exclusive with SWP and OTP
features.

> -	return 0;
> +	return ret;
>  }
>  
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor)
>  {
> -	mutex_unlock(&nor->lock);
> +	if (!spi_nor_parallel_locking(nor)) {
> +		mutex_unlock(&nor->lock);
> +	} else {
> +		spi_nor_rww_end_exclusive(nor);
> +		wake_up(&nor->rww.wait);
> +	}
>  
>  	spi_nor_unprep(nor);
>  }
>  
>  /* Internal locking helpers for program and erase operations */
> +static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
> +{
> +	unsigned int first, last;
> +	bool started = false;
> +	int bank;
> +
> +	mutex_lock(&nor->lock);
> +
> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd || nor->rww.ongoing_pe)
> +		goto busy;
> +
> +	spi_nor_offset_to_banks(nor, start, len, &first, &last);
> +	for (bank = first; bank <= last; bank++)
> +		if (nor->rww.used_banks & BIT(bank))
> +			goto busy;
> +
> +	for (bank = first; bank <= last; bank++)
you can avoid this second look by introducing a local used_banks
variable and have the mask set in the previous loop. Then you'll just do
an init at this point.

> +		nor->rww.used_banks |= BIT(bank);
> +
> +	nor->rww.ongoing_pe = true;
> +	started = true;
> +
> +busy:
> +	mutex_unlock(&nor->lock);
> +	return started;
> +}
> +
> +static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
> +{
> +	unsigned int first, last;
> +	int bank;
> +
> +	mutex_lock(&nor->lock);
> +
> +	spi_nor_offset_to_banks(nor, start, len, &first, &last);
> +	for (bank = first; bank <= last; bank++)
> +		nor->rww.used_banks &= ~BIT(bank);
> +
> +	nor->rww.ongoing_pe = false;
> +
> +	mutex_unlock(&nor->lock);
> +}
> +
>  static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
>  {
>  	int ret;
> @@ -1117,19 +1313,73 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&nor->lock);
> +	if (!spi_nor_parallel_locking(nor))
> +		mutex_lock(&nor->lock);
> +	else
> +		ret = wait_event_killable(nor->rww.wait,
> +					  spi_nor_rww_start_pe(nor, start, len));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
>  {
> -	mutex_unlock(&nor->lock);
> +	if (!spi_nor_parallel_locking(nor)) {
> +		mutex_unlock(&nor->lock);
> +	} else {
> +		spi_nor_rww_end_pe(nor, start, len);
> +		wake_up(&nor->rww.wait);
> +	}
>  
>  	spi_nor_unprep(nor);
>  }
>  
>  /* Internal locking helpers for read operations */
> +static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
> +{
> +	unsigned int first, last;
> +	bool started = false;
> +	int bank;
> +
> +	mutex_lock(&nor->lock);
> +
> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd)
> +		goto busy;
> +
> +	spi_nor_offset_to_banks(nor, start, len, &first, &last);
> +	for (bank = first; bank <= last; bank++)
> +		if (nor->rww.used_banks & BIT(bank))
> +			goto busy;
> +
> +	for (bank = first; bank <= last; bank++)

mask to avoid 2nd loop

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
