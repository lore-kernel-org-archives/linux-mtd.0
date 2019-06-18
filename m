Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA63AC31E51
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 07:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7823820823
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 07:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2Vk7P8z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mXZmfTww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7823820823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8MzEk/A0AkGJxBd+mrJUV8GJ/8RjWJkfOuebJ4TNUk=; b=P2Vk7P8z1p8IgQ
	PfeNzHTnTSwkWT/QRmo0uWUC/2eCGJJ1nWmjwP1cceyxOaqrlEjl7dbqG/4vE39/6F6iznteDZ5FF
	xGQn1PKaWCOUlYDZa7MAUjB99Rdczw0VW7joERnIA7pvrF4L8LHeRNtBepwY5SJadpDERlubbDk/N
	kIMVta/yfvjz72RLPbXKvPaZ1dWajBA/vKa08HhIXB7nvPsnJFU/FJpXKa2d+qGXyZRdX74RldLgh
	Jv8subZwOh0+wAA7yRGbC48Q8CBn0w/UWvSA4TewrXgTxBWbltG7EOCxZxvY18jkLs4/tfBhhbHVh
	yuatjdHm0UrMmVprJUhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd8gu-0000IT-Jk; Tue, 18 Jun 2019 07:38:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd8gr-0000Hi-6a; Tue, 18 Jun 2019 07:38:03 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5I7bf3L051003;
 Tue, 18 Jun 2019 02:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560843461;
 bh=4bfEc87X2lfeLbz5EXurKhL9OniFY8iKEuWeIQ7XcOA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mXZmfTww9Gi7bddiTlC/pqFabddbRDzMz/A+AtPdQX5elNaK55cvlZH+Nm32284Jd
 Fi/6QuG9Cut0o9OGtay5awonlySP2tfXSnBr999qNeE6tZgobyxokWLyKfq1hRa0eQ
 hkBcHZxNPaC7QD4HAt1xDJsoPycSbs6N3wNLqdlo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5I7bfHu037012
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2019 02:37:41 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 18
 Jun 2019 02:37:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 18 Jun 2019 02:37:40 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5I7barM105813;
 Tue, 18 Jun 2019 02:37:37 -0500
Subject: Re: [PATCH v5 3/5] mtd: Add support for HyperBus memory devices
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
References: <20190609103227.24875-1-vigneshr@ti.com>
 <20190609103227.24875-4-vigneshr@ti.com>
 <58e9608d-35ff-0436-6075-b2e4ed4b8594@cogentembedded.com>
 <f47d4d57-afb2-3b39-fae9-3ed740a2b8a6@ti.com>
 <9dbd8132-ce8f-9ce7-ddf5-d9826e2a1be1@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b1df7b11-15d3-e707-c1d4-ab69741e52f4@ti.com>
Date: Tue, 18 Jun 2019 13:08:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9dbd8132-ce8f-9ce7-ddf5-d9826e2a1be1@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190618_003801_376822_05FF7AA5 
X-CRM114-Status: GOOD (  30.84  )
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
Cc: devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 18/06/19 1:15 AM, Sergei Shtylyov wrote:
> Hello!
> 
> On 06/11/2019 02:57 PM, Vignesh Raghavendra wrote:
> 
>>>> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
>>>> Bus interface between a host system master and one or more slave
>>>> interfaces. HyperBus is used to connect microprocessor, microcontroller,
>>>> or ASIC devices with random access NOR flash memory (called HyperFlash)
>>>> or self refresh DRAM (called HyperRAM).
>>>>
>>>> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
>>>> signal and either Single-ended clock(3.0V parts) or Differential clock
>>>> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
>>>> At bus level, it follows a separate protocol described in HyperBus
>>>> specification[1].
>>>>
>>>> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
>>>> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
>>>> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
>>>> HyperBus operates at >166MHz frequencies.
>>>> HyperRAM provides direct random read/write access to flash memory
>>>> array.
>>>>
>>>> But, HyperBus memory controllers seem to abstract implementation details
>>>> and expose a simple MMIO interface to access connected flash.
>>>>
>>>> Add support for registering HyperFlash devices with MTD framework. MTD
>>>> maps framework along with CFI chip support framework are used to support
>>>> communicating with flash.
>>>>
>>>> Framework is modelled along the lines of spi-nor framework. HyperBus
>>>> memory controller (HBMC) drivers calls hyperbus_register_device() to
>>>> register a single HyperFlash device. HyperFlash core parses MMIO access
>>>> information from DT, sets up the map_info struct, probes CFI flash and
>>>> registers it with MTD framework.
>>>>
>>>> Some HBMC masters need calibration/training sequence[3] to be carried
>>>> out, in order for DLL inside the controller to lock, by reading a known
>>>> string/pattern. This is done by repeatedly reading CFI Query
>>>> Identification String. Calibration needs to be done before trying to detect
>>>> flash as part of CFI flash probe.
>>>>
>>>> HyperRAM is not supported at the moment.
>>>>
>>>> HyperBus specification can be found at[1]
>>>> HyperFlash datasheet can be found at[2]
>>>>
>>>> [1] https://www.cypress.com/file/213356/download
>>>> [2] https://www.cypress.com/file/213346/download
>>>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>>>     Table 12-5741. HyperFlash Access Sequence
>>>>
>>>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>>> [...]
>>>> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
>>>> new file mode 100644
>>>> index 000000000000..df1f75e10b1a
>>>> --- /dev/null
>>>> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
>>>> @@ -0,0 +1,191 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +//
>>>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>>>> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
>>>> +
>>>> +#include <linux/err.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mtd/hyperbus.h>
>>>> +#include <linux/mtd/map.h>
>>>> +#include <linux/mtd/mtd.h>
>>>> +#include <linux/mtd/cfi.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_address.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +#define HYPERBUS_CALIB_COUNT 25
>>>
>>>    Mhm, I think I've already protested about this being #define'd here...
>>
>> I thought you had agreed that default optional calibration routine can
>> be part of core code and thus this #define.
>>
>> Anyways, what is your preference here? Drop the constant and use a local
>> variable in hyperbus_calibrate()?
>> Or are you suggesting to move hyperbus_calibrate() TI's specific driver?
> 
>    I'm just not comfortable with the common HF code using quite an arbitrary
> constant...
> 

Ok, I will move the code over to TI driver. We can always bring it back
to core code if more drivers need it.

>>> [...]
>>>> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
>>>> new file mode 100644
>>>> index 000000000000..ee2eefd822c9
>>>> --- /dev/null
>>>> +++ b/include/linux/mtd/hyperbus.h
>>>> @@ -0,0 +1,91 @@
> [...]
>>>> + * @mtd: pointer to MTD struct
>>>> + * @ctlr: pointer to HyperBus controller struct
>>>> + * @memtype: type of memory device: HyperFlash or HyperRAM
>>>> + * @registered: flag to indicate whether device is registered with MTD core
>>>> + */
>>>> +
>>>> +struct hyperbus_device {
>>>> +	struct map_info map;
>>>> +	struct device_node *np;
>>>> +	struct mtd_info *mtd;
>>>> +	struct hyperbus_ctlr *ctlr;
>>>> +	enum hyperbus_memtype memtype;
>>>> +	bool registered;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct hyperbus_ops - struct representing custom HyperBus operations
>>>> + * @read16: read 16 bit of data, usually from register/ID-CFI space
>>>> + * @write16: write 16 bit of data, usually to register/ID-CFI space
>>>
>>>    Usually? How to differ the register/memory transfers if both are possible?
> 
>> CFI + map framework does not provide a way to differentiate b/w reg
>> access vs memory access. read16()/write16() is used to either access
>> registers or for sending various cmds like lock/unlock etc or for
>> programming a single word.
>> For regular read/writes copy_from() and copy_to() are used.
> 
>    In my case only copy_from() would exist -- no proper acceleration for
> writes...
> 

Actually copy_to() is not used by cfi_cmdset_0002.c, its always
write16() that used to program flash.
This is something I want to extend support to, so as to use DMA for
writes as well because I see that writes seem extremely slow at least on
my platform.

>> Looking at HyperBus protocol, controllers would not need to
>> differentiate b/w registers vs memory transfers for HyperFlash devices.
>> So, I think I can drop read16/write16 and redirect these calls to
>> copy_from()/copy_to()
> 
>    Doubt it, frankly speaking.

Sorry for confusion, as I said above, we do need to keep write16().
Also, copy_to maps to memcpy_toio in case of simple_map which may not
use 16 bit IO accessors. So write16() cannot be mapped to copy_to()

So we need at least write16(), copy_from() and mostly copy_to() (for
accelerating writes). So, lets keep this simple and have all map ops
including read16() as is.


> 
>> I mainly added these functions keeping HyperRAM in mind. Idea was
>> drivers would look at hyperbus_device->memtype and set to register
>> access mode for HyperRAM in case of write16()/read16(). Looks like the
>> interface is not intuitive enough
>> So, will drop these and add it back when adding HyperRAM support.
>>
>> Does that work for your HW as well?
> 
>    Don't think so...
> 
>    However, my HyperFlash driver could make use of the following #define's in
> the HyperBus header:
> 
> #define HF_CMD_CA47		BIT(7)	/* Read */
> #define HF_CMD_CA46		BIT(6)	/* Register space */
> #define HF_CMD_CA45		BIT(5)	/* Linear burst */
> 
> #define HF_CMD_READ_REG		(HF_CMD_CA47 | HF_CMD_CA46)

This will come into play for HyperRAM, not a care about for HyperFlash

> #define HF_CMD_READ_MEM		HF_CMD_CA47

For HyperFlash, this would be the only bit that needs to be set for read
along with HF_CMD_CA45 for linear burst.

> #define HF_CMD_WRITE_REG	HF_CMD_CA46
> #define HF_CMD_WRITE_MEM	0
> 
> MBR, Sergei
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
