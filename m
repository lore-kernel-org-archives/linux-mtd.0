Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKTLE-0001PP-0P
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 18:13:48 +0000
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
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
Date: Thu, 30 Nov 2017 19:13:17 +0100
MIME-Version: 1.0
In-Reply-To: <20171130181847.0bbc58b5@xps13>
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

Hi
>>>>>> (I only see the timeouts if I remove the nand-on-flash-bbt)
>>>>> The nand-on-flash-bbt will read some of the last pages in you NAND
>>>>> chip where a bad block table is supposed to be and derive from
>>>>> that whether a block is bad or not. So this does only one read. I
>>>>> guess you should have at least one timeout there?
>>>> Maybe, but the flash is fine we are running a rootfs in the NAND
>>>> chip.
>>> So you can safely use the content of the NAND chip? Without any
>>> timeout neither with reads nor writes? Can you try the mtd-utils
>>> from [5]: nanddump/nandwrite or nandpagetest?
>>>
>>> Also, can you isolate the line that produces the timeouts?
>>>
>>> [5]http://www.linux-mtd.infradead.org/
>> Yes the NAND chip is working fine and stores our data.
>>
>> It is the command NAND_CMD_READOOB that causes it to timeout.
> Ok, I had a look at the nand_cmdfunc() function which is, I suppose,
> the one that is in use (because you are using 2k pages) but I could
> not see anything obvious. Is your setup special in some way?
Yes it's nand_cmdfunc()
No a clean 4.14.0 kernel with a custom dts.
>
> Could you enable dynamic debug by adding "#define DEBUG" *before* all
> #includes at the top of the pxa3xx_nand.c driver? It should display all
> register accesses. Also, can you read the content of NDCR and NDSR when
> it timeouts?
>
[   32.765604] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():605 
nand_writel(0x1, 0x0028)
[   32.765609] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():625 
nand_writel(0xfff, 0x0014)
[   32.765614] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():626 
nand_writel(0x0, 0x0000)
[   32.765620] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():627 
nand_writel(0xd1078000, 0x0000)
[   32.765627] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x1
[   32.765632] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():874 
nand_writel(0x1, 0x0014)
[   32.765637] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():888 
nand_writel(0xd3000, 0x0048)
[   32.765643] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():889 
nand_writel(0x2060000, 0x0048)
[   32.765648] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():890 
nand_writel(0x0, 0x0048)
[   32.765653] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():894 
nand_writel(0x0, 0x0048)
[   32.765677] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x800
[   32.765682] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():874 
nand_writel(0x800, 0x0014)
[   32.765797] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x2
[   32.765886] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq_thread():804 
nand_writel(0x6, 0x0014)
[   32.765893] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x500
[   32.765899] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():874 
nand_writel(0x500, 0x0014)
[   32.765950] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():609 
nand_writel(0x0, 0x0028)
[   32.765956] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():625 
nand_writel(0xfff, 0x0014)
[   32.765961] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():626 
nand_writel(0x0, 0x0000)
[   32.765966] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():627 
nand_writel(0x91078000, 0x0000)
[   32.765974] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x1
[   32.765979] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():874 
nand_writel(0x1, 0x0014)
[   32.765984] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():888 
nand_writel(0xd3000, 0x0048)
[   32.765989] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():889 
nand_writel(0x2060000, 0x0048)
[   32.765994] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():890 
nand_writel(0x0, 0x0048)
[   32.766000] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():894 
nand_writel(0x0, 0x0048)
[   32.766022] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x800
[   32.766028] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():874 
nand_writel(0x800, 0x0014)
[   32.766143] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():824 
nand_readl(0x0014) = 0x2
[   32.766233] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq_thread():804 
nand_writel(0x6, 0x0014)
[   32.970203] pxa3xx-nand f10d0000.flash: Wait time out!!!
*[   32.975535] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():636 
nand_readl(0x0014) = 0x0*
*[   32.975540] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():637 
nand_readl(0x0000) = 0x91078000*
[   32.975546] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():639 
nand_readl(0x0000) = 0x91078000
[   32.975552] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():639 
nand_readl(0x0000) = 0x91078000
[   32.975559] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():639 
nand_readl(0x0000) = 0x91078000
[   32.975565] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():639 
nand_readl(0x0000) = 0x91078000
[   32.975572] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():645 
nand_writel(0x81078000, 0x0000)
[   32.975577] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():651 
nand_writel(0xfff, 0x0014)

I think I got one whole timeout sequence here :-)
Register 0x0014 is NDSR and reg 0x0000 is NDCR, I have added a read of the
NDSR register in the pxa3xx_nand_stop routine as highlighted above.
It pussles me that the nand_start is called two times before
the timeout, maybe it's okay.

/Sean
