Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdzRf-0004nn-Dv
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 10:35:12 +0000
Message-ID: <543CFC41.2060506@atmel.com>
Date: Tue, 14 Oct 2014 18:34:41 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
 <20141013111611.GC15326@leverpostej> <543BB7FE.3030604@atmel.com>
In-Reply-To: <543BB7FE.3030604@atmel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "voice.shen@atmel.com" <voice.shen@atmel.com>,
 "galak@codeaurora.org" <galak@codeaurora.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Mark

On 10/13/2014 7:31 PM, Josh Wu wrote:
> Hi, Mark
>
> On 10/13/2014 7:16 PM, Mark Rutland wrote:
>> On Sat, Oct 11, 2014 at 11:01:50AM +0100, Josh Wu wrote:
>>> From: Josh Wu <Josh.wu@atmel.com>
>>>
>>> If there is no PMECC lookup table stored in ROM, or lookup table 
>>> offset is
>>> not specified, PMECC driver should build it in DDR by itself.
>>>
>>> That make the PMECC driver work for some board which doesn't has PMECC
>>> lookup table in ROM.
>>>
>>> The PMECC use the BCH algorithm, so based on the build_gf_tables()
>>> function in lib/bch.c, we can build the Galois Field lookup table.
>>>
>>> For more information can refer to section 5.4 of PMECC controller
>>> application note:
>>>     http://www.atmel.com/images/doc11127.pdf
>>>
>>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>>> Cc: devicetree@vger.kernel.org
>>> ---
>>> v1 -> v2:
>>>    make create_lookup_table() static.
>>>
>>> v2 -> v3:
>>>    rewrite the build_gf_tables() function based on lib/bch.c.
>>>    add error handling in create_lookup_table().
>>>
>>>   .../devicetree/bindings/mtd/atmel-nand.txt         |  6 +-
>>>   drivers/mtd/nand/atmel_nand.c                      | 81 
>>> ++++++++++++++++++++--
>>>   drivers/mtd/nand/atmel_nand_ecc.h                  |  4 ++
>>>   3 files changed, 85 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt 
>>> b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> index 6edc3b6..1fe6dde 100644
>>> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> @@ -5,7 +5,9 @@ Required properties:
>>>   - reg : should specify localbus address and size used for the chip,
>>>       and hardware ECC controller if available.
>>>       If the hardware ECC is PMECC, it should contain address and 
>>> size for
>>> -    PMECC, PMECC Error Location controller and ROM which has lookup 
>>> tables.
>>> +    PMECC and PMECC Error Location controller.
>>> +    The PMECC lookup table address and size in ROM is optional. If not
>>> +    specified, driver will build it in runtime.
>>>   - atmel,nand-addr-offset : offset for the address latch.
>>>   - atmel,nand-cmd-offset : offset for the command latch.
>>>   - #address-cells, #size-cells : Must be present if the device has 
>>> sub-nodes
>>> @@ -27,7 +29,7 @@ Optional properties:
>>>     are: 512, 1024.
>>>   - atmel,pmecc-lookup-table-offset : includes two offsets of lookup 
>>> table in ROM
>>>     for different sector size. First one is for sector size 512, the 
>>> next is for
>>> -  sector size 1024.
>>> +  sector size 1024. If not specified, driver will build the table 
>>> in runtime.
>> I'm not sure we need to mention this in the binding.
>>
>> That said, if we can build this dynamically, can't we always do so, and
>> never need this property?
>
> Since board like at91sam9x5, sama5d3xek has a rom lookup table. And 
> the sama5d4ek has no rom lookup table.
> To present this, I make this property as optional.
>
> But yes, the pmecc lookup table related properties can be removed as 
> driver can build it in runtime.
> The cost is we need to use more memory to store the table.

In precisely, the table need to 32k bytes memory for 512-sector, and 64k 
bytes for 1024-sector.

Also I spend time to testing the performance of this version.
Compare with the version which use the SRAM rom lookup table, this 
version (build table in runtim) cost about 5~10ms more.

So I prefer to keep this property as optional.

Best Regards,
Josh Wu

>
>
>>
>> Mark.
> Best Regards,
> Josh Wu
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
