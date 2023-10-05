Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E17E93710
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIv33z9iDGe6E1M2pPRvCrra49PEPRhFZF5WELMgav4=; b=gVZUQDOvfv0PFS
	pkRMh7veMdpFif1KcZmsE7ra3r+nyCuxbks6tXtJlhtGN6+fhNwMiPvvCzMSGqYuH4NkpCIp/nem6
	dep5OZSWHE39AsVlhPrQA+9tqmee+q+YZIAfvu+XIphb6+oPGVI+T77IAxHk2HkdtizxbjQ1vMUYM
	fhlfFTfHLcMWccZvcDTrCgjt1tiNmKcJoBXI1yAHvIbhfViwOZhVWBK5k9Y9Vq4omE8C/O/274dCv
	jbeIWx/8NaLWDKarS3if54RuyJ2OmiOx79Edutu3LbainP/JG9jKIs1R8u/BPI2xQI9pjGdpXPpti
	TGf5Fzfxyi94qDFZtYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoOlj-003cyU-1v;
	Thu, 05 Oct 2023 13:51:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoOlg-003cxE-0g
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 13:51:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9adca291f99so176896866b.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Oct 2023 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696513912; x=1697118712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqy329Cogar5edR2RI7RX06cxB/7bukXjjsqcrAyui4=;
        b=ox435EJuPlHe1yxQc/GG7Fe1EgtTKm6myft1UtMG6mAjC2F6s46Ps6Bbbcu4ReRUPS
         B8jGpxgBSvTVzpy0IZBc8IAmXoKMIuMXK5PJcylOTzZEMkiQTm+Xf7o+IuMu0zI87Bh2
         EeT8QSq981jad2xvoKlqp8V3dcPK/uVXNl1ifa1q4PtTJlwCXJSXIo5CZXPfZuLcZVY4
         URM8dPyWh+Tqr8kHNPr6w5uCbxZpX1/ouGW+ftjAl5WMI+suxVdhiYSlYnmDM9suFqBP
         XquduWbZQ8a9EIEp5FHj6AKteyzGJf6qY7TqcIj1MVAnVabU4EX1YpyoUfQk8qzrUfVp
         CBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513912; x=1697118712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqy329Cogar5edR2RI7RX06cxB/7bukXjjsqcrAyui4=;
        b=kxnVb/phWvseQBgFYJ7ahrB7TSIBvZ2Mo/MNYsp7I5YkUHOnxSlH20jyRP1/sKGLaE
         9CZ3ld+zN6uhSBadaRJ0ovYKzdotk6PX7/Ozyte18fvdyaNbFtnNjjWkOwlA3W4tLv5y
         D76QHla96/M98TkxSGptkoozqskBxu738ZmBDG24baOKKLPA8539qxsBmek5J7qrP4P3
         5qYung2eWfHwFfEGnXLs2G9oBW+46pxJrolMzipqfXryRHBvFvPedHiMC7TZATTVpy6L
         tkltoLDSIFSYAWlxQQrEsH7Khwsj7F4P/LpzdaL/HXPp8V+18kAJnZja+0if1KloxRDv
         TJdg==
X-Gm-Message-State: AOJu0Yxj7tOyEJS3d2vJL5jfGC+JEEy9Vl1QLZvVE5zG+0MJmpNMNxXW
	ZktJ0ksuY/6uU3wPCCsTIaMl1A==
X-Google-Smtp-Source: AGHT+IEpUwrkNTiPZ8CpjrfNNTFs5Y6qhkeIF2v42KiS866I2/Kgz/6z8spn/gMS2JdxT3QQsGx+Cw==
X-Received: by 2002:a17:906:308b:b0:9b6:550c:71cb with SMTP id 11-20020a170906308b00b009b6550c71cbmr4400036ejv.52.1696513912297;
        Thu, 05 Oct 2023 06:51:52 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id m15-20020a1709066d0f00b00982a352f078sm1213209ejr.124.2023.10.05.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 06:51:51 -0700 (PDT)
Message-ID: <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
Date: Thu, 5 Oct 2023 14:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_065156_256725_B5A16924 
X-CRM114-Status: GOOD (  18.88  )
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



On 10/5/23 10:21, SHUKLA Mamta Ramendra wrote:

cut

>>
>> and the second one will add just the BP support, something like:
>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>> b/drivers/mtd/spi-nor/micron-st.c
>> index a8da1f18e335..fdafbfa0f936 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
>>          }, {
>>                  .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>>                  .name = "mt25qu512a",
>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> SPI_NOR_4BIT_BP |
>> +                        SPI_NOR_BP3_SR_BIT6,
>>                  .mfr_flags = USE_FSR,
>>          }, {
>>                  .id = SNOR_ID(0x20, 0xbb, 0x20),
>>
>> Of course, I expect you to run again the mtd_debug tests and also verify
>> the locking. Thanks!
> 
> I applied both changes as mentioned above i.e
> 1] Switch to SFDP and 2] Using BP Flags.
> 
> Case 1: Use BP Flags and Switch to SFDP
> With both these changes, the lock/unlock doesn't work.
> 
> ## x86-64-smarc-evk-uwd0j0007 # uname -r
> 6.6.0-rc2
> 
> # flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: unlocked
> Return code: 0
> # flash_lock -l /dev/mtd0
> flash_lock: error!: could not lock device: /dev/mtd0
> 
>              error 5 (Input/output error)
> 
> 
> I suspected this is because of miscalculation of BP bits, like the 
> possibility mentioned here: 
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=3ea3f0ac242c86c0275d347ab8c92bf1eb854b49 
> 
> 
> But further checked size, it is correct:
> 
>   # mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 67108864 (64M)
> mtd.erasesize = 4096 (4K)
> mtd.writesize = 1
> mtd.oobsize = 0
> regions = 0
> 
> And rest of read/write functions work as expected.
> 
> Any suggestions about this?
> 
> Case 2: Just added BP flags, rest of the size, mfr_flags, fixup flags 
> kept as it is.

would you please detail what exact definitions you used in case 2? Send
us the diff please.

Cheers,
ta

> Lock/unlock works.
> 
> ## x86-64-smarc-evk-uwd0j0007 # uname -r
> 6.6.0-rc2
> 
> # flash_lock -i /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: unlocked
> Return code: 0
> 
> # flash_lock -l /dev/mtd0
> # flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: locked
> Return code: 1
> 
> ## x86-64-smarc-evk-uwd0j0007 # mtd_debug erase /dev/mtd0 0 1048576
> [  413.472411] spi-nor spi-PRP0001:00: Erase operation failed.
> [  413.478084] spi-nor spi-PRP0001:00: Attempted to modify a protected 
> sector.
> MEMERASE: Input/output error
> 
> # flash_lock -u /dev/mtd0
> # flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: unlocked
> Return code: 0
> 
> ## x86-64-smarc-evk-uwd0j0007 #  mtd_debug erase /dev/mtd0 0 1048576
> Erased 1048576 bytes from address 0x00000000 in flash
> 
> 
> Further I tested on stable 6.5.5 Kernel with old way of Flash Info 
> Format and which has forced PARSE_SFDP Flag, no issues with lock/unlock.
> 
> 
> ---
> Mamta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
