Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8220C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B4160E0B
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B4160E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W6BvivwbwoSbVGQqDzve5G7ylwUKYf/D6DhiX/NN6g=; b=Go5+h6/fZ82t5sfg+ZTprLghCv
	L/0pjakJF281c8QlL3JWhCcK39k5K/8hMaH69mL8hR7IEGuKdR5bxWRA3xc0ghQIVbbuAsXJqd5HO
	wBpRxt7czLtO0Grfmc2JX26aZ+TEi+5gwu9AtPq8qK7/aEDDxvwNei+S3tb/VMWFcurgkr3SWBIJf
	f8Tn9DQAjUANf0IV+Lz27jIsoCM2MCp1vn5K+0kNb8XXdvi9FZLt8P513RwSnQSPYZTMGdMKCxZgd
	5LZ+kZDMp3X0NgwVY55EA9q2+Duf5tienhda6pNf5e7+F2bds+KHkL82fHtxPZhKaWzJbQDpZKAxL
	fmQ/lp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKES-003GVS-KO; Fri, 02 Jul 2021 14:33:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKEO-003GUJ-4J
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:33:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id a13so12696333wrf.10
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jul 2021 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yg6T6XgBRGREnhXMP7pkqoY1IXLSKt4cV0sIiXH7B3s=;
 b=KVcNf4J4kaBFgWczLr7ht2yO5gBvyaGXqxJTjgJEJBGTEUxuRh1Qbs7ZIkQFr4pazq
 xBb74KrjiU7jkzs241pMLZTOXIozfa7fq3A0wRUy3xiRXrAK8u/qsE4HeRWVUKfLe0hj
 AqMTinFZDEeOAzXdhmizx4RbRrmK8c8RPAQkBJH1EzQPC6GHx6BoIlV3PmbK38J3Vl+X
 RSSgWeTfE0B8+mEaEbVYkEhsR3lUHm+AhFW+gxJwFrAuU665JOvZL2f+HcReO3xCyvoP
 lxEc0YrJLOI6vwY6wbxcWqzhsBwHLT35QCNkCTLdX8EnohVlcWZRBnomFpw0wwU4zTwU
 qWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yg6T6XgBRGREnhXMP7pkqoY1IXLSKt4cV0sIiXH7B3s=;
 b=kIglOjA9iNVQ+karGsd6mmS7Y3flhha0MgV7vCxLpakSTlS19yvLhQX90LyNLsZXVa
 f6IoPzSzaAq1VWSoKg9F1Nto5pekV8suwHvY1AXmcuEKkpW8sxB+XqUF0hwhgagyLEA4
 HzuckLoKoq0FM3+6PvOsM41U7HnvCfwtj0B0bzFuxq06YRMpBV/x5g+cDcr2+vCBnYwL
 aP0fugoDx2Bn3s23MjFs4IR65Ms9CWpEKydYWLwuIWZSkg2MBnSdUBbrvG+6E6jIFIQW
 89a0p1pft0Aoi1LsWcSS3ueStaIbjU6+Hk6nf7p2xYtWDorPNWAuz+d6xUVjTN8FQVsg
 npNg==
X-Gm-Message-State: AOAM531JIM4gQiktzNcBy8uI4yUDO9t01y0hQfJzQP6RL09lnhNgI9sX
 XT9OdPKvUmeFmLd/dDadTQ==
X-Google-Smtp-Source: ABdhPJwRzvIEblO67wnYaT4Ulo2WCqySJlUEBZfNftZJ7G2qutKNi4dpNlx2dtiM5/wDdTuiwrNuJQ==
X-Received: by 2002:a5d:4911:: with SMTP id x17mr6373214wrq.328.1625236402436; 
 Fri, 02 Jul 2021 07:33:22 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de.
 [91.67.75.139])
 by smtp.gmail.com with ESMTPSA id p187sm3408280wmp.28.2021.07.02.07.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 07:33:21 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
To: Tudor.Ambarus@microchip.com, macromorgan@hotmail.com,
 linux-mtd@lists.infradead.org
Cc: vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <a31c9949-089c-fae8-b8a4-30055a4833c7@gmail.com>
 <bc09e0c7-bbf5-944d-ad8d-13b24e410e51@microchip.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <174a925e-4ab3-a043-c049-6407b1f6e5c7@gmail.com>
Date: Fri, 2 Jul 2021 16:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc09e0c7-bbf5-944d-ad8d-13b24e410e51@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_073324_245871_E0BA10A1 
X-CRM114-Status: GOOD (  22.48  )
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

Am 02.07.21 um 15:21 schrieb Tudor.Ambarus@microchip.com:
> On 7/2/21 3:49 PM, Alex Bee wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Chris, guys
> 
> Hi,
> 
>>
>>
>> Am 02.04.21 um 22:15 schrieb Chris Morgan:
>>> Add support for a new vendor (XTX) along with a new chip from the
>>> vendor (XT25F128B). This chip is used in the Odroid Go Advance,
>>> and has been tested extensively using the spi-gpio driver, as it
>>> is connected to a serial flash controller that is not currently
>>> supported (but the pins can be repurposed to GPIO). Read, write, and
>>> erase all work as expected.
>> Once you've figured out how vendor id stuff is read out correctly, would
>> you mind also adding the the XT25F32B variant?
> 
> I've started working on this, here's the work in progress:
> https://github.com/ambarus/linux-0day/commits/spi-nor/next-id-collisions
> 
>>  From what I've checked it has all things in common with XT25F128B -
>> just has a 64 instead of 256 sectors.
>>
>> Datasheet can be found at:
>> https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F32BSOIGU-S_C558851.pdf
>>
>>>
>>> Datasheet can be found here:
>>> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
>>>
> 
> we'll add just flashes that we can test. Do you have the flash at hand?

I do, yes. I'm currently adding devicetree support for the upcoming Rock 
Pi 4 plus revisions, which will have these flashes onboard.

After adding support for this variant ontop these patches (the wrong(?) 
flashid is 0x0b4016, btw.) everything is working as expected.

Since it has been requested - the sfpd table and other sysfs entries 
look like that:

~ # hexdump 
/sys/devices/platform/ff1d0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 01ff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2700 7994 64ff e3fc ffff
000006c

~ # cat 
/sys/devices/platform/ff1d0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
0b4016

~ # cat 
/sys/devices/platform/ff1d0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer 

xtx

~ # cat 
/sys/devices/platform/ff1d0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
XT25F32B

Alex.
> 
> Cheers,
> ta
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
