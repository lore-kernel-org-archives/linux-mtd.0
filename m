Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB3C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 16:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC1520657
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 16:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ie3dYXEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="n6VwzoC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC1520657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HpGOejiu6OEBEc8W73vzo/Ndx7iaWi2mhxNlv26BOU=; b=ie3dYXEVXWZurT
	zGV3Y60tta2tzuTBx6qsYRsJi0y0lvvdSffWCMSz3cnibpjN0VIilR/wEc/BcxJzaHP3r2xcb0RZv
	MkaxS2uHRb0IPQ1132/+bDyB3TitgDer+bi718ioqbLIJu/0tSUDRuKAluOOpxhlCfBU+Hyiglgqr
	GFXOUC0+5+d9ICtWwleWKG/rzmz3nw9uCz86NFjhESeey46FiCMyRY7Hp3xz4GgO9bcRx1lhGY9aS
	HNZCelx/HeJpJ69AztOYg17rLrGRMeWfOrcK2cw6tLIV0da1T3LebfNj8ZCR8AHa9qfGSU8z7pI0e
	pE/8zIEy/X7L0mqkymyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsVO2-0002QV-5b; Tue, 30 Jul 2019 16:54:06 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsVNq-0002FX-0E
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 16:53:55 +0000
Received: by mail-lf1-x143.google.com with SMTP id h28so45196943lfj.5
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2019 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dr5C7KQU9eOCQSa8blb+7TwHFoH/AQOPyjtbxZR3wEw=;
 b=n6VwzoC82cjLzaKyMS8TYJE21RybcmpxGRbyaDegPwja7yh9OImhVQ96rNFap2asR+
 AesvPOS6PMPKdIXBKXbBhS9JnXyov3teWpjDtcz1RAuF8uzkgWIwC1E2vJuycwXl7o4B
 1GBFQGSZ6HHgoU6h3Riq1tDwK9tN5+GB+PJawR9jmOqtLGLq0XnaMKPRe8QDNFinGNDv
 iHT0dy0E96DEOROAErzWARnrqfe0n4uaxaEDuTSGvcoVf1HAXitquQdneqDEzemhG7ec
 dMzo5x7GVe1M9hFoCSXWTeEqVdA+XECsKDOZEY9npRoButzNFXxnKzuOQquN76bSbb2e
 kwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Dr5C7KQU9eOCQSa8blb+7TwHFoH/AQOPyjtbxZR3wEw=;
 b=BWh199OwRg5SDazqUeIdohuArXR4RMDSdURcpWHT3DktWxxurWEWAbPjc+8NMWh6Lz
 mh1a6ADu+2rgfDAsU/+2XAgQB2uaOk62SQhKZD9W13wgCqCTq9JlZ8pqx+5dk7DI7DZT
 MyySyWjxAfc8puFdjQ22v82MXV0OexFdrEIBzS9JbDEr/16ju1yHFtwyrPDliWr0/abH
 5jh57RyAoX5jxaTRhSVQtloYsWl1HfwcidXfX1Pk6GNuzreW4pW/Ohvrdk/s6HOdC+Ta
 KqM/YoKG/kfwdW8DfmKGvhPrUx4yXeh6pApITp1t/vrt/LSxDopfV0V/r3ksmTUnGBKk
 MO+w==
X-Gm-Message-State: APjAAAWw1cvGM9xmtxfg0aLumEUPScvKI/w7S/k9ktJx0aUOqYr/bamM
 DmvlmHJhEvPYliP+1Bk2hQHEPQ==
X-Google-Smtp-Source: APXvYqwJvNf17IzLfphH3pMtcc+2Ne0XbkA7B9Qjxqb0xpsM3x4YTmfFl6y9Ur5HSRYGsOfd35JrdA==
X-Received: by 2002:a19:4f4a:: with SMTP id a10mr54759913lfk.30.1564505631521; 
 Tue, 30 Jul 2019 09:53:51 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4c5:af01:782b:483e:bc20:30b0])
 by smtp.gmail.com with ESMTPSA id v17sm15174582ljg.36.2019.07.30.09.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 09:53:50 -0700 (PDT)
Subject: Re: [RFC v1 0/3] *spi-mem: adding setup and callback function
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomer Maimon <tmaimon77@gmail.com>, vigneshr@ti.com
References: <20190729142504.188336-1-tmaimon77@gmail.com>
 <20190729172859.4374a2ad@collabora.com>
 <CAP6Zq1iPXDX_Gtz6ZWYm3JoHgHjdapotVLGw-Lq4tc2X-6eAug@mail.gmail.com>
 <20190730085438.6fe0480b@collabora.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <2272f934-df83-bd6d-2aee-ac2d93799092@cogentembedded.com>
Date: Tue, 30 Jul 2019 19:53:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190730085438.6fe0480b@collabora.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_095354_240825_9530740A 
X-CRM114-Status: GOOD (  19.86  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, tudor.ambarus@microchip.com,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/30/2019 09:54 AM, Boris Brezillon wrote:

> Trimmed the recipient list a bit and used Frieder's new address.
> +Sergey

  TY. :-)

> On Mon, 29 Jul 2019 23:55:05 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
> 
>> Hi Boris,
>>
>> Thanks for the prompt reply,
>>
>>
>>
>> On Mon, 29 Jul 2019 at 18:29, Boris Brezillon <boris.brezillon@collabora.com>
>> wrote:
>>
>>> Hi Tomer,
>>>
>>> On Mon, 29 Jul 2019 17:25:01 +0300
>>> Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>  
>>>> Lately we have working on Flash interface unit (FIU) SPI driver that
>>>> using spi-mem interface, Our FIU HW module support direct Flash Rd//Wr.
>>>>
>>>> In our SOC (32 bit dual core ARM) we have 3 FIU's that using memory  
>>> mapping as follow:  
>>>>
>>>> FIU0 - have 2 chip select and each one have 128MB memory mapping (total  
>>> 256MB memory mapping)  
>>>> FIU1 - have 4 chip select and each one have 128MB memory mapping (total  
>>> 512MB memory mapping)  
>>>> FIU2 - have 4 chip select and each one have 16MB memory mapping (total  
>>> 32MB memory mapping)  
>>>>
>>>> Totally 800MB memory mapping.
>>>>
>>>> When the FIU driver probe it don't know the size of each Flash that
>>>> connected to the FIU, so the entire memory mapping is allocated for each  
>>> FIU  
>>>> according the FIU device tree memory map parameters.  
>>>
>>> Do you need those mappings to be active to support simple reg accesses?
>>>  
>>>> It means, if we enable all three FIU's the drivers will try to allocate  
>>> totally 800MB.  
>>>>
>>>> In 32bit system it is problematic because the kernel have only 1GB
>>>> of memory allocation so the vmalloc cannot take 800MB.
>>>>
>>>> When implementing the FIU driver in the mtd/spi-nor we allocating memory  
>>> address only  
>>>> for detected Flash with exact size (usually we are not using 128MB  
>>> Flash), and in that case usually we allocating much less memory.  
>>>>
>>>> To solve this issue we needed to overcome two things:
>>>>
>>>> 1.    Get argument from the upper layer (spi-mem layer)
>>>> 2.    Calling the get argument function after SPI_NOR_SCAN function.  
>>> (the MTD Flash size filled in  SPI_NOR_SCAN function)
>>>
>>> That's clearly breaking the layering we've tried to restore with the
>>> spi-nor/spi-mem split, and I don't see why this is needed since we now
>>> have a way to create direct mappings dynamically (with the dirmap API).
>>> Have you tried implementing the dirmap hooks in your driver?  
>>
>>
>>  Sorry but I wasn't familiar with the direct mapping in the spi-mem, it
>> seems it needed to implemented in the m25p80 driver as well, am I correct?
> 
> There's this patch [1] floating around. IIRC, Sergey was waiting for
> the m25p80 -> spi-nor merge to send a v5.

   No, not really waiting for it. I was asked to recast the patch using
the managed device APIs, and I got sucked into my HyperFlash driver and
dropped the ball...

> Vignesh, any updates on that
> one? If you don't have time to work on that, maybe Sergey could send a
> v5.

   I can try recasting it RSN, if it's blocking some other stuff...

> [1]https://www.spinics.net/lists/linux-mtd/msg07358.html

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
