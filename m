Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJgBn-0004ns-Hu
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 13:44:50 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
Date: Tue, 28 Nov 2017 14:42:46 +0100
MIME-Version: 1.0
In-Reply-To: <20171128143055.1ff22979@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel

On 2017-11-28 14:30, Miquel RAYNAL wrote:
> Hi Sean,
>
>
>>> Also, what kernel are you using ?
>> 4.14.0 :-)
> Good !
>
>> [    2.288684] pxa3xx-nand f10d0000.flash: This platform can't do DMA
>> on this device
> FYI, this is normal, the NAND controller does not have any DMA feature
> on Armada 38x (NFCv2).
>
>> [    2.296924] nand: device found, Manufacturer ID: 0x2c, Chip ID:
>> 0xda [    2.303311] nand: Micron MT29F2G08ABAEAH4
>> [    2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
>> 2048, OOB size: 64
>> [    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step
>> size 2048
> In theory, Marvell NAND flash controller does support 16-bit strength
> per 512 bytes over 2048 bytes pages. However, this controller driver
> (pxa3xx_nand) does not. See [1] for the supported configurations.
>
> The ECC strength shown here is probably the best to use with this type
> of NAND device but I suggest you try with 4b/512B by using these two
> properties like in [2]:
>
>          nand-ecc-strength = <4>;
>          nand-ecc-step-size = <512>;
My dts iscreated with great inspiration from the armada-385-dp-ap.dts

&nand {
         status = "okay";
         pinctrl-names = "default";
         pinctrl-0 = <&nand_pins>, <&nand_rb>;
         num-cs = <1>;
         nand-on-flash-bbt;
         nand-ecc-strength = <4>;
         nand-ecc-step-size = <512>;
};

Why does the driver not set these values?
(I only see the timeouts if I remove the nand-on-flash-bbt)
>
>
> Thanks,
> Miquèl
>
> [1]
> http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3xx_nand.c#L1575
>
> [2]
> http://elixir.free-electrons.com/linux/v4.14/source/arch/arm/boot/dts/armada-385-db-ap.dts#L172
