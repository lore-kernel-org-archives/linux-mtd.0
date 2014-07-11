Message-ID: <53BF4E94.7030104@gmail.com>
Date: Fri, 11 Jul 2014 10:40:20 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Jerome FORISSIER <jerome.forissier@huawei.com>
Subject: Re: [PATCH 1/3] mtd: hisilicon: add device tree node for nand
 controller
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-2-git-send-email-wangzhou.bry@gmail.com>
 <53BCEA77.2080004@huawei.com>
In-Reply-To: <53BCEA77.2080004@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-doc@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Russell King <linux@arm.linux.org.uk>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>,
 Pekon Gupta <pekon@ti.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 wangzhou1@hisilicon.com, Kumar Gala <galak@codeaurora.org>,
 caizhiyong@huawei.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年07月09日 15:08, Jerome FORISSIER wrote:
> On 30-Jun-14 10:03, Zhou Wang wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
>> ---
>>   arch/arm/boot/dts/hip04.dtsi |   31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
>> index abb42ca..e63fc61 100644
>> --- a/arch/arm/boot/dts/hip04.dtsi
>> +++ b/arch/arm/boot/dts/hip04.dtsi
>> @@ -386,5 +386,36 @@
>>   				interrupts = <0 389 4>;
>>   			};
>>   		};
>> +
>> +		nand: nand@4020000 {
>> +			compatible = "hisilicon,504-nfc";
>
> In PATCH 2/3 and 3/3 you are using "hisilicon,nfc504".
>

It was my mistake. All should be "hisilicon,504-nfc". Thanks a lot.

>> +			reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
>> +			interrupts = <0 379 4>;
>> +			nand-bus-width = <8>;
>> +			nand-ecc-mode = "none";
>> +			hisi,nand-ecc-bits = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			partition@0 {
>> +				label = "nand_text";
>> +				reg = <0x00000000 0x00400000>;
>> +			};
>> +
>> +			partition@00400000 {
>> +				label = "nand_monitor";
>> +				reg = <0x00400000 0x00400000>;
>> +			};
>> +
>> +			partition@00800000 {
>> +				label = "nand_kernel";
>> +				reg = <0x00800000 0x00800000>;
>> +			};
>> +
>> +			partition@01000000 {
>> +				label = "nand_fs";
>> +				reg = <0x01000000 0x1f000000>;
>> +			};
>> +		};
>>   	};
>>   };
>>
>
