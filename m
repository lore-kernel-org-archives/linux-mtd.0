Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoLbf-00053L-EE
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 01:20:52 +0000
Received: by padhk11 with SMTP id hk11so3401385pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2015 18:20:31 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:20:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 3/3] mtd: tests: introduce a erase test
Message-ID: <20151020012028.GE13239@google.com>
References: <20150930002958.GC143959@google.com>
 <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1443574881-12319-4-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151020011813.GD13239@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151020011813.GD13239@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 19, 2015 at 06:18:13PM -0700, Brian Norris wrote:
> + others

really +others this time!

> On Wed, Sep 30, 2015 at 09:01:21AM +0800, Dongsheng Yang wrote:
> > This test will test the below cases.
> > 
> > Positive case:
> > 	* erase all good block. (positive case)
> > Negative case:
> > 	* addr >= mtd size
> > 	* addr + size > mtd size
> > 	* unaligned addr
> > 	* unaligned size
> > 
> > Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> > ---
> >  drivers/mtd/tests/Makefile    |   2 +
> >  drivers/mtd/tests/erasetest.c | 158 ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 160 insertions(+)
> >  create mode 100644 drivers/mtd/tests/erasetest.c
> 
> I don't think we're planning on adding any new tests here, unless
> they provide real, significant benefit over equivalent tests in user
> space. And I think this test can be done pretty easily in user space.
> 
> Try porting this to mtd-utils instead. We will probably be doing
> improvements there and (eventually?) porting the in-kernel tests there
> too. We'll probably want at least a new subdirectory under tests/. Stay
> tuned.
> 
> > diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
> > index 937a829..1308b62 100644
> > --- a/drivers/mtd/tests/Makefile
> > +++ b/drivers/mtd/tests/Makefile
> > @@ -1,6 +1,7 @@
> >  obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
> >  obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
> >  obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
> > +obj-$(CONFIG_MTD_TESTS) += mtd_erasetest.o
> >  obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
> >  obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
> >  obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
> > @@ -11,6 +12,7 @@ obj-$(CONFIG_MTD_TESTS) += mtd_nandbiterrs.o
> >  mtd_oobtest-objs := oobtest.o mtd_test.o
> >  mtd_pagetest-objs := pagetest.o mtd_test.o
> >  mtd_readtest-objs := readtest.o mtd_test.o
> > +mtd_erasetest-objs := erasetest.o mtd_test.o
> >  mtd_speedtest-objs := speedtest.o mtd_test.o
> >  mtd_stresstest-objs := stresstest.o mtd_test.o
> >  mtd_subpagetest-objs := subpagetest.o mtd_test.o
> > diff --git a/drivers/mtd/tests/erasetest.c b/drivers/mtd/tests/erasetest.c
> > new file mode 100644
> > index 0000000..5c5827a
> > --- /dev/null
> > +++ b/drivers/mtd/tests/erasetest.c
> > @@ -0,0 +1,158 @@
> > +/*
> > + * Copyright (C) 2015 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms of the GNU General Public License version 2 as published by
> > + * the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program; see the file COPYING. If not, write to the Free Software
> > + * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> 
> FYI, checkpatch.pl complains about including the FSF mailing address
> these days. It's not necessary, and it's potentially misleading if they
> move.
> 
> > + *
> > + * Check MTD device erase.
> > + *
> > + * Author: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/err.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/slab.h>
> > +#include <linux/sched.h>
> > +
> > +#include "mtd_test.h"
> > +
> > +static int dev = -EINVAL;
> > +module_param(dev, int, S_IRUGO);
> > +MODULE_PARM_DESC(dev, "MTD device number to use");
> > +
> > +static struct mtd_info *mtd;
> > +static unsigned char *bbt;
> > +
> > +static int pgsize;
> > +static int ebcnt;
> > +static int pgcnt;
> > +
> > +static int __init mtd_erasetest_init(void)
> > +{
> > +	uint64_t tmp;
> > +	int err;
> > +
> > +	printk(KERN_INFO "\n");
> > +	printk(KERN_INFO "=================================================\n");
> > +
> > +	if (dev < 0) {
> > +		pr_info("Please specify a valid mtd-device via module parameter\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pr_info("MTD device: %d\n", dev);
> > +
> > +	mtd = get_mtd_device(NULL, dev);
> > +	if (IS_ERR(mtd)) {
> > +		err = PTR_ERR(mtd);
> > +		pr_err("error: Cannot get MTD device\n");
> > +		return err;
> > +	}
> > +
> > +	if (mtd->writesize == 1) {
> > +		pr_info("not NAND flash, assume page size is 512 "
> > +		       "bytes.\n");
> > +		pgsize = 512;
> > +	} else
> > +		pgsize = mtd->writesize;
> > +
> > +	tmp = mtd->size;
> > +	do_div(tmp, mtd->erasesize);
> > +	ebcnt = tmp;
> > +	pgcnt = mtd->erasesize / pgsize;
> > +
> > +	pr_info("MTD device size %llu, eraseblock size %u, "
> > +	       "page size %u, count of eraseblocks %u, pages per "
> > +	       "eraseblock %u, OOB size %u\n",
> > +	       (unsigned long long)mtd->size, mtd->erasesize,
> > +	       pgsize, ebcnt, pgcnt, mtd->oobsize);
> > +
> > +	err = -ENOMEM;
> > +	bbt = kzalloc(ebcnt, GFP_KERNEL);
> > +	if (!bbt)
> > +		goto out;
> > +	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
> > +	if (err)
> > +		goto out;
> > +
> > +	/* Case.1 Erase all good eraseblocks */
> > +	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
> > +	if (err)
> > +		goto out;
> > +
> > +	/* Case.2 addr >= mtd->size */
> > +	err = mtdtest_erase(mtd, mtd->size, mtd->erasesize, 1);
> 
> Just FYI: some of these checks are hard-coded into the MTD API now, so
> it's guaranteed an MTD will pass these. But you're still free to test
> it.
> 
> > +	if (err != -EINVAL) {
> > +		pr_err("error: erasing (addr = mtd->size = %llu): it return %d, But expected %d.",
> 
> The capitalization and grammar could be improved (though we still don't
> need complete sentences). e.g.:
> 
>   "returned %d, but expected %d\n"
> 
> (you're also missing the trailing newline '\n' on all of these messages)
> 
> > +			mtd->size, err, -EINVAL);
> > +		err = -EIO;
> > +		goto out;
> > +	}
> > +
> > +	/* Case.3 addr + size > mtd->size */
> > +	err = mtdtest_erase(mtd, mtd->size, mtd->erasesize * 2, 1);
> > +	if (err != -EINVAL) {
> > +		pr_err("error: erasing (addr + size = %llu > mtd->size = %llu): it return %d, But expected %d.",
> > +			mtd->size + mtd->erasesize * 2, mtd->size , err, -EINVAL);
> > +		err = -EIO;
> > +		goto out;
> > +	}
> > +
> > +	/* Case.4 unaligned addr */
> > +	err = mtdtest_erase(mtd, mtd->erasesize / 2, mtd->erasesize, 1);
> > +	if (err != -EINVAL) {
> > +		pr_err("error: erasing unaligned addr: %llu (erasesize: %u): it return %d, But expected %d.",
> > +			((loff_t)mtd->erasesize) / 2, mtd->erasesize, err, -EINVAL);
> > +		err = -EIO;
> > +		goto out;
> > +	}
> > +	
> > +	/* Case.5 unaligned size */
> > +	err = mtdtest_erase(mtd, mtd->erasesize, mtd->erasesize / 2, 1);
> > +	if (err != -EINVAL) {
> > +		pr_err("error: erasing unaligned size: %u (erasesize: %u): it return %d, But expected %d.",
> > +			mtd->erasesize / 2, mtd->erasesize, err, -EINVAL);
> > +		err = -EIO;
> > +		goto out;
> > +	}
> > +
> > +	err = 0;
> > +	if (err)
> > +		pr_info("finished with errors\n");
> > +	else
> > +		pr_info("finished\n");
> > +
> > +out:
> > +	kfree(bbt);
> > +	put_mtd_device(mtd);
> > +	if (err)
> > +		pr_info("error %d occurred\n", err);
> > +	printk(KERN_INFO "=================================================\n");
> > +	return err;
> > +}
> > +module_init(mtd_erasetest_init);
> > +
> > +static void __exit mtd_erasetest_exit(void)
> > +{
> > +	return;
> > +}
> > +module_exit(mtd_erasetest_exit);
> > +
> > +MODULE_DESCRIPTION("Erase test module");
> > +MODULE_AUTHOR("Dongsheng Yang");
> > +MODULE_LICENSE("GPL");
> 
> Overall, I'm not sure if this test is really that useful. It does a few
> sanity checks on the API, but it doesn't really test the erase function
> itself. If anyone else thinks this test is interesting though, I suppose
> there's not much harm in putting it into mtd-utils tests/.
> 
> Brian
