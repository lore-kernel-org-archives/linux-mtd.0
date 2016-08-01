Subject: Re: [PATCH 1/2] ARM: dts: am335x: Update elm phandle binding
To: Brian Norris <computersforpeace@gmail.com>, Teresa Remmet
 <t.remmet@phytec.de>, Tony Lindgren <tony@atomide.com>
References: <1467711150-23356-1-git-send-email-t.remmet@phytec.de>
 <20160713171407.GB136972@google.com>
CC: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <9354c50f-f851-f473-a8af-0a84c951453e@ti.com>
Date: Mon, 1 Aug 2016 12:25:09 +0300
MIME-Version: 1.0
In-Reply-To: <20160713171407.GB136972@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/07/16 20:14, Brian Norris wrote:
> On Tue, Jul 05, 2016 at 11:32:29AM +0200, Teresa Remmet wrote:
>> The check for the "elm_id" binding had been removed.
>> This causes nand boot to fail on boards still using
>> the old binding. Update the bindings on those boards.
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> We're fixing the backward compatibility issue anyway, but might as well
> "upgrade" the device tree.
> 
>> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>

Acked-by: Roger Quadros <rogerq@ti.com>

Tony,

Please take this one via your OMAP DT tree. Thanks.

cheers,
-roger

>> ---
>>  arch/arm/boot/dts/am335x-baltos.dtsi      | 2 +-
>>  arch/arm/boot/dts/am335x-igep0033.dtsi    | 2 +-
>>  arch/arm/boot/dts/am335x-phycore-som.dtsi | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
>> index c8609d8..b689172 100644
>> --- a/arch/arm/boot/dts/am335x-baltos.dtsi
>> +++ b/arch/arm/boot/dts/am335x-baltos.dtsi
>> @@ -226,7 +226,7 @@
>>  
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> -		elm_id = <&elm>;
>> +		ti,elm-id = <&elm>;
>>  	};
>>  };
>>  
>> diff --git a/arch/arm/boot/dts/am335x-igep0033.dtsi b/arch/arm/boot/dts/am335x-igep0033.dtsi
>> index df63484..e7d9ca1 100644
>> --- a/arch/arm/boot/dts/am335x-igep0033.dtsi
>> +++ b/arch/arm/boot/dts/am335x-igep0033.dtsi
>> @@ -161,7 +161,7 @@
>>  
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> -		elm_id = <&elm>;
>> +		ti,elm-id = <&elm>;
>>  
>>  		/* MTD partition table */
>>  		partition@0 {
>> diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
>> index 86f7731..1263c9d 100644
>> --- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
>> +++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
>> @@ -197,7 +197,7 @@
>>  		gpmc,wr-access-ns = <30>;
>>  		gpmc,wr-data-mux-bus-ns = <0>;
>>  
>> -		elm_id = <&elm>;
>> +		ti,elm-id = <&elm>;
>>  
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> -- 
>> 1.9.1
>>
