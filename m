Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOJPh-0008O8-G8
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 08:26:15 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
 <20171130181847.0bbc58b5@xps13>
 <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
 <20171201091539.5d6b7572@xps13>
 <744e99ee-91cf-28bc-21eb-c3fa01fb0a01@prevas.dk>
 <20171207213814.4c57098f@xps13>
 <26441ab5-8c70-4d7f-5e0d-bec3d59e2ef2@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
Date: Mon, 11 Dec 2017 09:25:45 +0100
MIME-Version: 1.0
In-Reply-To: <20171208102148.0a2c0fbe@xps13>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Hi Miquel,
> Hi Sean,
>
>> Thanks I didn't know about that :-)
>>
>> I had a look at it and I have rebased my stuff on top of your branch.
>> I have edited my devicetree to look like this:
>> &nand_controller {
>>       status = "okay";
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&nand_pins>, <&nand_rb>;
>>
>>       nand@0 {
>>           reg = <0>;
>>           label = "pxa3xx_nand-0";
>>           marvell,rb = <0>;
>>           marvell,nand-keep-config;
>>           nand-on-flash-bbt;
>>           nand-ecc-strength = <4>;
>>           nand-ecc-step-size = <512>;
>>       };
>> };
>>
>> It produces a lot of bad eraseblocks entrys
>> [    2.693343] nand: device found, Manufacturer ID: 0x2c, Chip ID:
>> 0xda [    2.699717] nand: Micron MT29F2G08ABAEAH4
>> [    2.703772] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
>> 2048, OOB size: 64
>> [    2.714286] Bad block table not found for chip 0
>> [    2.721509] Bad block table not found for chip 0
>> [    2.726139] Scanning device for bad blocks
>> [    2.730583] Bad eraseblock 0 at 0x000000000000
>> [    2.735365] Bad eraseblock 1 at 0x000000020000
>> [    2.740145] Bad eraseblock 2 at 0x000000040000
>> [    2.744934] Bad eraseblock 3 at 0x000000060000
>> [    2.749714] Bad eraseblock 4 at 0x000000080000
>>
>> Is my devicetree correct?
> It depends:
>    - Did you already use bad block tables before ?
Yes because if I don't i would get the timeouts described in this thread :-)
>    - Is your bootloader using 4b/512B ECC strength ?
strength 4, ecc_stepsize 512, page_size 2048 but the uboot driver sets 
it to strength 16, ecc_stepsize 512, page_size 2048,
just like the current pxa3xx driver in the kernel does.
>
> Besides:
>
>    - What filesystem are you booting? Is it UBIFS or JFFS2 or
> something else?
UBI
>    - Did you show the 5 first bad eraseblocks only or all of them?
It continues to count to:
Bad eraseblock 2047 at 0x00000ffe0000
>    - Do you have good blocks ?
No
>    - Can you make use of the NAND chip after?
No

Correct me if i'm wrong, but i can't find anywhere the 
nand-ecc-step-size is read by the new nand driver?

/Sean
