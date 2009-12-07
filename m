Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHbm5-0003H5-Vi
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 11:29:12 +0000
Subject: Re: [RFC][PATCH] Add NAND lock/unlock routines
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Dec 2009 13:28:56 +0200
Message-Id: <1260185336.3047.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-07 at 16:36 +0530, Vimal Singh wrote:
> On Mon, Dec 7, 2009 at 2:59 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2009-12-07 at 12:18 +0530, Vimal Singh wrote:
> >> On Fri, Dec 4, 2009 at 2:08 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > Hi, some cosmetic comments:
> >> >
> >> > On Wed, 2009-12-02 at 19:54 +0530, Vimal Singh wrote:
> >> >> I am not sure how useful it will be, but still here is a patch for review.
> >> >> -vimal
> >> >>
> >> >> From: Vimal Singh <vimalsingh@ti.com>
> >> >> Date: Tue, 24 Nov 2009 18:26:43 +0530
> >> >> Subject: [PATCH] Add NAND lock/unlock routines
> >> >>
> >> >> At least 'Micron' NAND parts have lock/unlock feature.
> >> >> Adding routines for this.
> >> >>
> >> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> >> >> ---
> >> >>  drivers/mtd/nand/nand_base.c |  217 +++++++++++++++++++++++++++++++++++++++++-
> >> >>  include/linux/mtd/nand.h     |    6 +
> >> >>  2 files changed, 221 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> >> >> index 2957cc7..e447c24 100644
> >> >> --- a/drivers/mtd/nand/nand_base.c
> >> >> +++ b/drivers/mtd/nand/nand_base.c
> >> >> @@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
> >> >> struct nand_chip *chip)
> >> >>  }
> >> >>
> >> >>  /**
> >> >> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
> >> >> + *
> >> >> + * @param mtd - mtd info
> >> >> + * @param ofs - offset to start unlock from
> >> >> + * @param len - length to unlock
> >> >> + * @invert -  when = 0, unlock the range of blocks within the lower and
> >> >> + *                      upper boundary address
> >> >> + *            whne = 1, unlock the range of blocks outside the boundaries
> >> >> + *                      of the lower and upper boundary address
> >> >> + *
> >> >> + * @return - unlock status
> >> >> + */
> >> >> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
> >> >> +                                     uint64_t len, int invert)
> >> >> +{
> >> >> +     int ret = 0;
> >> >> +     int status, page;
> >> >> +     struct nand_chip *chip = mtd->priv;
> >> >> +
> >> >> +     DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
> >> >> +                     __func__, (unsigned long long)ofs, len);
> >> >> +
> >> >> +     /* Submit address of first page to unlock */
> >> >> +     page = (int)(ofs >> chip->page_shift);
> >> >
> >> > The compiler will automatically cast the result to int I believe.
> >>
> >> I just copied this line from erase functions.
> >> I believe its better to cast here as otherwise we may see compiler warnings.
> >
> > Good point. Could you please create a validation checking helper instead
> > of duplicating code?
> 
> IMHO that should be done in a separate patch.

Right, you can first send this as a separate patch, and then the rest as
a follow up one.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
