Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FBDC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 03:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD94D20665
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 03:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJtgMQjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD94D20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j1LLOF8k7fF4Vd9pE7bFUE4q9KzzqJn861v2PDWV+bE=; b=eJtgMQjU5c8nUVzPUwQOEFRWj
	zAHmjPcXiH55W7Pp4DpYIEZ6DIEHZFL6frZewLfk08itp0+nvCdmCjg8zPXosPI2XFXM+h1c1ExTU
	mnzt6baztDfHGAQvsMZR4cMX9wTO+n+2uZuRN/NIY/Xw0fsu0wil/ejjY/zCAi88gQD+42e55YAPM
	NMvuw5if05WV5+GEyC/rDirAhaZac6p+P6CGAJ0RFgqA5SGcQgsUl7EuqrgeL1hRfDD9mcIDbT/qA
	zSK7lwG0zDOTrlM/3AjnSrHhGBlD5Xf60QuI66nurJRQSABZmRfTucyUGyMQDATnILS5Xd3AHQuZI
	dJ0/6k8Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAPNv-000417-JP; Tue, 25 Aug 2020 03:12:31 +0000
Received: from gw-eagle1.siemens.com ([194.138.20.72])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAPNs-00040L-UJ
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2020 03:12:30 +0000
Received: from mail1.dc4ca.siemens.de (mail1.dc4ca.siemens.de [139.25.224.78])
 by gw-eagle1.siemens.com (Postfix) with ESMTPS id 1020E4F0070;
 Tue, 25 Aug 2020 05:12:24 +0200 (CEST)
Received: from DEMCHDC89YA.ad011.siemens.net (demchdc89ya.ad011.siemens.net
 [139.25.226.104])
 by mail1.dc4ca.siemens.de (Postfix) with ESMTPS id AA64C1622BD70;
 Tue, 25 Aug 2020 05:12:23 +0200 (CEST)
Received: from CNPEK01M03MSX.ad011.siemens.net (139.24.237.220) by
 DEMCHDC89YA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 25 Aug 2020 05:12:22 +0200
Received: from CNPEK01M03MSX.ad011.siemens.net ([139.24.237.220]) by
 CNPEK01M03MSX.ad011.siemens.net ([139.24.237.220]) with mapi id
 15.01.2044.004; Tue, 25 Aug 2020 11:12:20 +0800
From: "Jin, Le" <le.jin@siemens.com>
To: "Kiszka, Jan" <jan.kiszka@siemens.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
Thread-Topic: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle
 probe deferral while requesting DMA channel
Thread-Index: AQHWehUBoExbvQYBc0+HV1ub3Nt/GKlIJI9w
Date: Tue, 25 Aug 2020 03:12:20 +0000
Message-ID: <84209e7d08e24362bdf7ccbab1c46e60@siemens.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
 <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
 <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
 <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
In-Reply-To: <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcejAwM3YwdXBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jODExZWUyMy1lNjgwLTExZWEtYTdiYi00OGJhNGUyOWM1YzBcYW1lLXRlc3RcYzgxMWVlMjUtZTY4MC0xMWVhLWE3YmItNDhiYTRlMjljNWMwYm9keS50eHQiIHN6PSIzNjUwIiB0PSIxMzI0Mjc5ODczODU0NDc1MjQiIGg9ImJ4TUU3bGZuQjZVTnBmbkZwUmxOSFNFRWJ6QT0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUhBQUFBQms5RzJLalhyV0FhU2FmQ3MzYnY3RnBKcDhLemR1L3NVQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUJBQUFBQVFBQUFBQUFBQUFBQUFBQUFBQUFBQT09Ii8+PC9tZXRhPg==
x-dg-rorf: 
x-document-confidentiality: NotClassified
x-originating-ip: [139.24.108.114]
x-tm-snts-smtp: D8EF412AA5EA5D4009F7606EB488764A96583B18430D5CC3616F788D992CCDA82000:8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_231229_225802_38B33A9E 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: "marex@denx.de" <marex@denx.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Jan,

The flash on our board is Winbond W25Q128JV.

Best Regards,
Le Jin

-----Original Message-----
From: Kiszka, Jan (CT RDA IOT SES-DE) <jan.kiszka@siemens.com> 
Sent: Monday, August 24, 2020 8:49 PM
To: Vignesh Raghavendra <vigneshr@ti.com>; Tudor Ambarus <tudor.ambarus@microchip.com>; Mark Brown <broonie@kernel.org>; Jin, Le (RC-CN DI FA R&D SW) <le.jin@siemens.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>; Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; linux-spi@vger.kernel.org; simon.k.r.goldschmidt@gmail.com; dinguyen@kernel.org; marex@denx.de
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting DMA channel

On 24.08.20 13:45, Vignesh Raghavendra wrote:
> 
> 
> On 8/22/20 11:35 PM, Jan Kiszka wrote:
>> On 01.06.20 09:04, Vignesh Raghavendra wrote:
>>> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider is 
>>> not yet probed. Currently driver just falls back to using PIO mode 
>>> (which is less efficient) in this case. Instead return probe 
>>> deferral error as is so that driver will be re probed once DMA 
>>> provider is available.
>>>
>>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
> [...]
>>>
>>>  static const struct spi_nor_controller_ops cqspi_controller_ops = { 
>>> @@ -1269,8 +1274,11 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>>  			dev_dbg(nor->dev, "using direct mode for %s\n",
>>>  				mtd->name);
>>>
>>> -			if (!cqspi->rx_chan)
>>> -				cqspi_request_mmap_dma(cqspi);
>>> +			if (!cqspi->rx_chan) {
>>> +				ret = cqspi_request_mmap_dma(cqspi);
>>> +				if (ret == -EPROBE_DEFER)
>>> +					goto err;
>>> +			}
>>>  		}
>>>  	}
>>>
>>>
>>
>> This seem to break reading the SPI flash on our IOT2050 [1] (didn't 
>> test the eval board yet).
>>
>> Without that commit, read happens via PIO, and that works. With the 
>> commit, the pattern
>>
>> with open("out.bin", "wb") as out:
>>     pos = 0
>>     while pos < 2:
>>         with open("/dev/mtd0", "rb") as mtd:
>>            mtd.seek(pos * 0x10000)
>>            out.write(mtd.read(0x10000))
>>         pos += 1
>>
>> gives the wrong result for the second block while
> 
> Interesting... Could you please explain wrong result? Is the data move 
> around or completely garbage?

It looks like some stripes contain data from other parts of the flash or kernel RAM. It's not just garbage, there are readable strings included.

> 
> Does this fail even on AM654 EVM? Could you share full script for me 
> to test locally?

The scripts are complete (python). Just binary-diff the outputs.

I'll try on the EVM later.

> 
> What is the flash on the board?

Le, could you answer that more precisely than I could?

Thanks,
Jan

> 
>>
>> with open("out2.bin", "wb") as out:
>>     with open("/dev/mtd0", "rb") as mtd:
>>         out.write(mtd.read(0x20000))
>>
>> (or "mtd_debug read") is fine.
>>
>> What could be the reason? Our DTBs and k3-am654-base-board.dtb had 
>> some deviations /wrt the ospi node, but aligning ours to the base 
>> board made no difference.
>>
>> Jan
>>
>> [1] https://github.com/siemens/linux/commits/jan/iot2050
>>

--
Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence Center Embedded Linux
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
