Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7751DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 17:21:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4676B20738
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 17:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D5j1Gj35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4676B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=24HROT3ywWmdSEeD7JriOzqXliq0ZODbdsZ1T7ShFNw=; b=D5j1Gj3505zyn6XM2C6YvyZfP
	QUqTTBKpY4LfKyCMOCuvC64n0MwZVL4X6Uy60uTTA7b5+T54Jh7ZubcBrwHXM5/leAgr934Xco0dm
	Yal/O3dmCvdh/82Jv1D981Tzl+Z4EqsVcUiJIV4nI78Mb5C7qV8nrSn+l4mofnbn2snlkcva0PLMd
	FBvtAFhbCmbiG2/lN5DGei6bS7cinSL59RsSWu1NUapHXx2X891G0gCrGosQkOvAA3DIVGdmKsERo
	Nygj7129xwGU+pzF3J4rGWbZlKqLuH9l6uDhOuI61SgY18aqs+QL2E4/mI8zKrSUukO32yXqOeQJD
	z1KlrC+6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAG9g-0006Oy-2T; Mon, 24 Aug 2020 17:21:12 +0000
Received: from gecko.sbs.de ([194.138.37.40])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAG9b-0006Nj-VR
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 17:21:10 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07OHKvn7004875
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 19:20:57 +0200
Received: from [167.87.132.85] ([167.87.132.85])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07OHKpl0013926;
 Mon, 24 Aug 2020 19:20:52 +0200
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, "Jin, Le (RC-CN DF FA R&D)" <le.jin@siemens.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
 <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
 <8cebd31a-2366-4584-b1d1-faa30c18ed6a@ti.com>
 <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
Message-ID: <eff1b49e-e392-8887-b3a0-3caedc5b81cc@siemens.com>
Date: Mon, 24 Aug 2020 19:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dbba9f0c-4621-2d58-8fb8-4cbe788558f9@siemens.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_132108_319680_4838C0CC 
X-CRM114-Status: GOOD (  28.38  )
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

On 24.08.20 14:49, Jan Kiszka wrote:
> On 24.08.20 13:45, Vignesh Raghavendra wrote:
>>
>>
>> On 8/22/20 11:35 PM, Jan Kiszka wrote:
>>> On 01.06.20 09:04, Vignesh Raghavendra wrote:
>>>> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider
>>>> is not yet probed. Currently driver just falls back to using PIO mode
>>>> (which is less efficient) in this case. Instead return probe deferral
>>>> error as is so that driver will be re probed once DMA provider is
>>>> available.
>>>>
>>>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>> ---
>> [...]
>>>>
>>>>  static const struct spi_nor_controller_ops cqspi_controller_ops = {
>>>> @@ -1269,8 +1274,11 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>>>  			dev_dbg(nor->dev, "using direct mode for %s\n",
>>>>  				mtd->name);
>>>>
>>>> -			if (!cqspi->rx_chan)
>>>> -				cqspi_request_mmap_dma(cqspi);
>>>> +			if (!cqspi->rx_chan) {
>>>> +				ret = cqspi_request_mmap_dma(cqspi);
>>>> +				if (ret == -EPROBE_DEFER)
>>>> +					goto err;
>>>> +			}
>>>>  		}
>>>>  	}
>>>>
>>>>
>>>
>>> This seem to break reading the SPI flash on our IOT2050 [1] (didn't test
>>> the eval board yet).
>>>
>>> Without that commit, read happens via PIO, and that works. With the
>>> commit, the pattern
>>>
>>> with open("out.bin", "wb") as out:
>>>     pos = 0
>>>     while pos < 2:
>>>         with open("/dev/mtd0", "rb") as mtd:
>>>            mtd.seek(pos * 0x10000)
>>>            out.write(mtd.read(0x10000))
>>>         pos += 1
>>>
>>> gives the wrong result for the second block while
>>
>> Interesting... Could you please explain wrong result? Is the data move
>> around or completely garbage?
> 
> It looks like some stripes contain data from other parts of the flash or
> kernel RAM. It's not just garbage, there are readable strings included.
> 
>>
>> Does this fail even on AM654 EVM? Could you share full script for me to
>> test locally?
> 
> The scripts are complete (python). Just binary-diff the outputs.
> 
> I'll try on the EVM later.

Done so now, could reproduce.

But the OSPIs are definitely different. EVM reports

spi-nor spi0.0: mt35xu512aba (65536 Kbytes)

with 4K erase size. Our our board, we have

spi-nor spi7.0: w25q128 (16384 Kbytes)

with 64K erase size.

Here is some extract of the hex-diffs between out.bin and out2.bin (the 
latter being the good one):

--- /dev/fd/63  2020-08-24 17:16:58.776409282 +0000
+++ /dev/fd/62  2020-08-24 17:16:58.776409282 +0000
@@ -6,18 +6,18 @@
 00000050  0f 30 0d 06 03 55 04 07  0c 06 44 61 6c 6c 61 73  |.0...U....Dallas|
 00000060  31 27 30 25 06 03 55 04  0a 0c 1e 54 65 78 61 73  |1'0%..U....Texas|
 00000070  20 49 6e 73 74 72 75 6d  65 6e 74 73 20 49 6e 63  | Instruments Inc|
-00000080  84 8b 96 2c 0c 12 18 03  01 05 05 04 01 02 00 00  |...,............|
-00000090  07 06 44 45 20 01 0d 14  2a 01 00 32 05 24 30 48  |..DE ...*..2.$0H|
-000000a0  60 6c 30 14 01 00 00 0f  ac 04 01 00 00 0f ac 04  |`l0.............|
-000000b0  01 00 00 0f ac 02 0c 00  2d 1a 6f 18 17 ff ff ff  |........-.o.....|
+00000080  6f 72 70 6f 72 61 74 65  64 31 13 30 11 06 03 55  |orporated1.0...U|
+00000090  04 0b 0c 0a 50 72 6f 63  65 73 73 6f 72 73 31 13  |....Processors1.|
+000000a0  30 11 06 03 55 04 03 0c  0a 54 49 20 73 75 70 70  |0...U....TI supp|
+000000b0  6f 72 74 31 1d 30 1b 06  09 2a 86 48 86 f7 0d 01  |ort1.0...*.H....|
 000000c0  09 01 16 0e 73 75 70 70  6f 72 74 40 74 69 2e 63  |....support@ti.c|
 000000d0  6f 6d 30 1e 17 0d 32 30  30 37 32 32 31 31 30 30  |om0...2007221100|
 000000e0  30 30 5a 17 0d 32 30 30  38 32 31 31 31 30 30 30  |00Z..20082111000|
 000000f0  30 5a 30 81 9d 31 0b 30  09 06 03 55 04 06 13 02  |0Z0..1.0...U....|
-00000100  00 00 27 a4 00 00 42 43  5e 00 62 32 2f 00 b4 96  |..'...BC^.b2/...|
-00000110  24 44 0c 00 c6 00 43 0a  00 00 0b f0 43 a5 2a 01  |$D....C.....C.*.|
-00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
-*
+00000100  55 53 31 0b 30 09 06 03  55 04 08 0c 02 54 58 31  |US1.0...U....TX1|
+00000110  0f 30 0d 06 03 55 04 07  0c 06 44 61 6c 6c 61 73  |.0...U....Dallas|
+00000120  31 27 30 25 06 03 55 04  0a 0c 1e 54 65 78 61 73  |1'0%..U....Texas|
+00000130  20 49 6e 73 74 72 75 6d  65 6e 74 73 20 49 6e 63  | Instruments Inc|
 00000140  6f 72 70 6f 72 61 74 65  64 31 13 30 11 06 03 55  |orporated1.0...U|
 00000150  04 0b 0c 0a 50 72 6f 63  65 73 73 6f 72 73 31 13  |....Processors1.|
 00000160  30 11 06 03 55 04 03 0c  0a 54 49 20 73 75 70 70  |0...U....TI supp|

[...]

 000017a0  02 8a e5 06 c8 8c e2 14  c2 8a e5 7c 01 00 ea ed  |...........|....|
 000017b0  1f 8f e2 66 02 00 ea 5b  45 72 72 6f 72 5d 20 52  |...f...[Error] R|
-000017c0  69 64 20 55 54 43 20 49  44 21 21 21 0a 00 00 5b  |id UTC ID!!!...[|
-000017d0  45 72 72 6f 72 5d 20 49  6e 76 61 6c 69 64 20 50  |Error] Invalid P|
-000017e0  65 65 72 20 43 68 61 6e  6e 65 6c 20 4e 75 6d 62  |eer Channel Numb|
-000017f0  65 72 21 21 21 0a 00 41  73 73 65 72 74 69 6f 6e  |er!!!..Assertion|
+000017c0  4d 20 41 6c 6c 6f 63 20  54 58 20 43 68 20 66 61  |M Alloc TX Ch fa|
+000017d0  69 6c 65 64 21 21 21 0a  00 00 00 73 72 63 2f 75  |iled!!!....src/u|
+000017e0  64 6d 61 5f 63 68 2e 63  00 00 00 75 74 63 49 6e  |dma_ch.c...utcIn|
+000017f0  66 6f 20 21 3d 20 4e 55  4c 4c 5f 50 54 52 00 75  |fo != NULL_PTR.u|
 00001800  74 63 49 64 20 3c 3d 20  55 44 4d 41 5f 4e 55 4d  |tcId <= UDMA_NUM|
 00001810  5f 55 54 43 5f 49 4e 53  54 41 4e 43 45 00 00 72  |_UTC_INSTANCE..r|

Jan

> 
>>
>> What is the flash on the board?
> 
> Le, could you answer that more precisely than I could?
> 
> Thanks,
> Jan
> 
>>
>>>
>>> with open("out2.bin", "wb") as out:
>>>     with open("/dev/mtd0", "rb") as mtd:
>>>         out.write(mtd.read(0x20000))
>>>
>>> (or "mtd_debug read") is fine.
>>>
>>> What could be the reason? Our DTBs and k3-am654-base-board.dtb had some
>>> deviations /wrt the ospi node, but aligning ours to the base board made
>>> no difference.
>>>
>>> Jan
>>>
>>> [1] https://github.com/siemens/linux/commits/jan/iot2050
>>>
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
