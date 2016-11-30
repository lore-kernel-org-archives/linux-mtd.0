Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-2-git-send-email-shawn.lin@rock-chips.com>
 <7fd2cdc0-2103-d254-c7b2-d2552a32a738@gmail.com>
Cc: shawn.lin@rock-chips.com, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <a5f13048-fbfa-7988-659a-0223b767ddf3@rock-chips.com>
Date: Wed, 30 Nov 2016 08:55:23 +0800
MIME-Version: 1.0
In-Reply-To: <7fd2cdc0-2103-d254-c7b2-d2552a32a738@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2016/11/25 21:30, Marek Vasut wrote:
> On 11/18/2016 03:59 AM, Shawn Lin wrote:
>> Add binding document for the Rockchip serial flash controller.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changes in v2: None
>>
>>  .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>> new file mode 100644
>> index 0000000..28430ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>> @@ -0,0 +1,31 @@
>> +Rockchip Serial Flash Controller
>> +
>> +Required properties:
>> +- compatible : Should be
>> +		"rockchip,rk1108-sfc", "rockchip,sfc" for ROCKCHIP RK1108.
>> +- address-cells : Should be 1.
>> +- size-cells : Should be 0.
>
> Shouldn't these two props have a # prefix ? I'm not sure they should
> even be part of this binding document at all.
>
>> +- clocks: Must contain two entries for each entry in clock-names.
>> +- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
>> +		the peripheral clock.
>> +- interrupts : Should contain the interrupt for the device.
>> +- reg: Physical base address of the controller and length of memory mapped.
>> +
>> +Optional properties:
>> +- rockchip,sfc-no-dma: Indicate the controller doesn't support dma transfer.
>
> DMA should be in capital letters.

Both of DMA or dma could be found by grepping the
Documentation/devicetree/bindings/, so I think it
isn't a big deal for this. :)

>
>> +Example:
>> +nor_flash: sfc@301c0000 {
>> +	compatible = "rockchip,rk1108-sfc", "rockchip,sfc";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
>> +	clock-names = "sfc", "hsfc";
>> +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
>> +	reg = <0x301c0000 0x1000>;
>> +	spi-nor@0 {
>> +		compatible = "jedec,spi-nor";
>> +		spi-max-frequency = <12000000>;
>> +		reg = <0>;
>> +	};
>> +};
>>
>
>


-- 
Best Regards
Shawn Lin
