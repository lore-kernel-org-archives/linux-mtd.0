Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqEtK-0003Ce-5o
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 04:25:50 +0000
Message-ID: <52A697AB.1060404@ti.com>
Date: Tue, 10 Dec 2013 09:55:15 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 09/10] arm: dts: dra7: Add qspi device.
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-10-git-send-email-sourav.poddar@ti.com>
 <20131209174203.GB12527@atomide.com>
In-Reply-To: <20131209174203.GB12527@atomide.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 balbi@ti.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, bcousson@baylibre.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 December 2013 11:12 PM, Tony Lindgren wrote:
> * Sourav Poddar<sourav.poddar@ti.com>  [131206 06:29]:
>> These add device tree entry for qspi controller driver on dra7.
> FYI these .dts changes need to be queued separately by Benoit and
> should be posted as a seprate series in general to avoid confusion.
>
Ok, thanks!
I posted this for review along with other code changes.

I will post them seperately to Benoit.
> Regards,
>
> Tony
>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>> ---
>> v1->v2:
>> use "MUX_MODE1" instead of numeric value
>>   arch/arm/boot/dts/dra7-evm.dts |   32 ++++++++++++++++++++++++++++++++
>>   arch/arm/boot/dts/dra7.dtsi    |   13 +++++++++++++
>>   2 files changed, 45 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
>> index 5babba0..4a57fdf 100644
>> --- a/arch/arm/boot/dts/dra7-evm.dts
>> +++ b/arch/arm/boot/dts/dra7-evm.dts
>> @@ -93,6 +93,21 @@
>>   			0x24c (PIN_INPUT_SLEW | MUX_MODE0) /* uart3_txd */
>>   		>;
>>   	};
>> +
>> +	qspi1_pins: pinmux_qspi1_pins {
>> +		pinctrl-single,pins =<
>> +			0x4c (PIN_INPUT | MUX_MODE1)  /* gpmc_a3.qspi1_cs2 */
>> +			0x50 (PIN_INPUT | MUX_MODE1)  /* gpmc_a4.qspi1_cs3 */
>> +			0x74 (PIN_INPUT | MUX_MODE1)  /* gpmc_a13.qspi1_rtclk */
>> +			0x78 (PIN_INPUT | MUX_MODE1)  /* gpmc_a14.qspi1_d3 */
>> +			0x7c (PIN_INPUT | MUX_MODE1)  /* gpmc_a15.qspi1_d2 */
>> +			0x80 (PIN_INPUT | MUX_MODE1) /* gpmc_a16.qspi1_d1 */
>> +			0x84 (PIN_INPUT | MUX_MODE1)  /* gpmc_a17.qspi1_d0 */
>> +			0x88 (PIN_INPUT | MUX_MODE1)  /* qpmc_a18.qspi1_sclk */
>> +			0xb8 (PIN_INPUT_PULLUP | MUX_MODE1)  /* gpmc_cs2.qspi1_cs0 */
>> +			0xbc (PIN_INPUT_PULLUP | MUX_MODE1)  /* gpmc_cs3.qspi1_cs1 */
>> +		>;
>> +	};
>>   };
>>
>>   &i2c1 {
>> @@ -273,3 +288,20 @@
>>   &cpu0 {
>>   	cpu0-supply =<&smps123_reg>;
>>   };
>> +
>> +&qspi {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 =<&qspi1_pins>;
>> +
>> +	spi-max-frequency =<48000000>;
>> +	m25p80@0 {
>> +		compatible = "s25fl256s1";
>> +		spi-max-frequency =<48000000>;
>> +		reg =<0>;
>> +		spi-tx-bus-width =<1>;
>> +		spi-rx-bus-width =<4>;
>> +		spi-cpol;
>> +		spi-cpha;
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
>> index 67275c8..b06d899 100644
>> --- a/arch/arm/boot/dts/dra7.dtsi
>> +++ b/arch/arm/boot/dts/dra7.dtsi
>> @@ -582,6 +582,19 @@
>>   			dma-names = "tx0", "rx0";
>>   			status = "disabled";
>>   		};
>> +
>> +		qspi: qspi@4b300000 {
>> +			compatible = "ti,dra7xxx-qspi";
>> +			reg =<0x4b300000 0x100>,<0x4a002558 0x4>,
>> +					<0x5c000000 0x3ffffff>;
>> +			reg-names = "qspi_base", "qspi_ctrlmod", "qspi_mmap";
>> +			#address-cells =<1>;
>> +			#size-cells =<0>;
>> +			ti,hwmods = "qspi";
>> +			num-cs =<4>;
>> +			interrupts =<0 124 0x4>;
>> +			status = "disabled";
>> +		};
>>   	};
>>
>>   	clocks {
>> -- 
>> 1.7.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
