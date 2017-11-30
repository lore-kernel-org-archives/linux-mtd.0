Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKNWZ-0001BH-9Q
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 12:01:05 +0000
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
Message-ID: <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
Date: Thu, 30 Nov 2017 13:00:37 +0100
MIME-Version: 1.0
In-Reply-To: <20171129090305.0174246d@xps13>
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

Hi Miquel
>> Yes, but i don't think the arbiter have any affect in the nand
>> controller. Bit 12 in NDCR register is marked reserved in the
>> datasheet.
> Be careful with that. I recently enabled 64-bit platforms featuring
> this NAND controller. After hours of digging because it was not
> working, I set this bit by adding this property like in any other device
> tree and it worked. I am not telling that it will solve your issue,
> mostly not, but this is something you should be careful about.
I have tried with arbiter enabled, no different behaviour observed.
>>>> (I only see the timeouts if I remove the nand-on-flash-bbt)
>>> The nand-on-flash-bbt will read some of the last pages in you NAND
>>> chip where a bad block table is supposed to be and derive from that
>>> whether a block is bad or not. So this does only one read. I guess
>>> you should have at least one timeout there?
>> Maybe, but the flash is fine we are running a rootfs in the NAND chip.
> So you can safely use the content of the NAND chip? Without any timeout
> neither with reads nor writes? Can you try the mtd-utils from [5]:
> nanddump/nandwrite or nandpagetest?
>
> Also, can you isolate the line that produces the timeouts?
>
> [5]http://www.linux-mtd.infradead.org/
Yes the NAND chip is working fine and stores our data.

It is the command NAND_CMD_READOOB that causes it to timeout.

Here is a dump (booting with bbt enabled):
root@output-module:~# nanddump -oa /dev/mtd1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 8
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x0ff00000...
[  984.580213] pxa3xx-nand f10d0000.flash: Wait time out!!!
[  984.790195] pxa3xx-nand f10d0000.flash: Wait time out!!!
[  985.000195] pxa3xx-nand f10d0000.flash: Wait time out!!!

/Sean
