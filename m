Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJwbF-00060u-Eo
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 07:16:07 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
Date: Wed, 29 Nov 2017 08:14:57 +0100
MIME-Version: 1.0
In-Reply-To: <20171128150417.17d53b5a@xps13>
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


> Hi Sean,
>
>>>> [    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC
>>>> step size 2048
>>> In theory, Marvell NAND flash controller does support 16-bit
>>> strength per 512 bytes over 2048 bytes pages. However, this
>>> controller driver (pxa3xx_nand) does not. See [1] for the supported
>>> configurations.
>>>
>>> The ECC strength shown here is probably the best to use with this
>>> type of NAND device but I suggest you try with 4b/512B by using
>>> these two properties like in [2]:
>>>
>>>           nand-ecc-strength = <4>;
>>>           nand-ecc-step-size = <512>;
>> My dts iscreated with great inspiration from the armada-385-dp-ap.dts
>>
>> &nand {
>>           status = "okay";
>>           pinctrl-names = "default";
>>           pinctrl-0 = <&nand_pins>, <&nand_rb>;
>>           num-cs = <1>;
>>           nand-on-flash-bbt;
>>           nand-ecc-strength = <4>;
>>           nand-ecc-step-size = <512>;
>> };
> Just for testing purpose, could you also put the keep-config and
> enable-arbiter properties ?
Yes, but i don't think the arbiter have any affect in the nand controller.
Bit 12 in NDCR register is marked reserved in the datasheet.
>
>> Why does the driver not set these values?
> Perhaps you can add traces there [3] and see where it fails?
>
> [3]
> http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3xx_nand.c#L1721
See here [4] the driver is selecting 16 bit strength when we are 
specifying 4 bits in the dts.

[4]
http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3xx_nand.c#L1595
>> (I only see the timeouts if I remove the nand-on-flash-bbt)
> The nand-on-flash-bbt will read some of the last pages in you NAND chip
> where a bad block table is supposed to be and derive from that
> whether a block is bad or not. So this does only one read. I guess you
> should have at least one timeout there?
Maybe, but the flash is fine we are running a rootfs in the NAND chip.

> Without this property, the NAND core will read every bad block marker
> (a few bytes at the beginning of the OOB area) and detect if the block
> was marked bad. Each access seems to produce a timeout, hence the big
> amount of errors you see.
in the old thread I linked, they had the same issue and like me only 
when scanning for
bad blocks.

/Sean
