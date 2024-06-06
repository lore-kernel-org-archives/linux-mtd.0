Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A4C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/i9TP3+fUNy3sIZPr7BQdX6Ephk0EruCxwm97QQSXk=; b=tM0JeAyL4ULkXZ
	0m6GzlQhRaUBSJbs01OO+66eRPd7TwWTHgr0Dp+Wkz50TwZC8HTnZySKtpXwNWu1HL9ibENZk24YG
	Kls9wPTuBahBkP2ukKxvNQZ0Slfxzzw89jWceAsn8L1HNZzzvildyD6t127V70l9YVqU0E0d8TvOf
	1aX88nRF3l58ZEENtrP4VZEWwsZjNQclP5QQch0bXaKWz/7PIL6TA0q8AVI0f8irW8k5JUIJ0EBPM
	FytCinAfwxu4oevjc5PUlTirK+43xdNiJdQ9gjp8+qX45lZ3258TmE1zZUGAbdE62jFvAEmBCFEkV
	ZpmkppXMmVAoq/SyJV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8h3-00000008szI-1WRf;
	Thu, 06 Jun 2024 08:41:57 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8gz-00000008swP-0G3R
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 08:41:55 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e724bc466fso8446091fa.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663311; x=1718268111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lboqGDLkSlZiXGaj/uzeRuz104hFq0ngZ+Ud/fj/+Ag=;
        b=VWAvD2q90H40Xu7vnSnkGRP2nMztNDARn8+LgZ3dfpRLzM7jCdJgadimN5EGo6NTpU
         WjmVEsfqd4xLM57BRRnlfB0oZlVlPmJyVFnH/mEmaY3Wc4rl0eyILvtpE4bnOq5NQVpb
         Q4Zjvn3sPAwTo4v6IVcNxwyIWRLRT+jyv5TRkGvyXLibxXPllmTwAAqGh6pp7JaTT+cm
         BZyAdcVD3+aRlVU+QswVKSYOa4hYHkWlzcVTIJiEd0mQbvymhjPV8ypRSrfbKrUKTvnK
         kJG7+xscl7iA6iIVY3t18p0L9gZitQZlmfwnI/h4QucV/LlbFBfpO025fjSjjA8dJYYM
         c/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663311; x=1718268111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lboqGDLkSlZiXGaj/uzeRuz104hFq0ngZ+Ud/fj/+Ag=;
        b=QOs2S7WImspvvDe0QWtI/oZbs7ckYyK89QHsPabS0SD4qAXt7W2U9CR3krgVqUezLY
         /nn/8E2lmIR4gD4NJL1ATIMCnpvz9lc2dMYbx2gMJsYcZ4QB6nM6U8wOUJzO9et0Vjp+
         RdGyymicSUWZETJGQs0a3GQJ3TcRvGDhx+7friGQuMMhHd+06Kj4OMYORHZHmJ9bFJ41
         4FvJgQbX2dLmp97G+je3xPZswQteugCfOVkJ4CxTOGF2IUd9whN3lyzfYPb5jjIKGGc1
         KJQiXCkzhKQoQA9QEI9OF5gAlfGanbtEnAKTidhrhPqk0g/p596o1+xGbYJ2Xth0fz/+
         Lq9A==
X-Forwarded-Encrypted: i=1; AJvYcCWtAzm7UlATi0dKQ/A/UTXecNP4uD8zSfHRQ4WknO7WPYh0nZyvcUpW51FLLIM137hGSxh8uimBCbYiGHup9eTlUTQPcnsOXSjyhzUu/w==
X-Gm-Message-State: AOJu0YyRBgXrN68Skb9Fzz8+EDxyp1qLidefUbYCPPMPiVVjA0uZdxDY
	8gGpk4N9226umWjPCj9pwC1qpLuNgyBSRcXDrcAzYZ9h3MC/4g7uqtAhbHikRSU=
X-Google-Smtp-Source: AGHT+IEzdn9+piYZ1x5EsTOIWqi/J/85mLEB4Nr/4e4HHjN18eVZC+5BHKwFvsEHZndySpOVd4em4g==
X-Received: by 2002:a2e:8550:0:b0:2e6:d1fb:4470 with SMTP id 38308e7fff4ca-2eac7a832dbmr34173771fa.42.1717663310478;
        Thu, 06 Jun 2024 01:41:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d8ddsm715207a12.1.2024.06.06.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:41:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:41:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
Message-ID: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-8-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014153_133389_79D99F29 
X-CRM114-Status: GOOD (  20.21  )
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

On Wed, Jun 05, 2024 at 05:59:51PM +0000, Joy Chakraborty wrote:
> @@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(sernum);
>  
> -static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
> +static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  {
>  	struct at25_data *at25 = priv;
>  	size_t maxsz = spi_max_transfer_size(at25->spi);
> +	size_t bytes_written = count;
>  	const char *buf = val;
>  	int			status = 0;
>  	unsigned		buf_size;
> @@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
>  	mutex_unlock(&at25->lock);
>  
>  	kfree(bounce);
> -	return status;
> +	return status < 0 ? status : bytes_written;
>  }

So the original bug was that rmem_read() is returning positive values
on success instead of zero[1].  That started a discussion about partial
reads which resulted in changing the API to support partial reads[2].
That patchset broke the build.  This patchset is trying to fix the
build breakage.

[1] https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/
[2] https://lore.kernel.org/all/20240510082929.3792559-2-joychakr@google.com/

The bug in rmem_read() is still not fixed.  That needs to be fixed as
a stand alone patch.  We can discuss re-writing the API separately.

These functions are used internally and exported to the user through
sysfs via bin_attr_nvmem_read/write().  For internal users partial reads
should be treated as failure.  What are we supposed to do with a partial
read?  I don't think anyone has asked for partial reads to be supported
from sysfs either except Greg was wondering about it while reading the
code.

Currently, a lot of drivers return -EINVAL for partial read/writes but
some return success.  It is a bit messy.  But this patchset doesn't
really improve anything.  In at24_read() we check if it's going to be a
partial read and return -EINVAL.  Below we report a partial read as a
full read.  It's just a more complicated way of doing exactly what we
were doing before.

drivers/misc/eeprom/at25.c
   198  static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
   199  {
   200          struct at25_data *at25 = priv;
   201          size_t maxsz = spi_max_transfer_size(at25->spi);
New:            size_t bytes_written = count;
                       ^^^^^^^^^^^^^^^^^^^^^
This is not the number of bytes written.

   202          const char *buf = val;
   203          int                     status = 0;
   204          unsigned                buf_size;
   205          u8                      *bounce;
   206  
   207          if (unlikely(off >= at25->chip.byte_len))
   208                  return -EFBIG;
   209          if ((off + count) > at25->chip.byte_len)
   210                  count = at25->chip.byte_len - off;
                        ^^^^^
This is.

   211          if (unlikely(!count))
   212                  return -EINVAL;
   213  
   214          /* Temp buffer starts with command and address */
   215          buf_size = at25->chip.page_size;
   216          if (buf_size > io_limit)
   217                  buf_size = io_limit;
   218          bounce = kmalloc(buf_size + at25->addrlen + 1, GFP_KERNEL);
   219          if (!bounce)
   220                  return -ENOMEM;
   221  

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
