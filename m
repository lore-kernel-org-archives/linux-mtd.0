Message-ID: <53B37284.9060902@gmail.com>
Date: Wed, 02 Jul 2014 10:46:28 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] mtd: hisilicon: add device tree binding documentation
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-4-git-send-email-wangzhou.bry@gmail.com>
 <20140630095234.GZ7262@leverpostej>
In-Reply-To: <20140630095234.GZ7262@leverpostej>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Russell King <linux@arm.linux.org.uk>, Alexander Shiyan <shc_work@mail.ru>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>,
 Pekon Gupta <pekon@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 Kumar Gala <galak@codeaurora.org>,
 "caizhiyong@huawei.com" <caizhiyong@huawei.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
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

On 2014年06月30日 17:52, Mark Rutland wrote:
> On Mon, Jun 30, 2014 at 09:03:29AM +0100, Zhou Wang wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
>> ---
>>   .../devicetree/bindings/mtd/hisi-nand.txt          |   38 ++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/hisi-nand.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/hisi-nand.txt b/Documentation/devicetree/bindings/mtd/hisi-nand.txt
>> new file mode 100644
>> index 0000000..1cc6470
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/hisi-nand.txt
>> @@ -0,0 +1,38 @@
>> +Hisilicon Hip04 Soc NAND controller DT binding
>> +
>> +Required properties:
>> +- compatible:          Should be "hisilicon,nfc504".
>> +- reg:                 Contain registers location and length for reg and data.
>
> I'm not sure I follow. The example below has two reg entries. What does
> each entry represent, and what does the presence of multiple entries
> mean?
>

Maybe I could not express it clearly here. The first reg entry 
represents the basic address of registers of NAND controller, and the 
second represents the basic address of buffer of NAND controller.

>> +- interrupts:          Interrupt number for nfc.
>
> Just the one?
>

Yes, Just one interrupt number. And there is an interrupt relative 
register in the NAND controller, we can get information about interrupt 
from the register after an interrupt triggered.

>> +- nand-bus-width:      See nand.txt.
>> +- nand-ecc-mode:       See nand.txt.
>> +- hisi,nand-ecc-bits:  ECC bits type support.
>> +		<0>:   none ecc
>> +		<1>:   Can correct 1bit per 512byte.
>> +		<6>:   Can correct 16bits per 1K byte.
>
> Is this an enumeration, or a number of bits?
>

This is an enumeration which is just relative register configure, so we 
can directly use it to configure relative register bits in driver.

>> +- #address-cells:      partition address.
>> +- #size-cells:         partition size.
>
> Are these only allowed to be 1 cell, or can they be more?
>
> Thanks,
> Mark.
>

These are only allowed to be 1 cell. Address-cells represents basic 
address of a partition, and size-cells represents the size of a partition.

I will rewrite the unclear parts as your comments. Thanks for your comments.

-Zhou Wang

>> +
>> +Flash chip may optionally contain additional sub-nodes describing partitions of
>> +the address space. See partition.txt for more detail.
>> +
>> +Example:
>> +
>> +	nand: nand@4020000 {
>> +		compatible = "hisilicon,nfc504";
>> +		reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
>> +		interrupts = <0 379 4>;
>> +		nand-bus-width = <8>;
>> +		nand-ecc-mode = "hw";
>> +		hisi,nand-ecc-bits = <1>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +
>> +		partition@0 {
>> +			label = "nand_text";
>> +			reg = <0x00000000 0x00400000>;
>> +		};
>> +
>> +		...
>> +
>> +	};
>> --
>> 1.7.9.5
>>
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
