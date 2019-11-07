Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9FDC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 18:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9275120673
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 18:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nfhujojK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="1VlwdOjJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9275120673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35xvGeEF5WoXAEvIVtvZRa2vGrejQu5iDezGECjHm9g=; b=nfhujojKD9YE1Q
	9liEuBFjxpYyLmTneDrvyTPPmF+PWEoNzYxfoB4ut9eAczfgAlb+aq5ACyr2wHGwRQ54AYV2mTuLX
	tBq3J3tyM9+9+TVs3fN6CY+HagrnmIzPxwVWINpsneCs38a2gkpqjAg4k/kCNhaXRX3JZ0QcMzW+C
	j+DlfO96+y4cK/4/HmOlL1g5f2DpDwNPVga6JuLT0Iu6GwQCrzxMeHBLI0/4mZ6o0gqDh0BkIORpa
	rWjTjDIFgVRu+2iO8SMgLTm/ObhrGpkH/6EQbJOALTELW4NvBilpjaxZlGp9ABTZ53/AwlBbCalts
	QipKUMWhcHhgSMauFNIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSmsk-00061P-2K; Thu, 07 Nov 2019 18:51:46 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSmse-00060X-2F
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 18:51:41 +0000
Received: by mail-lj1-x243.google.com with SMTP id v8so3458687ljh.5
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2019 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Ueg1UA59RHHaZWxQsDHBb3EEU29LwRXFTILGD7z0zY=;
 b=1VlwdOjJYiupASX7aJyR8joDWOMCAlxU1WKPT4D3q7nX5TX2VPj7Nce14EaGz2VQ3b
 mnZ3eQTMblney8gbs8MoFgX6NDD3PsaokugxDsFFu7oYLsH0fR8JX64/npqB4BFANJV9
 ffJlC9h3JM5DLoOjHXuc1VYtU2+xFomHsEJpmt8MjPdJ3iUA10n1R0p0lXyxDVjZe94J
 IkvghbWwfnXUINK3QQ141fWTGYQ/8xSlzd4YxnCmI1DojArxyoAyACnP4afUz70fYH3d
 K1UU/KcmW4j+nb/Z68g951skEwUhtssuR9x3rL8S7u4Wptz1sHtkhdBuPVGPd70KKs14
 d9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7Ueg1UA59RHHaZWxQsDHBb3EEU29LwRXFTILGD7z0zY=;
 b=RMQ0BsnVig/XBp6J3qB3CEpUJ0B1TZQI4Q/UW62NQUE5unRZ77ZElwpUO7jnVfzoKF
 69zcj0uM57L6d4ZiXKqzSr841MVP44EZG5WiOiqQ+Lr0x6OHmVU08cSceudaRXEmbb3u
 kBT2v6u3cGgXQzPVSqisLTw8c5xqbg5WyWpYfJYqCDzQ9u2FAkCtyen1EnmXu7g9TxMS
 DHlH4+c+Mo19M7BYEwP69C80YObdTtaSOwvF4UQWViFdXkGoi2SI7fkDI7TAM6ByVSOv
 qc2kVcidao4OS+YKrlOxJCQAxyG4uu7/fT+7raW8ZMDK0FOR+w4ZoXfRBEi7lbXtmdu+
 v8Xw==
X-Gm-Message-State: APjAAAXDTr2GNQgZJa+XK0vzktB5wLCGAzwsUrNSybP2bQd8nLaij+8i
 8F4VmMhoZOF62CwKQ2grvXKOwhjtpkg=
X-Google-Smtp-Source: APXvYqwvgMJGBkWoTiIU/uQTHJmcPsuQ++9nH83AOL99Pne/EYI2YEGbTYHzOprp1snz+IYRus09PA==
X-Received: by 2002:a2e:9a95:: with SMTP id p21mr3468846lji.175.1573152697417; 
 Thu, 07 Nov 2019 10:51:37 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4419:fb0d:268a:7979:ff08:4b0e])
 by smtp.gmail.com with ESMTPSA id c22sm1674278lfj.28.2019.11.07.10.51.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Nov 2019 10:51:36 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: use spi-mem dirmap API
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <97330369-c42e-0ce3-ab1e-0f4433e6acad@cogentembedded.com>
 <20191026093602.09a8f0ab@collabora.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b77e72e7-bd86-6ce2-accd-31695088e659@cogentembedded.com>
Date: Thu, 7 Nov 2019 21:51:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191026093602.09a8f0ab@collabora.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_105140_521090_2E2CF1E2 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 10/26/2019 10:36 AM, Boris Brezillon wrote:

>> Make use of the spi-mem direct mapping API to let advanced controllers
>> optimize read/write operations when they support direct mapping.
>>
>> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo.
>>
>>  drivers/mtd/spi-nor/spi-nor.c |   79 ++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/spi-nor.h   |    5 ++
>>  2 files changed, 84 insertions(+)
>>
>> Index: linux/drivers/mtd/spi-nor/spi-nor.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2562,6 +2562,14 @@ static int spi_nor_read(struct mtd_info
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (nor->dirmap.rdesc) {
>> +		ret = spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
> 
> This spi_mem_dirmap_read() call should be moved to
> spi_nor_spimem_read_data().
> 
>> +		if (ret < 0)
>> +			goto read_err;
>> +		*retlen += ret;
>> +		goto done;
>> +	}
>> +
>>  	while (len) {
>>  		loff_t addr = from;
>>  
>> @@ -2582,6 +2590,7 @@ static int spi_nor_read(struct mtd_info
>>  		from += ret;
>>  		len -= ret;
>>  	}
>> +done:
>>  	ret = 0;
>>  
>>  read_err:
>> @@ -2686,6 +2695,14 @@ static int spi_nor_write(struct mtd_info
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (nor->dirmap.wdesc) {
>> +		ret = spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
> 
> Same here, this should be moved to spi_nor_spimem_write_data(). BTW, I
> wonder how this can work since write_enable() is called in the below for
> loop (which you skip). Is your SPI controller sending the WE cmd
> automatically?

   Probably not, it just doesn't have a write dirmap, only read, so this part
didn't get tested... :-)

>> +		if (ret < 0)
>> +			goto write_err;
>> +		*retlen += ret;
>> +		goto done;
>> +	}
>> +
>>  	for (i = 0; i < len; ) {
>>  		ssize_t written;
>>  		loff_t addr = to + i;
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
