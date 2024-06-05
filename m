Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E1C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkgbgmvKFMw1o15nHRsjUjY+qFf4KdCeCXjMdn4tDk8=; b=v7UPIeMV8C9ksK
	z4Kic6N2xMINy1oDcECa327KvsSgmqFJXYG6E8wlnawAq3XkESSqI0FsrYDydGZmQiUH7fpXSYRhW
	7LGikh+GVZpcWKdx4qsqbD6gAVW1Nhkq2HDgUjx1lo3YsGehLHVSvwljwxKIlnj+RHY/GqL/YDRbt
	QLESzBaUEZBmwGm9FgAv5YdpkJ6JGe211n6dCJSR2zDVX5zLpOy7lqG2pKw21TK027hWX69wSnaHm
	Z3WreoMOO6XMC7I5x5i08MFtdSCYAc6YdEFY9FypWXKfGfwwmgfSUxXUJz5F3wKVYG7z35iQAJYen
	RPjpAMcD95nMs2Fy5wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEy1Z-00000007a4r-21w0;
	Wed, 05 Jun 2024 21:18:25 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEy1V-00000007a4L-2JNG;
	Wed, 05 Jun 2024 21:18:23 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-681953ad4f2so188677a12.2;
        Wed, 05 Jun 2024 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717622297; x=1718227097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0TC939jtnzolf29JXwiWps/F6ODviUjUE8F+jRVq7Bg=;
        b=AO3JwLPiOrahP+1j6eYwzfqNVwwM2ydyIr/+0huzf6vX+irn4o8ZJtUuyq83z3lahM
         CyaMd7NfmW9O6plCDPm9/rxa+Rk55O7mGSMLPSSr/ydvVCpL7oeRbvriPpBWF6XVMa5u
         FGAQDc48/KfIpSc/BdtIZLqZVgB5445Sd4pJ09h9tm6CVJ+PuRpmtf0NO5ieoIUXrmlk
         Ob8f0pvsbXHsCnkaDxSAyZv0pXUbqkWV6Rxq7tFkncwsoUZp8DL6QDvkFLQaqhsNwJzN
         6v5rGvSoh0YBRbUgTW1qcePWIZTpSf4/ZY0F17YOBSh0MqDEx+d0/VyNId4TRW50b9A8
         aqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717622297; x=1718227097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TC939jtnzolf29JXwiWps/F6ODviUjUE8F+jRVq7Bg=;
        b=uxggb+DDl2scQvwjGZnvwspz0ImEe5s9bM1RnJm+Pq6RGtPUYelTvATZ0/+/v9HEeX
         pOeqKXk4l/PSGB6RbcsHf61Eo0Z1Wg9L5JplSCvhWVPE4bFaOZxjyecYTFIh0XyDykY/
         qihxbsAJiedWkP+Vbq946hg7H/pBt4BcuSATJ6Aj4BQcgorhYEASAKhUYRFDewuM1UOm
         zo2vQPUk+h650JAUKZrUwuxjSvxWln5qSiK7Qha8IUR2Fgb/Qky2timUvM0byfU8nqsc
         Hl5gmi+z042UQoLu8mgtAqXiBXwQQZa2t5AK1k6otMxLzT6C2FhGEkec2mnCblpwThQD
         GCxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPlxl0VwQqx0iQBOUpmGu84Q6T9Ld4UM+mjKe62CyqLxCTFYmIZnmjhikwEPnLvgtIvFNjiIJ7AkfLex0Je1pi3JgHWwdwJ9iHOGsshsxIEFXgBbvIMtHSYqmniTkXD+DwCxEjRK6pZ47mEA+81KT/dk/GcGAh8CYhgXY/JIoutbLKhY3eXy9zbep62uh2UjLvtZw8V+8=
X-Gm-Message-State: AOJu0YxnE5fKlwnyFPzyDdlBXtC4//Id4RH/k9J77+IAupqxXR2L9Lrf
	VZ/snD67BiHxBV3di53N/euaLgeZy0Xbh8QN2m1kO6qk5fy8pmaE
X-Google-Smtp-Source: AGHT+IH6mpaSlgZbj9wjlN2+g8jBX7TUrx4Tkes9rmgCSfmSHpu1TLrHJW7JJ/KoS4CQMuRhy5Masw==
X-Received: by 2002:a17:90b:128e:b0:2c2:8d2c:8292 with SMTP id 98e67ed59e1d1-2c28d2c8317mr2042051a91.48.1717622296577;
        Wed, 05 Jun 2024 14:18:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066d59fsm1922215a91.24.2024.06.05.14.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 14:18:15 -0700 (PDT)
Message-ID: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
Date: Wed, 5 Jun 2024 14:18:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return
 type
To: Joy Chakraborty <joychakr@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-6-joychakr@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240605175953.2613260-6-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_141821_624213_02C8EB6D 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/5/24 10:59, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>   drivers/misc/ds1682.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> index 5f8dcd0e3848..953341666ddb 100644
> --- a/drivers/misc/ds1682.c
> +++ b/drivers/misc/ds1682.c
> @@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_attr = {
>   	.write = ds1682_eeprom_write,
>   };
>   
> -static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
> -			     size_t bytes)
> +static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
> +				 size_t bytes)
>   {
>   	struct i2c_client *client = priv;
> -	int ret;
>   
> -	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
> +	return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
>   					    bytes, val);
> -	return ret < 0 ? ret : 0;
>   }
>   
> -static int ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
> -			      size_t bytes)
> +static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
> +				  size_t bytes)
>   {
>   	struct i2c_client *client = priv;
> -	int ret;
>   
> -	ret = i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
> +	return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
>   					     bytes, val);

i2c_smbus_write_i2c_block_data() does not return the number of bytes written.
It returns either 0 or an error code.

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
