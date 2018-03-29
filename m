Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1bIH-0001Sz-UZ
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 17:24:59 +0000
Date: Thu, 29 Mar 2018 19:24:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: jedec_probe: Fix crash in jedec_read_mfr()
Message-ID: <20180329192435.013b5b74@bbrezillon>
In-Reply-To: <20180303222903.27767-1-linus.walleij@linaro.org>
References: <20180303222903.27767-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat,  3 Mar 2018 23:29:03 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> It turns out that the loop where we read manufacturer
> jedec_read_mfd() can under some circumstances get a
> CFI_MFR_CONTINUATION repeatedly, making the loop go
> over all banks and eventually hit the end of the
> map and crash because of an access violation:
> 
> Unable to handle kernel paging request at virtual address c4980000
> pgd = (ptrval)
> [c4980000] *pgd=03808811, *pte=00000000, *ppte=00000000
> Internal error: Oops: 7 [#1] PREEMPT ARM
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc1+ #150
> Hardware name: Gemini (Device Tree)
> PC is at jedec_probe_chip+0x6ec/0xcd0
> LR is at 0x4
> pc : [<c03a2bf4>]    lr : [<00000004>]    psr: 60000013
> sp : c382dd18  ip : 0000ffff  fp : 00000000
> r10: c0626388  r9 : 00020000  r8 : c0626340
> r7 : 00000000  r6 : 00000001  r5 : c3a71afc  r4 : c382dd70
> r3 : 00000001  r2 : c4900000  r1 : 00000002  r0 : 00080000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 0000397f  Table: 00004000  DAC: 00000053
> Process swapper (pid: 1, stack limit = 0x(ptrval))
> 
> Fix this by breaking the loop with a return 0 if
> the offset exceeds the map size.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Also added:

Fixes: 5c9c11e1c47c ("[MTD] [NOR] Add support for flash chips with ID in bank other than 0")
Cc: <stable@vger.kernel.org>

I'll send a fixes PR to Linus soon.

Thanks,

Boris

> ---
>  drivers/mtd/chips/jedec_probe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index 7c0b27d132b1..b479bd81120b 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -1889,6 +1889,8 @@ static inline u32 jedec_read_mfr(struct map_info *map, uint32_t base,
>  	do {
>  		uint32_t ofs = cfi_build_cmd_addr(0 + (bank << 8), map, cfi);
>  		mask = (1 << (cfi->device_type * 8)) - 1;
> +		if (ofs >= map->size)
> +			return 0;
>  		result = map_read(map, base + ofs);
>  		bank++;
>  	} while ((result.x[0] & mask) == CFI_MFR_CONTINUATION);



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
