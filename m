Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae0Y3-0005Tf-O7
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 13:22:40 +0000
From: "Franklin S Cooper Jr." <fcooper@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: <nsekhar@ti.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <tony@atomide.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] ARM: dts: am437x/am33xx: Fix GPMC dma properties
References: <1457582861-20619-1-git-send-email-fcooper@ti.com>
 <1457582861-20619-3-git-send-email-fcooper@ti.com> <56E16DBF.40409@ti.com>
Message-ID: <56E174ED.30204@ti.com>
Date: Thu, 10 Mar 2016 07:21:49 -0600
MIME-Version: 1.0
In-Reply-To: <56E16DBF.40409@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/10/2016 06:51 AM, Roger Quadros wrote:
> On 10/03/16 06:07, Franklin S Cooper Jr wrote:
>> Recent patch series that updated the eDMA driver also updated the eDMA
>> bindings.
>>
>> The following patches forgot to update the DMA bindings for the GPMC node.
>> ARM: DTS: am33xx: Use the new DT bindings for the eDMA3
>> ARM: DTS: am437x: Use the new DT bindings for the eDMA3
> Instead of mentioning the patch subject here use the Fixes: tag.

Ok.
>
>> This patch corrects this so NAND with DMA prefetch can work.
>>
>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> Please split this patch in to am33xx.dtsi and am4372.dtsi

Ok
>
>> ---
>>  arch/arm/boot/dts/am33xx.dtsi | 2 +-
>>  arch/arm/boot/dts/am4372.dtsi | 2 +-
> what about dm816x.dtsi and dm814x.dtsi?
>
> I suppose sdma based SoCs are not affected like this right?

Correct. The updated driver was only eDMA. So sDMA bindings
have not been changed.
>
> cheers,
> -roger
>
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
>> index 1fafaad..97471d6 100644
>> --- a/arch/arm/boot/dts/am33xx.dtsi
>> +++ b/arch/arm/boot/dts/am33xx.dtsi
>> @@ -860,7 +860,7 @@
>>  			ti,no-idle-on-init;
>>  			reg = <0x50000000 0x2000>;
>>  			interrupts = <100>;
>> -			dmas = <&edma 52>;
>> +			dmas = <&edma 52 0>;
>>  			dma-names = "rxtx";
>>  			gpmc,num-cs = <7>;
>>  			gpmc,num-waitpins = <2>;
>> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
>> index 92068fb..2878b04 100644
>> --- a/arch/arm/boot/dts/am4372.dtsi
>> +++ b/arch/arm/boot/dts/am4372.dtsi
>> @@ -884,7 +884,7 @@
>>  		gpmc: gpmc@50000000 {
>>  			compatible = "ti,am3352-gpmc";
>>  			ti,hwmods = "gpmc";
>> -			dmas = <&edma 52>;
>> +			dmas = <&edma 52 0>;
>>  			dma-names = "rxtx";
>>  			clocks = <&l3s_gclk>;
>>  			clock-names = "fck";
>>
