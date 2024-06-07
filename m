Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E2C27C5F
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3R9WxrGXI0MWgAtMRz8MCvl4L1gMwCzHZ9CO+jihnZ8=; b=m6RHcgwvN7+qtu
	KLb8jAFpwvzyahjVMEE/ZuRoimhWKQ/zxwYT6xigube9IYDX/WBbXV2Xzm3NnF0XZXIQs/1x7eXH/
	PBMF7ZFcPZ7BhZu3slq5He/TnV5AARGH40mjPGF5rCh13zyepPlqO9CDd/B3w8uZZp0eeHfPuKDr3
	LkQAP40Y2HLSJZl59/hkKckN25kMOM1JHzU6aJuBMgnC/UscMRV4lbgyD7mk5H8xKXpVkPHN1tzgu
	qd6TPluEBPtt3IsZBF7NuDwmcclFJCi7UkkC+9mHoBsobO+/LW8cTJhB8g5y7WJULd+FBySo/vYJz
	r4X3mAkDXeBhZx2Cf5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFbeK-0000000EkDD-06tN;
	Fri, 07 Jun 2024 15:37:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFbeH-0000000EkBA-0ucp
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 15:37:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42160f2dc32so13146575e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2024 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717774617; x=1718379417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WFHGyOf2WCg/AHCXQoRe0OOLDlNcvfZjAFHn1msRSw=;
        b=OZMadpBsN8F9MWDVmJsi94S02rH3wNjOK/2O+lkGiG985Q6msH9Cs5Bpg8SiK6Vf5L
         2B5MClTYWGT7K/AxEwja2Jjkc/BSlFqTJSCoBw5LleIJ7w38rZ+Sa35NXTBBcTQVxJ2d
         wRo9zA4hYKwkfHxpXToGJCG19jx6pC3dMiUAWKDkV3wJLFh2pE2zFSF4sNZ/AEaK4lec
         3MNOee6/VjEFZje79EKqBwWTjD3JBcytGE9YAkMLmGGP6ev2iQphjs/L1e8xb2KOZhau
         JeolbJVS0n8G5jMDYQQgoD+OGgRMdwwDTXkUjalsMiLx7F9C5Vmr0FMzj8bI1ryf2siZ
         qmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717774617; x=1718379417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WFHGyOf2WCg/AHCXQoRe0OOLDlNcvfZjAFHn1msRSw=;
        b=EK0hnPyG7EfqnF7pcYwwuNICpKm+wBJ7/bvrUzGxo54bQ0Tpqz3nFjjFrgPvv+W1uK
         EPWCWAKTMsYPpwCgTlPPMe8FyPEfRQFdTwBt/V9Munp1xejewozCYmApGuvX9UYSlJYz
         r3J5HH6BIwztU+hHbRU9pFrOdMig4O03VjaR7MM8P5WxfGDQ7/IDH5DT982WwSx2NV5g
         ugNetlpe23UIoFM9rXAZBmHM5+FWc89PfweZ6gfuMfLCaF7nJwIHrNsJCwqphp0wBRho
         E9ORtHesUxqhzYuPKCsZrASjTkOs1uHZiE8H+p1Syl2QfhIZkIXhZaImcHpUPdXeA5TP
         EdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG/T+T+M3Y3ZCnEFxoNAhfPoBZcvBt0YmbUMYsYebJ3t2Ju9/pY/bELnBaWoY8u5KJzCTYXcWP7tcNkpd+X9kU3hiCzA7y3e/s3mnTIA==
X-Gm-Message-State: AOJu0YxvZZj5JVqj2FNjwilOOjWxsK94gSiyOl9nRqP8VgYgAEoN8bM3
	MwPNj+QRltMuuraBEvNisl/vFfm/dPki4fjbve/FeoY5ZyvjnEVuRMohSgdXJAY=
X-Google-Smtp-Source: AGHT+IEDldfKJ9oi/vJP0wgtmawveExjpCYHaZ1+MQjCvlUC+KOjWN7/r5DIQyvHKU1HK5ctc+JgNw==
X-Received: by 2002:a05:600c:444b:b0:420:29a8:ff5e with SMTP id 5b1f17b1804b1-42164a0c1c9mr25925175e9.19.1717774617356;
        Fri, 07 Jun 2024 08:36:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4215f89aacfsm48862905e9.42.2024.06.07.08.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 08:36:56 -0700 (PDT)
Message-ID: <7cc32596-8af0-43ff-91fd-59264d0a29ac@linaro.org>
Date: Fri, 7 Jun 2024 16:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_083701_465750_BFEEBCA7 
X-CRM114-Status: GOOD (  10.46  )
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



On 06/06/2024 09:41, Dan Carpenter wrote:
> So the original bug was that rmem_read() is returning positive values
> on success instead of zero[1].  That started a discussion about partial
> reads which resulted in changing the API to support partial reads[2].
> That patchset broke the build.  This patchset is trying to fix the
> build breakage.
> 
> [1]https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/
> [2]https://lore.kernel.org/all/20240510082929.3792559-2-joychakr@google.com/
> 
> The bug in rmem_read() is still not fixed.  That needs to be fixed as
> a stand alone patch.  We can discuss re-writing the API separately.
I agree with Dan, Lets fix the rmem_read and start working on the API 
rework in parallel.

Am happy to pick the [1].


--srini

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
