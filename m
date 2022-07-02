Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F50C43334
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShedkEPzafr/OLc01PWJM6nTFmkZP0dklvunYZCqFUU=; b=v+cNb13HI6YoLb
	ARRw8gZVb9xuhEeK3j9upteJmJLrHkfuOOMuaVO8BuclQ1ApQMgX9WGQmQprtj4kWqPQ3+ho9/J12
	q78TXRF/ClKjGS8XXRNYhrr7IoQnZvFOiUD2YPv0AN2MH308RlgNi1JvCyDy3RJg2eCu6aQj4byAe
	3EeXfr9jjOveQgzheWdkFU29/HZ67DMZuQ5bxpoWyryti1pReosBnG+cjRzCc8CYqRFlkvsV028M6
	hOpzP/5RnEfVGe/BqZbg9hz4ELj3SLRyTSTa2mwJPTRhdJvtatJS9Udp4S5EKbveaG6rmUZ2JFFFd
	cNULDjsj2UzgP5cMREdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7geG-00AbKh-MK; Sat, 02 Jul 2022 17:11:12 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7ge3-00AbIC-6L; Sat, 02 Jul 2022 17:11:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 262HAcAU130419;
	Sat, 2 Jul 2022 12:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656781838;
	bh=1Q76WF7U3Bp00wTKSfteyk6bKtIsR9IszG3O/zUcWkU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sGuKCwF4BKmlacmXTEAgWCBr/A7iCxjr6QPfJ6rbgJWXeYqh6A9vnQzft4NUMjYeT
	 hHW4JFXQPOCVuz53d+oD3ToYpS6uu48y1XvbnV9kG9WOz++1edkHJ7uc6ULRjLqaXR
	 ELePHXEOfPtZjCdnbGAOptFkq/RdzIJQDsj+GqXc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 262HAcPk075676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 2 Jul 2022 12:10:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 2
 Jul 2022 12:10:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 2 Jul 2022 12:10:38 -0500
Received: from [10.250.234.35] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 262HAWSD004188;
	Sat, 2 Jul 2022 12:10:33 -0500
Message-ID: <75fee78a-f411-1c7e-a902-d28d02703c16@ti.com>
Date: Sat, 2 Jul 2022 22:40:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Boris Brezillon <bbrezillon@kernel.org>,
        Marek Vasut
	<marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>, Rob Herring
	<robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>,
        Sergei Shtylyov
	<sergei.shtylyov@cogentembedded.com>,
        Tokunori Ikegami <ikegami.t@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MTD Maling List
	<linux-mtd@lists.infradead.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Linux ARM
	<linux-arm-kernel@lists.infradead.org>
References: <20190625075746.10439-1-vigneshr@ti.com>
 <20190625075746.10439-4-vigneshr@ti.com>
 <CAMuHMdUCdjfAoZm-cb4v+STt5C0T6OejdcCCQNBRqqAHL6JD=w@mail.gmail.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <CAMuHMdUCdjfAoZm-cb4v+STt5C0T6OejdcCCQNBRqqAHL6JD=w@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_101059_453939_C7C8C8F0 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Geert,

On 6/27/2022 8:58 PM, Geert Uytterhoeven wrote:
> Hi Vignesh,
> 
> On Tue, Jun 25, 2019 at 10:00 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
>> Bus interface between a host system master and one or more slave
>> interfaces. HyperBus is used to connect microprocessor, microcontroller,
>> or ASIC devices with random access NOR flash memory (called HyperFlash)
>> or self refresh DRAM (called HyperRAM).
>>
>> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
>> signal and either Single-ended clock(3.0V parts) or Differential clock
>> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
>> At bus level, it follows a separate protocol described in HyperBus
>> specification[1].
>>
>> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
>> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
>> its equivalent to x16 parallel NOR flash with respect to bits per clock
>> cycle. But HyperBus operates at >166MHz frequencies.
>> HyperRAM provides direct random read/write access to flash memory
>> array.
>>
>> But, HyperBus memory controllers seem to abstract implementation details
>> and expose a simple MMIO interface to access connected flash.
>>
>> Add support for registering HyperFlash devices with MTD framework. MTD
>> maps framework along with CFI chip support framework are used to support
>> communicating with flash.
>>
>> Framework is modelled along the lines of spi-nor framework. HyperBus
>> memory controller (HBMC) drivers calls hyperbus_register_device() to
>> register a single HyperFlash device. HyperFlash core parses MMIO access
>> information from DT, sets up the map_info struct, probes CFI flash and
>> registers it with MTD framework.
>>
>> Some HBMC masters need calibration/training sequence[3] to be carried
>> out, in order for DLL inside the controller to lock, by reading a known
>> string/pattern. This is done by repeatedly reading CFI Query
>> Identification String. Calibration needs to be done before trying to detect
>> flash as part of CFI flash probe.
>>
>> HyperRAM is not supported at the moment.
> 
> Thanks for your patch, which is now commit dcc7d3446a0fa19b ("mtd:
> Add support for HyperBus memory devices") in v5.3.
> 
>> HyperBus specification can be found at[1]
>> HyperFlash datasheet can be found at[2]
>>
>> [1] https://www.cypress.com/file/213356/download
>> [2] https://www.cypress.com/file/213346/download
>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>     Table 12-5741. HyperFlash Access Sequence
> 
> The last link no longer works.  Do you have a replacement?

Looks like I used a link point to specific version instead of top level
redirector link. Please use:

https://www.ti.com/lit/pdf/spruid7

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
