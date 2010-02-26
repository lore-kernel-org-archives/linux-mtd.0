Subject: Re: [PATCH - V2] Add NAND lock/unlock routines
From: David Woodhouse <dwmw2@infradead.org>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5791001130125ka4bfa26s906758545e679792@mail.gmail.com>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
	<1260185336.3047.0.camel@localhost>
	<ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
	<ce9ab5791001060548g6075dcd5tb15bcd18c9a4b458@mail.gmail.com>
	<1263372005.2917.21.camel@localhost>
	<ce9ab5791001130125ka4bfa26s906758545e679792@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Feb 2010 12:47:40 +0000
Message-ID: <1267188460.30247.10811.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-13 at 14:55 +0530, Vimal Singh wrote:
> 
> >> @@ -2999,8 +3211,8 @@ int nand_scan_tail(struct mtd_info *mtd)
> >>       mtd->read_oob = nand_read_oob;
> >>       mtd->write_oob = nand_write_oob;
> >>       mtd->sync = nand_sync;
> >> -     mtd->lock = NULL;
> >> -     mtd->unlock = NULL;
> >> +     mtd->lock = nand_lock;
> >> +     mtd->unlock = nand_unlock;
> >
> > What makes you believe it is safe to assign these call-backs here?
> >
> > AFAICS, this means it will be done for all flashes. Do all of them
> > support lock/unlock? I did not investigate this, but I think that
> > probably not.
> 
> OK. In that case I'll rather not do it here and do it in my specific
> driver.

Hm, I'm not sure that's the best approach. It's a function of the NAND
chip, not the controller. We should detect the presence of the feature
from the chip ID, if at all possible.

I'm happy with your first two patches as part of a three-patch set
though. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
