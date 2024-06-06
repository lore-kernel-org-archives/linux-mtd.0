Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BD8C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pDUkoJU5rhEs7CWGQReTPR9glk1SamRfGvCf4nCvDI=; b=ws6g06pSzsU6Ug
	+vHezRWGj15kcUrNz2femi9mVm3W84UN0Y/ysExD9YtIm2ioYxHwquViIT5nTpXvuv8cwM0w5nABb
	CxgIfX7BCHCvsOcnM86sBwHzpDtBKDD2uKfcT3exyWJTCjGikEfkM5cHZFMoFeX9yJXyp3q8ElKGe
	ZfXIH/+z8kJNIqxAx25/NtDrnJPi1z948NwJupq98+tPRmZZ/wr4uumwToVrICGhetgzHKtamrJZ9
	M3ReRgGi+V4GOqzl58t7zBXWa0qshVJ5Qqo0+Iur4mpvWI6IOn5cJW6yQFD1+JxE7JvAohMV9gBCO
	tpma6jbG4i3URPv3Un7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7lv-00000008iMy-0MhN;
	Thu, 06 Jun 2024 07:42:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7lp-00000008iKz-3THy
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 07:42:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so824335a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717659760; x=1718264560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=QpdF8/e2+csDerZVEAgxFTXKe4QxjbJf/SuFhVnwju5bl8w49TY3TwHrWdUAQ8zY6y
         lqZ0GgewidQxXU58nkFYTdctAdti9jZeJHVhBd4WWJwoMmTUoANmnEDRYe/RgrQ7Lisl
         UTbUQayPecNGtxkpQjPYNvxMgmgFwjcJ168VSD4R8rcLMHR23xn3GvwAUV1uE+Ca/Hab
         DfCUyKvhQ+ZdX56fd2flfrqBqKEIRLR9gM+jESSi2MaSquuaL0rkHJy5h8fe2ZjPBoiL
         HWRD78GVnCtMZO8eYycVkI7sF5UVzrCZ/LRV9CUG5dLPYAP1AR/VWLYJBloB9Dncetye
         AhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659760; x=1718264560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=xFpw4gnlzKk/lhsWUG4oKHV0z0QfJFvrg3tkhSzpYihzFsZd2w0YhrXG5LC1uRSCy4
         CaIr1K5eoLrDAm5ZUZirsgdkx5xTpmMd8ot/78hbKEiFT3957lSM8y+bUGkPStIor8m5
         dHeSFw3Re2OZb5XRbib4VJoI1IC9e9tZE7yTgEPOSOGeymoSxjkgxqfZq8pxJyQgZz88
         FLsghEl+keHH/3tYGFTqxoizy/9Va0frN99GBPNI3YXYTHInZ30yLglhp0moEvG97yZq
         K7tHzo9LnR/VEuv03Zjet99WQ2QpNRe4WAh0WoMkXC7h7ZMf0GDVu4uwks0Np3ktNY1T
         tkOA==
X-Forwarded-Encrypted: i=1; AJvYcCUEWGLjsTmDL75zj0ydaTjCljcZeA/LgOfFKEGNpMabrFB+OXuxOe/tNs8xXCS4RcPv25tEqDCVjB78E9ALza6yegKGJ5ymZXiCIzHdbw==
X-Gm-Message-State: AOJu0YyV3OOS5iiLbS/Rq6ZCIc2xkPICJ6ekrq1X5n2AW8qbhIZNXgQY
	UAob3vtgnwbL2XuJkDzjTULAwE740g8yNc/bZMySULvyjUvN+MDy42n12N2xdPc=
X-Google-Smtp-Source: AGHT+IG9fb84ekx6f8HaBtotI1FnubBAZuTJ3dgM/XdsdCeyuhCLEIFdUbolQkfIb3FKjJXzmIhddQ==
X-Received: by 2002:a17:907:900e:b0:a68:fe79:9499 with SMTP id a640c23a62f3a-a699f88b67cmr343464966b.40.1717659760015;
        Thu, 06 Jun 2024 00:42:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ebc43sm57149266b.141.2024.06.06.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:42:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:42:35 +0300
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
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
Message-ID: <08ff07f4-034d-4342-89da-d83044871ab1@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-2-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-2-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_004249_936599_2C550875 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, Jun 05, 2024 at 05:59:45PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/hwmon/pmbus/adm1266.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 2c4d94cc8729..7eaab5a7b04c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
>  	return 0;
>  }
>  
> -static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
> +static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
>  {
>  	struct adm1266_data *data = priv;
>  	int ret;
> @@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
>  
>  	memcpy(val, data->dev_mem + offset, bytes);
>  
> -	return 0;
> +	return bytes;
>  }

This breaks the build so it's not allowed.  The way to do it is to:
1) add a new pointer which takes a ssize_t
2) convert everything to the new pointer
3) Rename the new pointer to the old name

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
