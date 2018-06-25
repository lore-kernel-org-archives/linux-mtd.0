Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXSp7-0002x3-3l
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 14:50:34 +0000
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
To: Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Marek_Va=c5=a1ut?=
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
References: <20180619120719.26921-1-richard@nod.at>
 <CAK7LNASgPa4D0Siyo3mvK_AJ2zaECDXGaMEn-iNzQ9PFXFir+w@mail.gmail.com>
 <3320422.EJ8D6C0VHL@blindfold>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <d4fdcd1d-db20-1837-a037-0982a042d357@kernel.org>
Date: Mon, 25 Jun 2018 09:50:18 -0500
MIME-Version: 1.0
In-Reply-To: <3320422.EJ8D6C0VHL@blindfold>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 06/22/2018 10:58 AM, Richard Weinberger wrote:
> Masahiro,
> 
> Am Freitag, 22. Juni 2018, 16:37:21 CEST schrieb Masahiro Yamada:
>> Hi Richard,
>>
>>
>> 2018-06-19 21:07 GMT+09:00 Richard Weinberger <richard@nod.at>:
>>> The denali NAND flash controller needs at least two clocks to operate,
>>> nand_clk and nand_x_clk.
>>> Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
>>> setup_data_interface()") nand_x_clk is used to derive timing settings.
>>>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>>> Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
>>> is not present on this SoC.
>>> But my SoCFPGA knowledge is very limited.
>>>
>>> Thanks,
>>> //richard
>>> ---
>>>  arch/arm/boot/dts/socfpga.dtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>>> index 486d4e7433ed..562f7b375bbd 100644
>>> --- a/arch/arm/boot/dts/socfpga.dtsi
>>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>>> @@ -754,7 +754,8 @@
>>>                         reg-names = "nand_data", "denali_reg";
>>>                         interrupts = <0x0 0x90 0x4>;
>>>                         dma-mask = <0xffffffff>;
>>> -                       clocks = <&nand_clk>;
>>> +                       clocks = <&nand_clk>, <&nand_x_clk>;
>>> +                       clock-names = "nand", "nand_x";
>>
>>
>> IMHO, this should be
>>
>>                           clocks = <&nand_clk>, <&nand_x_clk>, <&nand_x_clk>;
>>                           clock-names = "nand", "nand_x", "ecc";

No, it should be just the nand_x and ecc.

There's already a patch to use the nand_x_clk and not the nand_clk.

https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/commit/?h=socfpga_for_next_v4.19_fixes_v1&id=1709ab58eb79b19bceb2287d111bf1bd2df1cf6d

Dinh
