Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctoj5-0004Gg-3r
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 05:03:56 +0000
Received: by mail-lf0-x242.google.com with SMTP id v2so6283045lfi.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 22:03:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: mtd: document linux,part-probe property
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170330215332.32699-2-zajec5@gmail.com>
 <74e3a663-2431-9b86-9d90-7f2fe6ce900f@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <fb06a470-4d4d-e6b2-7ebf-1c4219665e78@gmail.com>
Date: Fri, 31 Mar 2017 07:03:28 +0200
MIME-Version: 1.0
In-Reply-To: <74e3a663-2431-9b86-9d90-7f2fe6ce900f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/31/2017 01:26 AM, Marek Vasut wrote:
> On 03/30/2017 11:53 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Support for this property has been introduced in 2010 with commit
>> 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
>> parition probe") but it was never documented. Fix this by adding a
>> proper description and example.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>  Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
>> index fc068b923d7a..1ada70e718b2 100644
>> --- a/Documentation/devicetree/bindings/mtd/common.txt
>> +++ b/Documentation/devicetree/bindings/mtd/common.txt
>> @@ -6,10 +6,17 @@ Optional properties:
>>    controller based name) in order to ease flash device identification
>>    and/or describe what they are used for.
>>
>> +- linux,part-probe: if present, this property should contain a list of strings
>> +  with partition probes to be used for the flash device. A role of partition
>> +  probe (parser) is to read/construct partition table and register found
>> +  partitions. Getting partition table may be platform or device specific so
>> +  various devices may use various Linux drivers for this purpose.
>
> Why don't you just have partition not within partition node ? Then you
> won't need this nonsense ...

Can you stop this negative approach ("nonsense") for every single f* thing I
submit? It doesn't help and makes people not want to work with upstream mtd.

The only partitioner with support for partitions node is "fixed-partitions".
Take a look at original linux,part-probe usage:
arch/arm64/boot/dts/arm/juno-motherboard.dtsi
It's used to specify "afs" partitioner. It's dynamic. You can't replace it with
fixed partitions.

So this property is needed to specify platform/device specific partitioner that
should be used with some standard flash driver (like physmap_of or m25p80).

I was hoping following part of documentation makes is clear:
 > Getting partition table may be platform or device specific so
 > various devices may use various Linux drivers for this purpose.
