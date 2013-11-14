Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vh2Aq-0001NR-2U
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 19:01:52 +0000
Date: Thu, 14 Nov 2013 16:01:33 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/4] mtd: nand: omap: optimize chip->ecc.hwctl() for
 H/W ECC schemes
Message-ID: <20131114190132.GC9912@localhost>
References: <1383385576-26095-1-git-send-email-pekon@ti.com>
 <1383385576-26095-4-git-send-email-pekon@ti.com>
 <20131113220330.GI9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131113220330.GI9468@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 13, 2013 at 02:03:30PM -0800, Brian Norris wrote:
> On Sat, Nov 02, 2013 at 03:16:15PM +0530, Pekon Gupta wrote:
> > chip->ecc.hwctl() is used for preparing the H/W controller before read/write
> > NAND accesses (like assigning data-buf, enabling ECC scheme configs, etc.)
> > 
> > Though all ECC schemes in OMAP NAND driver use GPMC controller for generating
> > ECC syndrome (for both Read/Write accesses). But but in current code
> 
> s/But but/but/
> 
> :)
> 
> > HAM1_ECC and BCHx_ECC schemes implement individual function to achieve this.
> > This patch merges the GPMC configuration code for all ECC schemes into
> > single omap_enable_hwecc(), thus adding scalability for future ECC schemes.
> > 
> >  omap_enable_hwecc() + omap3_enable_hwecc_bch() -> omap_enable_hwecc()
> > 
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
> > ---
> >  drivers/mtd/nand/omap2.c | 212 +++++++++++++++++------------------------------
> >  1 file changed, 74 insertions(+), 138 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index 1f59505..3a99e29 100644
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -33,6 +33,10 @@
> >  #define	DRIVER_NAME	"omap2-nand"
> >  #define	OMAP_NAND_TIMEOUT_MS	5000
> >  
> > +#define GPMC_ECC_READ		0 /* Reset Hardware ECC for read */
> > +#define GPMC_ECC_WRITE		1 /* Reset Hardware ECC for write */
> > +#define GPMC_ECC_READSYN	2 /* Reset before syndrom is read back */
> > +
> >  #define NAND_Ecc_P1e		(1 << 0)
> >  #define NAND_Ecc_P2e		(1 << 1)
> >  #define NAND_Ecc_P4e		(1 << 2)
> > @@ -101,13 +105,9 @@
> >  #define P4o_s(a)	(TF(a & NAND_Ecc_P4o)		<< 1)
> >  
> >  #define	PREFETCH_CONFIG1_CS_SHIFT	24
> > -#define	ECC_CONFIG_CS_SHIFT		1
> 
> You stopped using this macro in a different patch, so this removal is
> unrelated to this patch. But I'm not sure the code is better without
> these macros anyway... I'll leave it to your discretion, I guess.
> 
> >  #define	CS_MASK				0x7
> >  #define	ENABLE_PREFETCH			(0x1 << 7)
> >  #define	DMA_MPU_MODE_SHIFT		2
> > -#define	ECCSIZE0_SHIFT			12
> > -#define	ECCSIZE1_SHIFT			22
> > -#define	ECC1RESULTSIZE			0x1
> >  #define	ECCCLEAR			0x100
> >  #define	ECC1				0x1
> >  #define	PREFETCH_FIFOTHRESHOLD_MAX	0x40
> 
> ...
> 
> The rest looks OK but very hard for me to verify. Do we have any
> testers? Any platforms to check for regressions?
> 

I have 8-bit and 16-bit NAND modules to test this.

Pekon: Are you sending a new version of the whole patchset?
Please Cc me and I'll see about testing it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
