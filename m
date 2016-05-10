Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b06IO-0007I3-Ih
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 11:57:49 +0000
Received: by mail-qg0-x233.google.com with SMTP id f92so4602125qgf.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 04:57:27 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160506153816.7ca581ac@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5731CCA5.5070603@linaro.org>
Date: Tue, 10 May 2016 07:57:25 -0400
MIME-Version: 1.0
In-Reply-To: <20160506153816.7ca581ac@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/06/2016 09:38 AM, Boris Brezillon wrote:
> Hi Jorge,
>
> On Fri, 29 Apr 2016 12:17:21 -0400
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
>> This patch adds documentation support for Smart Device Gen1 type of
>> NAND controllers.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 161 +++++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
>> new file mode 100644
>> index 0000000..175767d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> [...]
>
>> +
>> +Children nodes properties:
>> +- reg:			Chip Select Signal, default 0.
>> +			Set as reg = <0>, <1> when need 2 CS.
>> +Optional:
>> +- nand-on-flash-bbt:	Store BBT on NAND Flash.
>> +- nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
>> +- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
>> +			The controller only supports 512 and 1024.
>> +			For large page NANDs ther recommended value is 1024.
>> +- nand-ecc-strength:	Number of bits to correct per ECC step.
>> +			The valid values that the controller supports are: 4, 6,
>> +			8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36, 40, 44,
>> +			48, 52, 56, 60.
>> +			The strength should be calculated as follows:
>> +			E = (S - F) * 8 / 14
>> +			S = O / (P / Q)
>> +				E :nand-ecc-strength;
>> +				S :spare size per sector;
>> +				F : FDM size, should be in the range [1,8].
>> +				    It is used to store free oob data.
>> +				O : oob size;
>> +				P : page size;
>> +				Q :nand-ecc-step-size
>> +			If the result does not match any one of the listed
>> +			choices above, please select the smaller valid value from
>> +			the list.
>> +			(otherwise the driver will do the clamping at runtime).
>> +- vmch-supply:		NAND power supply.
> Where is this supply name coming from? I most datasheets I see Vdd or
> Vcc, but nothing close to Vmch.
>
>
>

um yes we are removing this since we dont use it (it is the NAND vcc on 
some other MTK platform to do power management via regulator).
