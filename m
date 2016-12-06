Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
References: <1480906577-38455-1-git-send-email-shawn.lin@rock-chips.com>
 <1480906577-38455-2-git-send-email-shawn.lin@rock-chips.com>
 <40cb2739-f58d-2e35-5b87-6b46e93e422e@gmail.com>
Cc: shawn.lin@rock-chips.com, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <c6fb36aa-39a2-28a1-e47c-0efa161bb78a@rock-chips.com>
Date: Tue, 6 Dec 2016 10:34:22 +0800
MIME-Version: 1.0
In-Reply-To: <40cb2739-f58d-2e35-5b87-6b46e93e422e@gmail.com>
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

On 2016/12/5 11:24, Marek Vasut wrote:
> On 12/05/2016 03:56 AM, Shawn Lin wrote:
>> Add binding document for the Rockchip serial flash controller.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changes in v3:
>> - rename sfc-no-dma to sfc-no-DMA
>>
>> Changes in v2: None
>>
>>  .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>> new file mode 100644
>> index 0000000..c6b4f58
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
>> +- clocks: Must contain two entries for each entry in clock-names.
>> +- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
>> +		the peripheral clock.
>> +- interrupts : Should contain the interrupt for the device.
>> +- reg: Physical base address of the controller and length of memory mapped.
>> +
>> +Optional properties:
>
> Uhhh, I apologize for the miscommunication.
>
>> +- rockchip,sfc-no-DMA: Indicate the controller doesn't support dma transfer.
> I didn't mean this   ^^^ DMA, that should be lowercase. I meant   ^^^
> this one. The property should be lowercase, the description
> should be uppercase.

Ah, got it.

>
>> +
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
