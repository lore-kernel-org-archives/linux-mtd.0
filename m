Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdmRj-0003LQ-TU
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 14:47:31 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KOM00EO2P2QPI30@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 10:47:15 -0400 (EDT)
Date: Wed, 19 Aug 2009 10:47:14 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
In-reply-to: <20090819094535.558dc0df@marrow.netinsight.se>
Message-id: <alpine.LFD.2.00.0908191037310.6044@xanadu.home>
References: <20090714164135.65e91b91@marrow.netinsight.se>
	<alpine.LFD.2.00.0907141236160.3138@xanadu.home>
	<20090819094535.558dc0df@marrow.netinsight.se>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Aug 2009, Simon Kagstrom wrote:

> On Tue, 14 Jul 2009 12:40:33 -0400 (EDT)
> Nicolas Pitre <nico@cam.org> wrote:
> 
> > On Tue, 14 Jul 2009, Simon Kagstrom wrote:
> > 
> > > GCC 4.3.3 happily removes the dword load instruction in
> > > orion_nand_read_buf. This patch makes the inline assembly volatile to
> > > avoid this situation.
> > 
> > If GCC does optimize away this inline asm then this is a serious GCC 
> > bug.  The inline asm uses an output operand for which a dependency 
> > exists on the very next line.
> 
> I've been away on vacation, sorry for not replying until now.
> 
> Anyway, I spoke to the GCC people at gcc-help, and they insist that the
> inlined assembly is wrong. The problem is that GCC doesn't infer from
> the instruction that it accesses memory, and it can thereby move it out
> of the loop.

Oh!  OK.  That's different though.  In your initial report you said that 
the inline asm was _removed_.  I can understand why it might be factored 
out of the loop though, but it cannot be removed entirely.

> So here comes an updated patch.
> 
> // Simon
> --
> Orion NAND: Clobber memory to make sure that GCC does not move ldrd
> 
> GCC 4.3.3 happily removes the dword load instruction in
> orion_nand_read_buf. This patch clobbers memory, and makes the
> instruction volatile to avoid the issue. I've discussed this at
> gcc-help, refer to the thread at
> 
>   http://gcc.gnu.org/ml/gcc-help/2009-08/msg00187.html
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/nand/orion_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 7ad9722..845f9a9 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  	buf64 = (uint64_t *)buf;
>  	while (i < len/8) {
>  		uint64_t x;
> -		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
> +		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base) : "memory");

I think that the early clobber buys you nothing, and the memory clobber 
is way overkill here.  The volatile ought to be all that is needed.  Can 
you confirm that only the addition of volatile makes the code OK?  My 
gcc version is 4.3.2 and that makes no difference what so ever as the 
code as is produces the correct result already in my case.


Nicolas
