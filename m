Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7DFC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 11:46:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BCB206BE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 11:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yqxfG1DG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KhgJl73n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BCB206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VGib3V83/xvxwChP54HT75K9Lq9CjmpQa3ZaFGYUWJA=; b=yqxfG1DGFjiiVKjgDpfOG6gm/
	PE6SyF7+zWVArTfObLrcsW5IsDueEelm7eOSQUydiHIvR0IAzq5uZ0ph2GOvZbnIHNLk6cF8KhIJ3
	UZTQsfWMWZg+NuQ8lTQTlEtSrp1mcchENRsetbYJsTSrSpuR5OVvF7oQQx1jMsSGzL16DK0E0iPuE
	DWwZsUGFFEpFKqcoekHWfc3wlUdmE4z+SKsnbbn7C9OLP4RRWeBJ1/uO+DowSdJEgRCpP+IqG7i/R
	ehjlizTFht8ncg7Q+doX1iDYEmEWYopZgkpmobWp+6081+o7KfKEYz2Pi9ieSkWbPlRiSrvjLN/ix
	OpdtkztoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAAuc-0002id-Rw; Mon, 24 Aug 2020 11:45:18 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAAuZ-0002gb-NN
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 11:45:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OBj8To046466;
 Mon, 24 Aug 2020 06:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598269508;
 bh=ylz2yEP7MNmFHxlW15UvscwqbJnFF/9ciAx038v5df0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KhgJl73nvKfP0FUEZHVllgKaMVUa28jQXsIQhjiSMskfHwuFbIUjBdELvE0/chWKv
 0GvfctxAIt8BuiaykVbNakghsJIdpFvQb7EcE+bQHHKg/CxCeR0CMbDiA6pmjH2My3
 3qa+i3KMBqk8p+m6q+i/0j5XbLgiwradbP4HAYPA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OBj8mn126368;
 Mon, 24 Aug 2020 06:45:08 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 06:45:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 06:45:08 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OBj4ck089288;
 Mon, 24 Aug 2020 06:45:04 -0500
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
To: Jan Kiszka <jan.kiszka@web.de>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
 <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
Date: Mon, 24 Aug 2020 17:15:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_074515_906841_FF88F3F6 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: marex@denx.de, Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 8/22/20 11:35 PM, Jan Kiszka wrote:
> On 01.06.20 09:04, Vignesh Raghavendra wrote:
>> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider
>> is not yet probed. Currently driver just falls back to using PIO mode
>> (which is less efficient) in this case. Instead return probe deferral
>> error as is so that driver will be re probed once DMA provider is
>> available.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
[...]
>>
>>  static const struct spi_nor_controller_ops cqspi_controller_ops = {
>> @@ -1269,8 +1274,11 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>  			dev_dbg(nor->dev, "using direct mode for %s\n",
>>  				mtd->name);
>>
>> -			if (!cqspi->rx_chan)
>> -				cqspi_request_mmap_dma(cqspi);
>> +			if (!cqspi->rx_chan) {
>> +				ret = cqspi_request_mmap_dma(cqspi);
>> +				if (ret == -EPROBE_DEFER)
>> +					goto err;
>> +			}
>>  		}
>>  	}
>>
>>
> 
> This seem to break reading the SPI flash on our IOT2050 [1] (didn't test
> the eval board yet).
> 
> Without that commit, read happens via PIO, and that works. With the
> commit, the pattern
> 
> with open("out.bin", "wb") as out:
>     pos = 0
>     while pos < 2:
>         with open("/dev/mtd0", "rb") as mtd:
>            mtd.seek(pos * 0x10000)
>            out.write(mtd.read(0x10000))
>         pos += 1
> 
> gives the wrong result for the second block while

Interesting... Could you please explain wrong result? Is the data move
around or completely garbage?

Does this fail even on AM654 EVM? Could you share full script for me to
test locally?

What is the flash on the board?

> 
> with open("out2.bin", "wb") as out:
>     with open("/dev/mtd0", "rb") as mtd:
>         out.write(mtd.read(0x20000))
> 
> (or "mtd_debug read") is fine.
> 
> What could be the reason? Our DTBs and k3-am654-base-board.dtb had some
> deviations /wrt the ospi node, but aligning ours to the base board made
> no difference.
> 
> Jan
> 
> [1] https://github.com/siemens/linux/commits/jan/iot2050
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
