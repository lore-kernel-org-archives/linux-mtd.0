Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0499C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNF2wZ2Xxrbdb/zBfz7GPVyoNQnkcZuerO9b+KfZRjE=; b=fOTHBfiWN20gqC
	hXFZfOvsvfNBmF5JHLNHJh+f63VQf+wdBbSmHbgXtZ0EXOjjWbSj9UBUE8GkqX4XbKRrTeDeBwJf5
	u2riCJwbpSG7HLwna/fHSHp/jkzRnQo62foDvozr53E912+IDlkBSNfqdPqc5ZtpejFX/4wEctsjn
	awDXQ94zuQyMo1LdYAB3qgdM3cYfNsj2MB9+FVPbe+P4xxmpIzILQ4S9lkKE6tTcz1/u7OvSzzufT
	bCMEJcLcQdjJtgc1C7RpslxsOgk0GZxq1Lp7zT3qmlwrquWBz5iC1HVJGWUO9Jahq+9o4uMo1HBZV
	TY0jaoMFco+CWBLlwy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFA74-00000009LMN-2O4G;
	Thu, 06 Jun 2024 10:12:54 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFA72-00000009LLL-2A1l
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 10:12:53 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a692130eb19so75625466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717668771; x=1718273571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYT9tVkTJ0UAXf8TGzWVnjnavb5dtCMnGfW04T5qoh8=;
        b=IBvpCyCCYyabZorOdtKsdnnuONEEYlfIQ3O5KWf+0nHf+BZTwBVnzCA9fMQtWeMMh9
         iA1xibkml2k+aTgBnjdmdyxQuZTg8UVnJequSZLXiqhLsQGzpyQ+w0NsIZ1RrqzhlaOM
         tyrtSVzgo1sZI3sscxd2RKSgEh5oSYKbcNmXc9otsbY6sxQhtBmU5SiDaAmIJENuoe+m
         qX4IgW58Tt6u4xZoMNd2bhp3L7ZLkyPXtBJwBT+X/h1H4ZfuMO3apb4ojDAWU+qsNbmf
         XqK8h86z3GjycGUj1MdoYpMJV+7yGCqAcDeKaqxYQdnOySDg6FOL/qPK312RO5FMKcP8
         XINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668771; x=1718273571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYT9tVkTJ0UAXf8TGzWVnjnavb5dtCMnGfW04T5qoh8=;
        b=HnZXtT7/qHpO7x/ZneCjlpApwUysrFQCte7XHJQE6zFaYXCRqdt159UlgE5s0WZNpG
         hSpyoTK1oDTvVpyaTdUlZehutZNc6g8L8dCBiCP1s/skA6PWPNZ3vBY63zKrJKyN4rMB
         FTUHd8Jn5Zn7IBdh1nIw40o4xi0G3Qm/7NK3KxEniO0A5dfANnJ2E2iINpjpZkgmLZm4
         NU/7a4Ykpdy8I9cdUL94p25YoBcpDncfgwPV6Tjc8dDG9RMT5OA0eveAs92TUpEfB8sA
         z0LxK0opD05lQC6wWKlD55bhpt2G+A+aCWAqPtRjhTpWxqcIs2ZUpztuvravEpf1urqr
         t3QA==
X-Forwarded-Encrypted: i=1; AJvYcCWEnUAbq4FjzM7XTFeKyNwwYyhoTjHeNEhLYezGwTIVvA7TeFP9tWkL9BtkAOyXPYXBp+6AReghlC4QFCAv7PqxUsBnIVDuN2IflBV+IA==
X-Gm-Message-State: AOJu0YwRdrv6kSVjScIbxpVUbxRx2MI9z4RNQUDg5aMivSqZsIRQHiui
	um3iQcvLKXxngR0gw451USd+kFEJyibbUSm7Um4mzQV2+xg7yILGJcrWb7nTT7M=
X-Google-Smtp-Source: AGHT+IGXEvwhigvaa2F7LH3u2SEZD2GotxH0tm3Qb9rzSgbG/zs824MHzxfnZBM0j8XV9T2jW92teA==
X-Received: by 2002:a17:906:38d1:b0:a5a:1562:518c with SMTP id a640c23a62f3a-a69a02363f3mr311414866b.48.1717668770651;
        Thu, 06 Jun 2024 03:12:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e82esm74598366b.161.2024.06.06.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:12:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:12:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v1 06/17] misc: eeprom: at24: Change nvmem reg_read/write
 return type
Message-ID: <e5f3e798-0fb9-4dca-9449-cc1ab0677700@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-7-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-7-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_031252_575373_C6E58C19 
X-CRM114-Status: GOOD (  16.27  )
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

On Wed, Jun 05, 2024 at 05:59:50PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/misc/eeprom/at24.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4bd4f32bcdab..0e8d92d6ab1e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -424,8 +424,9 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
>  	return -ETIMEDOUT;
>  }
>  
> -static int at24_read(void *priv, unsigned int off, void *val, size_t count)
> +static ssize_t at24_read(void *priv, unsigned int off, void *val, size_t count)
>  {
> +	size_t bytes_read = count;
>  	struct at24_data *at24;
>  	struct device *dev;
>  	char *buf = val;
> @@ -465,11 +466,12 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
>  	if (unlikely(at24->read_post))
>  		at24->read_post(off, buf, i);
>  
> -	return 0;
> +	return bytes_read;
>  }

This is called like:

   574          ret = at24_read(at24, 2, &val, 1);
   575          if (ret || val != 11)
   576                  return;

So this breaks the driver.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
