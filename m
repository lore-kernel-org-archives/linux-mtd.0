Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEE3C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 03:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzpaDIlEcPhfN4i4snWj3jSnX77pJd92MUi4bhhkhwI=; b=3/EFFOdYR8oh4c
	PqXMTTW/gSZZbFgbk+snoJnUi08eSMxI1YfXgXt4H9t3uMse2KgOzuVc0OKV/6NrdKpeRFjaQJqWp
	5UtzJieFpruab9QzSBSUt9MkajzMNP5xW94J0f0RxvB3qcTGL+7KYaye7YeNNsgB4T9kWvivlB3ez
	hyMGisMWS2dVyuFuvXwkBykd2VY92D3PdOdVCXLwOl3DI4qmgO0MJ36RmuTfTpcWA1ntPBGlRXCy1
	VYTa4xHxH13cw6WVQnBvOLeCRjYxLLLHhafe+9rBcKjNBkbZzw3HIdlG11+H6ux0pkQj66dPXlNwW
	hKuuvfuL9wCnNe063mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd186-000sFQ-0W;
	Fri, 17 Mar 2023 03:51:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd181-000sE1-0o
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 03:51:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id eg48so15421795edb.13
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679025099;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwX8hxOa5YDZCFlUDdpV85HuoneJUyIvdMOolC2gCvY=;
        b=Q5zc6w7fthMebWK/41XZcUsKzoELQ2GGu4iKfbjus0Oku6PWJc1IU08ffIA0fPAdTW
         I23gOJtoMiwG23J2WWfaPL+C21OfEKk/u24JEk+h3HisUv7ZvJNY1ESXHs+WaKkyDzbY
         kFwd3xC5Dh21sfjOPt0r0qidVvLFKXqi1tdJY6ysYxxE8MXL/zfwdT2Q7YQHc3WydtOy
         nIP+dL+yke8V42B7LR4OBegN5HcSMNBwOrbRD5gtHqqJPQ2/j1+NBfv8VbN91wKJUnSZ
         u7s3FGAI18L0Ubbb1yJV161BLvf+jX5OMZaDWqoYHwUbf7fKa0A4KUxQKB0Kz/+xBzco
         Muzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679025099;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwX8hxOa5YDZCFlUDdpV85HuoneJUyIvdMOolC2gCvY=;
        b=EjgHCxT+vizddCArzEngEACWD35iAAzFe0/Nvz1d35SI7AYd5CYkm4MOdV8SVfbeVS
         jbj/TGs51PO7xXLmh9n5Vfu/l/zxylJEq9SatFE/V23pk8eZkGiEM9rHl/1fdkveKmYP
         KYdoq0WSZikqhl9KA02NOnZ6lSpm1MzGXNtiicRqOiwjoTFZYQXp/b2GHRFv6Yow3EV6
         eTawhI3z4K2iujBgOeERUsxnyJSp8aWp0PeqxuszhMjPGJDBRhmqAYtv3W+NOsgVXjXK
         aVL3K2qY+jaqOcxS8dSmUnzqUeQBt+yvZCmLpgNAWMp/K36y1mYpqLov9XplBE7/Jtzn
         8TGw==
X-Gm-Message-State: AO0yUKWYIkIiFK3709qeesdkEyO3+W/F+ZFFeGCgBVwPaKImI6X0NWE3
	VSyh6Cp/Mwfv/mlBZv4PKINaCA==
X-Google-Smtp-Source: AK7set/18bp0rWX97Oc6YpJu84t4GtrZ0ZIRDu/0eeeoe5O3fmNMudHhkSzji/3nb4dZ+lRh+gyBqw==
X-Received: by 2002:a17:907:7e82:b0:92c:a80e:2260 with SMTP id qb2-20020a1709077e8200b0092ca80e2260mr14731735ejc.54.1679025099564;
        Thu, 16 Mar 2023 20:51:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id hz23-20020a1709072cf700b0092ff0575a56sm401498ejc.196.2023.03.16.20.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 20:51:38 -0700 (PDT)
Message-ID: <57a59ac4-56bf-9aa4-540a-9d72455951d3@linaro.org>
Date: Fri, 17 Mar 2023 03:51:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/8] mtd: spi-nor: Reorder the preparation vs locking
 steps
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-4-miquel.raynal@bootlin.com>
 <2e2050ee-69eb-9c8a-6a4b-3d9b1b8e9286@linaro.org>
In-Reply-To: <2e2050ee-69eb-9c8a-6a4b-3d9b1b8e9286@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_205143_169000_7F6ED314 
X-CRM114-Status: GOOD (  18.59  )
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



On 3/17/23 03:39, Tudor Ambarus wrote:
> 
> 
> On 2/1/23 11:35, Miquel Raynal wrote:
>> The ->prepare()/->unprepare() hooks are now legacy, we no longer accept
>> new drivers supporting them. The only remaining controllers using them
>> acquires a per-chip mutex, which should not interfere with the rest of
>> the operation done in the core. As a result, we should be safe to
>> reorganize these helpers to first perform the preparation, before
>> acquiring the core locks. This is necessary in order to be able to
>> improve the locking mechanism in the core (coming next). No side effects
>> are expected.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

No, I take back my R-b. The reorder is fine, but you missed to update
otp.c and swp.c, see below.
> 
>> ---
>>  drivers/mtd/spi-nor/core.c | 23 ++++++++++-------------
>>  1 file changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 3845de9c874c..01932dbaa5b9 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1071,27 +1071,24 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
>>  	}
>>  }
>>  
>> -int spi_nor_lock_and_prep(struct spi_nor *nor)
>> +int spi_nor_prep_and_lock(struct spi_nor *nor)

$ git grep spi_nor_lock_and_prep
drivers/mtd/spi-nor/core.h:int spi_nor_lock_and_prep(struct spi_nor *nor);
drivers/mtd/spi-nor/otp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/otp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/otp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/otp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/sst.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/swp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/swp.c:      ret = spi_nor_lock_and_prep(nor);
drivers/mtd/spi-nor/swp.c:      ret = spi_nor_lock_and_prep(nor);

Please make sure you try a build after each patch, you'll affect bisects:

arm-linux-gnueabi-ld: drivers/mtd/spi-nor/swp.o: in function
`spi_nor_unlock':
swp.c:(.text+0x6d0): undefined reference to `spi_nor_lock_and_prep'
arm-linux-gnueabi-ld: drivers/mtd/spi-nor/swp.o: in function
`spi_nor_is_locked':
swp.c:(.text+0x72c): undefined reference to `spi_nor_lock_and_prep'
arm-linux-gnueabi-ld: drivers/mtd/spi-nor/swp.o: in function `spi_nor_lock':
swp.c:(.text+0x788): undefined reference to `spi_nor_lock_and_prep'
arm-linux-gnueabi-ld: drivers/mtd/spi-nor/swp.o: in function
`spi_nor_try_unlock_all':
swp.c:(.text+0x804): undefined reference to `spi_nor_lock_and_prep'
arm-linux-gnueabi-ld: drivers/mtd/spi-nor/otp.o: in function
`spi_nor_mtd_otp_info':
otp.c:(.text+0x30): undefined reference to `spi_nor_lock_and_prep'
arm-linux-gnueabi-ld: drivers/mtd/spi-nor/otp.o:otp.c:(.text+0x138):
more undefined references to `spi_nor_lock_and_prep' follow
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make: *** [Makefile:1252: vmlinux] Error 2

>>  {
>>  	int ret = 0;
>>  
>> -	mutex_lock(&nor->lock);
>> -
>> -	if (nor->controller_ops &&  nor->controller_ops->prepare) {
>> +	if (nor->controller_ops && nor->controller_ops->prepare)
>>  		ret = nor->controller_ops->prepare(nor);
>> -		if (ret) {
>> -			mutex_unlock(&nor->lock);
>> -			return ret;
>> -		}
>> -	}
>> +
>> +	mutex_lock(&nor->lock);
>> +
>>  	return ret;
>>  }
>>  
>>  void spi_nor_unlock_and_unprep(struct spi_nor *nor)
>>  {
>> +	mutex_unlock(&nor->lock);
>> +
>>  	if (nor->controller_ops && nor->controller_ops->unprepare)
>>  		nor->controller_ops->unprepare(nor);
>> -	mutex_unlock(&nor->lock);
>>  }
>>  
>>  static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
>> @@ -1447,7 +1444,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>  	addr = instr->addr;
>>  	len = instr->len;
>>  
>> -	ret = spi_nor_lock_and_prep(nor);
>> +	ret = spi_nor_prep_and_lock(nor);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -1707,7 +1704,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>>  
>>  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
>>  
>> -	ret = spi_nor_lock_and_prep(nor);
>> +	ret = spi_nor_prep_and_lock(nor);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -1753,7 +1750,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>  
>>  	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
>>  
>> -	ret = spi_nor_lock_and_prep(nor);
>> +	ret = spi_nor_prep_and_lock(nor);
>>  	if (ret)
>>  		return ret;
>>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
