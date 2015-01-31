Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHS4h-0003Zj-GS
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 07:02:36 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so61148515pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jan 2015 23:02:11 -0800 (PST)
Date: Fri, 30 Jan 2015 23:02:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 0/3] An alternative to SPI NAND
Message-ID: <20150131070204.GA3692@norris-Latitude-E6410>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB3F3@NTXXIAMBX02.xacn.micron.com>
 <20150108010257.GP9759@ld-irv-0074>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714DD2A@NTXXIAMBX02.xacn.micron.com>
 <54ADF90B.1070800@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714F043@NTXXIAMBX02.xacn.micron.com>
 <54BE2F7B.60003@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A77151E62@NTXXIAMBX02.xacn.micron.com>
 <54CA75F6.5020803@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A04AE751@NTXXIAMBX02.xacn.micron.com>
 <54CB6F51.2070403@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54CB6F51.2070403@imgtec.com>
Cc: =?utf-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 Andrew Bresticker <abrestic@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 =?utf-8?B?Ik1lbGFuaWUgWmhhbmcg5byg54eVIChtZWxhbmllemhhbmcpIg==?=
 <melaniezhang@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 James Hartley <james.hartley@imgtec.com>,
 =?utf-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 30, 2015 at 08:47:29AM -0300, Ezequiel Garcia wrote:
> On 01/29/2015 09:57 PM, Peter Pan 潘栋 (peterpandong) wrote:
> [..]
> > 
> > Currently, we are working on sharing the bbt code. I think your and Brain's suggestion
> > will be very helpful.
> > 
> > There are two options. We can put struct nand_bbt pointer in either nand_chip
> > or mtd_info structure.
> 
> I'm sorry, you lost me here. Do you mean struct nand_bbt_descr ?

I'm assuming he's suggesting a new struct that he's calling nand_bbt.

> > If put nand_bbt in nand_chip, we need to change the
> 
> I thought the plan was NOT to base spi-nand on nand, so you can't put
> this in nand_chip, can you?

You could. It's just a matter of who does the pointer chasing. (It's
just important that nand_bbt.c doesn't *assume* that it has nand_chip as
a parent.)

If struct nand_bbt is embedded directly in struct mtd_info, then
nand_bbt.c could implement functions such that its users can just do
this:

	mtd->_block_isbad = nand_bbt_blockisbad;

But if you don't (and instead embed it in a custom location like
nand_chip), we'd have to write wrappers that call the nand_bbt_*
functions (like nand_base does today). e.g.:

	mtd->_block_isbad = spi_nand_blockisbad;

int spi_nand_block_isbad(struct mtd_info *mtd, loff_t offs)
{
	struct spi_nand_chip *chip = mtd->priv;
	struct nand_bbt *bbt = chip->bbt;

	return nand_bbt_blockisbad(bbt, offs);
}

Anyway, I think it's worth laying out exactly where the pieces are going
to fit here. I reckon we need the following:

 1. a short list of parameters that nand_bbt needs from the NAND
 implementation (either nand_base or spi-nand-*)

 2. a list of parameters that need to be kept around for nand_bbt
 bookkeeping / handling

 3. an init function (nand_bbt_init()?) that takes #1 and computes #2

 3(a) a corresponding release function

 4. a set of functions that, given only a few obvious parameters (e.g.,
 block offsets) and a struct that holds #2, handle all BBT needs (e.g.,
 bad block lookup, bad block scanning, marking new bad blocks)

Since I see #1 and #2 overlapping quite a bit, we might combine them,
where several parameters are expected to be set by the nand_bbt user
(either nand_base.c or nand_bbt.c), and a few are considered private to
nand_bbt.

struct nand_bbt {
	struct mtd_info *mtd;

	/*
	 * This is important to abstract out of nand_bbt.c and provide
	 * separately in nand_base.c and spi-nand-base.c -- it's sort of
	 * duplicated in nand_block_bad() (nand_base) and
	 * scan_block_fast() (nand_bbt) right now
	 *
	 * Note that this also means nand_chip.badblock_pattern should
	 * be removed from nand_bbt.c
	 */
	int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);

	/* Only required if the driver wants to attempt to program new
	 * bad block markers that imitate the factory-marked BBMs */
	int (*mark_bad_bbm)(struct mtd_info *mtd, loff_t ofs);

	unsigned int bbt_options;

	/* Only required for NAND_BBT_PERCHIP */
	int numchips;

	/* Discourage new customer usages here; suggest usage of the
	 * relevant NAND_BBT_* options instead */
	struct nand_bbt_descr *bbt_td;
	struct nand_bbt_descr *bbt_md;

	/* The rest are filled in by nand_bbt_init() */

	int bbt_erase_shift;
	int page_shift;

	u8 *bbt;
};

#3 might simply look like:

int nand_bbt_init(struct nand_bbt *bbt);
void nand_bbt_release(struct nand_bbt *bbt);

#4 might look like the following APIs for nand_bbt.c (not too different
than we have now):

int nand_bbt_init(struct nand_bbt *bbt); /* init + scan? */
int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);

(The above allows for nand_bbt to be embedded anywhere; we could modify
this API to be drop-in replacements for the mtd_info callbacks if we
embed struct nand_bbt in mtd_info.)

> Also: After looking at the nand_bbt.c file, I'm wondering how promising
> is to separate it from NAND. It seems the BBT code is quite attached to
> NAND!

There will be quite a bit of churn, but I don't think that it is too
strongly attached.

> Are you planning to do this in just one patch? Maybe it's better to
> start simple and prepare small patches that gradually make the
> nand_base.c and nand_bbt.c files less dependent.

Yeah, a series of patches would be best. And maybe start smaller.

If the nand_bbt stuff really slows someone down, we might want to just
agree on an API similar to the above and then work on the rest of the
SPI NAND details, assuming someone (e.g., me) writes the implementation
(and transitions other drivers to do this).

Unless someone else thinks they have an excellent handle on the above,
I'll take a stab at doing this. I actually have a few patches that have
hung around a while (with little incentive to finish them) that do parts
of what I'm suggesting above.

> For instance, you can get rid of the memory release in a first patch:
> 
>         /* Free bad block table memory */
>         kfree(chip->bbt);
>         if (!(chip->options & NAND_OWN_BUFFERS))
>                 kfree(chip->buffers);
> 
>         /* Free bad block descriptor memory */
>         if (chip->badblock_pattern && chip->badblock_pattern->options
>                         & NAND_BBT_DYNAMICSTRUCT)
>                 kfree(chip->badblock_pattern);
> 
> by moving it to some nand_bbt_release() function.
> 
> I might be pushing some patches to do this, as I think it can be useful
> in general to clean this code.

Sounds like a good idea. That probably can be handled quickly. Feel free
to send patch(es).

Brian
