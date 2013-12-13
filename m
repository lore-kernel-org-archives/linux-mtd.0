Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrQey-00030q-K4
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 11:11:58 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Date: Fri, 13 Dec 2013 11:10:10 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E47537@SZXEMA512-MBX.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
 <20131213080118.GC24650@norris-Latitude-E6410>
In-Reply-To: <20131213080118.GC24650@norris-Latitude-E6410>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Quyaxin <quyaxin@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, Dec 13, 2013 at 05:03:49AM +0000, Caizhiyong wrote:
> > From: Cai Zhiyong <caizhiyong@huawei.com>
> > Date: Fri, 13 Dec 2013 12:52:46 +0800
> > Subject: [PATCH] mtd: increase max page/OOB size to support 16K pagesiz=
e NAND.
> >
> > The Toshiba's TC58TEG5DCJTA pagesize is 16K, oob size is 1280 bytes.
> > So increase the NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE.
>=20
> It would help if we had nand_base/nand_ids support for TC58TEG5DCJTA
> before we try to increase NAND_MAX_PAGESIZE and NAND_MAX_OOBSIZE yet
> again. AFAICT, nand_base will not detect new, large Toshiba flash
> properly anyway.

There are a lot of 16K page size NAND, they are used in android system.

Many NAND need read retry and data randomization, kernel does not support t=
his feature.
Kernel also does not support synchronous NAND.
As you know, is someone doing some work to support those feature now?

If Kernel support TC58TEG5DCJTA, the read retry and data randomization also
need be supported, it will be a big project.

>=20
> > Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> > ---
> >  include/linux/mtd/nand.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index f3ea8da..2f0a7f2 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -56,8 +56,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t o=
fs,
> uint64_t len);
> >   * is supported now. If you add a chip with bigger oobsize/page
> >   * adjust this accordingly.
> >   */
> > -#define NAND_MAX_OOBSIZE	744
> > -#define NAND_MAX_PAGESIZE	8192
> > +#define NAND_MAX_OOBSIZE	1280
> > +#define NAND_MAX_PAGESIZE	16384
>=20
> It might be time to draw a line in the sand: next person who needs to
> increase MAX_{PAGE,OOB}SIZE gets the job of killing the macro? We are
> long overdue for dynamic buffer allocation.
>=20
> There are two drivers that use the macros, plus nand_chip.buffers.*. The
> drivers can be weaned off by allocating a small, fixed-size temporary
> buffer for the few tasks that need it. With nand_base.c, I think we can
> get by with waiting to allocate nand_chip.buffers until after we detect
> the writesize/oobsize.
>=20
> So Cai, are you up for this?

Ok, I will try update it.

>=20
> >
> >  /*
> >   * Constants for hardware specific CLE/ALE/NCE function
> >
>=20
> Brian
