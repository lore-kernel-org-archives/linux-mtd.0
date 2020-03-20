Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A283BC4332D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 17:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771BB20709
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 17:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqMlrZmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771BB20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GSy9tT8prVdhY0XprfKes5ziT6sdPNkDL5ZnnPQwD0=; b=JqMlrZmiB6e5Ht
	Grn1kfaoDV2tCXisFkM3fbSK289NdDHxSfjrB+8yEPnKHgJr18RnTke43/IJi5oWyOiDaZuPvmUsM
	9UUzXekUSQAE5n9HscPqdBlLvQwIJPJ3m4oAEOmFM1JGIsEDHfCUQXxPUQERIMsWbJw1/w/xFquEW
	bVurcDOAjRKv7sMRjmsTEs9Fogdbqs1uCHGatFPEQa1BjDce4Bfxl9lJ+6AbjTh1XQwd6ScdXKwxH
	82EptopiwJlZOz3sqQf571nBKPRdNLL2V5uG9FOjrYGYQb5M8NxzL4nTpYvaju6QQAh5BCMHcZt26
	X84ibHIR89KWBcLYGymg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFLEg-0005j1-9f; Fri, 20 Mar 2020 17:15:06 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFLEc-0004yf-3f
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 17:15:04 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48kVl40Ggxz1qrfN;
 Fri, 20 Mar 2020 18:14:55 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48kVl365vBz1qrbg;
 Fri, 20 Mar 2020 18:14:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id VjzbTi-s-X4U; Fri, 20 Mar 2020 18:14:54 +0100 (CET)
X-Auth-Info: gttYc16SEC5d8uweW5kSjOieA30mQYvZH0Lr9j4MciM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 20 Mar 2020 18:14:54 +0100 (CET)
Subject: Re: [PATCH] mtd: rawnand: denali: add more delays before latching
 incoming data
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20200316104307.1891-1-yamada.masahiro@socionext.com>
 <20200320181159.5004099f@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <2d02c851-4249-053c-99e9-69b209bffad2@denx.de>
Date: Fri, 20 Mar 2020 18:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320181159.5004099f@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_101502_457875_828CEBCE 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/20/20 6:11 PM, Miquel Raynal wrote:
> Hi Marek,
> 
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Mon, 16 Mar
> 2020 19:43:07 +0900:
> 
>> The Denali IP have several registers to specify how many clock cycles
>> should be waited between falling/rising signals. You can improve the
>> NAND access performance by programming these registers with optimized
>> values.
>>
>> Because struct nand_sdr_timings represents the device requirement
>> in pico seconds, denali_setup_data_interface() computes the register
>> values by dividing the device timings with the clock period.
>>
>> Marek Vasut reported this driver in the latest kernel does not work
>> on his SOCFPGA board. (The on-board NAND chip is mode 5)
>>
>> The suspicious parameter is acc_clks, so this commit relaxes it.
>>
>> The Denali NAND Flash Memory Controller User's Guide describes this
>> register as follows:
>>
>>   acc_clks
>>     signifies the number of bus interface clk_x clock cycles,
>>     controller should wait from read enable going low to sending
>>     out a strobe of clk_x for capturing of incoming data.
>>
>> Currently, acc_clks is calculated only based on tREA, the delay on the
>> chip side. This does not include additional delays that come from the
>> data path on the PCB and in the SoC, load capacity of the pins, etc.
>>
>> This relatively becomes a big factor on faster timing modes like mode 5.
>>
>> Before supporting the ->setup_data_interface() hook (e.g. Linux 4.12),
>> the Denali driver hacks acc_clks in a couple of ways [1] [2] to support
>> the timing mode 5.
>>
>> We would not go back to the hard-coded acc_clks, but we need to include
>> this factor into the delay somehow. Let's say the amount of the additional
>> delay is 10000 pico sec.
>>
>> In the new calculation, acc_clks is determined by timings->tREA_max +
>> data_setup_on_host.
>>
>> Also, prolong the RE# low period to make sure the data hold is met.
>>
>> Finally, re-center the data latch timing for extra safety.
>>
>> [1] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L276
>> [2] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L282
>>
>> Reported-by: Marek Vasut <marex@denx.de>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
> 
> Can you please give this patch a try and report the result?

It's on my list, don't worry.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
