Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKh65-0006kP-GV
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 08:55:10 +0000
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
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <744e99ee-91cf-28bc-21eb-c3fa01fb0a01@prevas.dk>
Date: Fri, 1 Dec 2017 09:54:20 +0100
MIME-Version: 1.0
In-Reply-To: <20171201091539.5d6b7572@xps13>
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
> Can you add traces there [1] to see which path is used ?
>
> [1]
> http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/pxa3xx_nand.c#L669
>
>
I have inserted trace in drain_fifo:
Line 672 right at the top
Line 677 inside "if (info->ecc_bch)"
Line 687 in the while loop
Line 702 just before ioread32_rep

[   37.356209] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():827 
nand_readl(0x0014) = 0x1
[   37.356214] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():877 
nand_writel(0x1, 0x0014)
[   37.356219] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():891 
nand_writel(0xd3000, 0x0048)
[   37.356224] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():892 
nand_writel(0x2040000, 0x0048)
[   37.356228] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():893 
nand_writel(0x0, 0x0048)
[   37.356233] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():897 
nand_writel(0x0, 0x0048)
[   37.356256] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():827 
nand_readl(0x0014) = 0x800
[   37.356261] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():877 
nand_writel(0x800, 0x0014)
[   37.356376] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():827 
nand_readl(0x0014) = 0x2
[   37.356386] pxa3xx-nand f10d0000.flash: drain_fifo():672
[   37.356390] pxa3xx-nand f10d0000.flash: drain_fifo():677
[   37.356394] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356400] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356405] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356410] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356415] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356420] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356425] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356430] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356435] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356440] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356446] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356451] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356456] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356461] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356466] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356471] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356476] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356481] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356486] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356491] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356497] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356502] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356507] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356512] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356517] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356522] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356527] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356532] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356537] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356542] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356548] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356553] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356558] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356563] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356568] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356573] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356578] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356583] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356588] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356593] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356598] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356604] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356609] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356614] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356619] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356624] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356629] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356634] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356639] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356644] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356650] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356655] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356660] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356665] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356670] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356675] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356680] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356685] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356690] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356695] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356700] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356705] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356711] pxa3xx-nand f10d0000.flash: drain_fifo():687
[   37.356716] pxa3xx-nand f10d0000.flash: drain_fifo():702
[   37.356721] pxa3xx-nand f10d0000.flash: drain_fifo():672
[   37.356725] pxa3xx-nand f10d0000.flash: drain_fifo():677
[   37.356728] pxa3xx-nand f10d0000.flash: drain_fifo():702
[   37.356734] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq_thread():807 
nand_writel(0x6, 0x0014)
[   37.560189] pxa3xx-nand f10d0000.flash: Wait time out!!!
[   37.565521] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():636 
nand_readl(0x0000) = 0x91078000

Thanks
/Sean
