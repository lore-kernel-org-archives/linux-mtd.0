Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B4C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97552078D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/dFu6VN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97552078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MkwtgoZ/HcbDcegBcpimo3MgoXPNHkaEUN2FPyPDFaE=; b=G/dFu6VNyI4ZVFrJPWqEHmS7p
	e0xIrNXysjGjASH3n1lZLg9xzr57ypgdekk2bAs3FLwf1/oszfs69qvuF1hd1gAWpu76voaG661RP
	3pDQt++/4KqEWoyShkFo+YH/7VJ6JbBj1yThQgtIC0z/TGWuSlk1mqQMEMory2yjoNhRtWrWRHPYS
	vjwKIUshqTd5xdpA0Woj97uOPwnrcZTm3JRBmYqbj+4388mKJHGizOGPfQA4vcAv4mG2WMnlx1FrQ
	midv/PMMDc81oXqMFe8c75kScAg8MvIuGyiZ8Qg/jBm9Q4fh4fFj/v/ywKCEceBfZErYhwduFcVRr
	pps/3rGZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kABux-00052r-9m; Mon, 24 Aug 2020 12:49:43 +0000
Received: from goliath.siemens.de ([192.35.17.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kABut-00052F-Ss
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 12:49:41 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07OCnNt2009655
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 14:49:24 +0200
Received: from [167.87.131.75] ([167.87.131.75])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07OCnIUn004790;
 Mon, 24 Aug 2020 14:49:20 +0200
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, "Jin, Le (RC-CN DF FA R&D)" <le.jin@siemens.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
 <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
 <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
Date: Mon, 24 Aug 2020 14:49:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_084940_213350_410C08D0 
X-CRM114-Status: GOOD (  21.54  )
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

On 24.08.20 13:45, Vignesh Raghavendra wrote:
> 
> 
> On 8/22/20 11:35 PM, Jan Kiszka wrote:
>> On 01.06.20 09:04, Vignesh Raghavendra wrote:
>>> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider
>>> is not yet probed. Currently driver just falls back to using PIO mode
>>> (which is less efficient) in this case. Instead return probe deferral
>>> error as is so that driver will be re probed once DMA provider is
>>> available.
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
>> This seem to break reading the SPI flash on our IOT2050 [1] (didn't test
>> the eval board yet).
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

It looks like some stripes contain data from other parts of the flash or
kernel RAM. It's not just garbage, there are readable strings included.

> 
> Does this fail even on AM654 EVM? Could you share full script for me to
> test locally?

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
>> What could be the reason? Our DTBs and k3-am654-base-board.dtb had some
>> deviations /wrt the ospi node, but aligning ours to the base board made
>> no difference.
>>
>> Jan
>>
>> [1] https://github.com/siemens/linux/commits/jan/iot2050
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
