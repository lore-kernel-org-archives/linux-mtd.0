Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeAI5-0006YE-4c
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 16:15:09 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KOO00472NA0E0O0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 12:03:36 -0400 (EDT)
Date: Thu, 20 Aug 2009 12:14:47 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
In-reply-to: <20090820091953.2b149fbb@marrow.netinsight.se>
Message-id: <alpine.LFD.2.00.0908201204320.6044@xanadu.home>
References: <20090714164135.65e91b91@marrow.netinsight.se>
	<alpine.LFD.2.00.0907141236160.3138@xanadu.home>
	<20090819094535.558dc0df@marrow.netinsight.se>
	<alpine.LFD.2.00.0908191037310.6044@xanadu.home>
	<20090820091953.2b149fbb@marrow.netinsight.se>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Aug 2009, Simon Kagstrom wrote:

> On Wed, 19 Aug 2009 10:47:14 -0400 (EDT)
> Nicolas Pitre <nico@cam.org> wrote:
> 
> > I think that the early clobber buys you nothing, and the memory clobber 
> > is way overkill here.  The volatile ought to be all that is needed.  Can 
> > you confirm that only the addition of volatile makes the code OK?  My 
> > gcc version is 4.3.2 and that makes no difference what so ever as the 
> > code as is produces the correct result already in my case.
> 
> Yes, it works fine with 4.3.3 and 4.4.1 with this change. So the
> updated patch can be found below. I belive the early clobber should be
> there though, since (from the ARM architecture reference manual):
> 
>   If <addressing_mode> performs base register write-back and the base
>   register <Rn> is one of the two destination registers of the
>   instruction, the results are UNPREDICTABLE.
> 
> it works fine without the early clobber as well, but I'd feel more safe
> having it in.

But this isn't the case here.  We don't perform any writeback.
You get a writeback when you have an addressing mode of the form:

	insn	rd, [rn, rm]!
	insn	rd, [rn, #off]!
	insn	rd, [rn], #off

but not with:

	insn	rd, [rn, #off]

Etc.

Still the early clobber shouldn't have any adverse effect either, unlike 
the memory clobber.

Acked-by: Nicolas Pitre <nico@marvell.com>

Unless the MTD guys are going to pick this patch and push it to Linus 
soon I'll carry it in the Orion git repo.


> 
> // Simon
> --
> Orion NAND: Make asm volatile avoid GCC pushing ldrd out of the loop
> 
> GCC 4.3.3 and 4.4.1 happily moves the dword load instruction out of the
> loop in orion_nand_read_buf. This patch makes the instruction volatile
> to avoid the issue. I've discussed this at gcc-help, refer to the thread
> at
> 
>   http://gcc.gnu.org/ml/gcc-help/2009-08/msg00187.html
> 
> The early clobber is added to avoid the destination registers and the
> source register overlapping.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/nand/orion_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 7ad9722..0d9d4bc 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  	buf64 = (uint64_t *)buf;
>  	while (i < len/8) {
>  		uint64_t x;
> -		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
> +		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
>  		buf64[i++] = x;
>  	}
>  	i *= 8;
> -- 
> 1.6.0.4
> 
