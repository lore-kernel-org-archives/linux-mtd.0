Received: from nwd2mail10.analog.com ([137.71.25.55])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IV1jL-0007vi-VH
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 05:08:27 -0400
Subject: Re: [PATCH try #2] Blackfin on-chip NAND Flash Controller driver
From: Bryan Wu <bryan.wu@analog.com>
To: dedekind@infradead.org
In-Reply-To: <1189499707.14370.107.camel@sauron>
References: <1188885450.7074.7.camel@roc-laptop>
	<1189144341.14370.77.camel@sauron>
	<1189417837.28956.9.camel@roc-desktop>
	<1189499707.14370.107.camel@sauron>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 11 Sep 2007 17:04:47 +0800
Message-Id: <1189501487.12074.11.camel@roc-desktop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, Mike Frysinger <vapier.adi@gmail.com>,
	linux-kernel@vger.kernel.org, Robin Getz <rgetz@blackfin.uclinux.org>,
	linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-09-11 at 11:35 +0300, Artem Bityutskiy wrote:
> Hi,
> 
> On Mon, 2007-09-10 at 17:50 +0800, Bryan Wu wrote:
> > Here is the test log, only 2 errors in oobtest. After digging into the
> > mtd-nand driver code, it should be no relation to my bf5xx_nand driver.
> > Maybe somethings wrong in the mtd-nand code. I intend to get some help
> > from you, please see my test log below:
> 
> > oobtest: Attempting to read past end of device
> > oobtest: An error is expected...
> > oobtest: error: read past end of device
> 
> This means that MTD did not return an error when the test tried to read
> the last NAND page's OOB. Here is the code:
> 
> /* Attempt to write off end of device */
> ops.mode      = MTD_OOB_AUTO;
> ops.ooblen    = mtd->ecclayout->oobavail + 1;
> ops.oobbuf    = writebuf;
> printk(PRINT_PREF "Attempting to write past end of device\n");
> printk(PRINT_PREF "An error is expected...\n");
> err = mtd->write_oob(mtd, mtd->size - mtd->writesize, &ops);
> 
> So we read OOB size + 1 byte from the last NAND page and get no error.
> 

Yes, it makes sense.

> This test passes for nandsim, so I'm not sure the problem is in the
> generic code. On the other hand, it is generic code which should check
> rages.

Actually, I debugged both oobtest.c and drivers/mtd/nand/nand_base.c

in the kernel nand_base.c
mtd->read_oob() --> nand_read_oob() --> nand_do_read_oob() -->
chip->ecc.read_oob() --> nand_read_oob_std() --> chip->read_buf() -->
bf5xx_nand.c bf5xx_nand_dma_read_buf().

In the calling path, rage check should not be in my driver code
bf5xx_nand_dma_read_buf() like other low level nand controller drivers.
It is already in nand_do_read_oob() as below:

---
	/* Do not allow reads past end of device */
	if (unlikely(from >= mtd->size ||
		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
					(from >> chip->page_shift)) * len)) {
		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
			"Attempt read beyond end of device\n");
		return -EINVAL;
	}
---

maybe this condition testing does not include your case. I am not sure,
still busy at other task.

> > oobtest: Attempting to write past end of device
> > oobtest: An error is expected...
> > nand_write_oob: Attempt to write past end of page
> > oobtest: Error occurred as expected
> > oobtest: Attempting to read past end of device
> > oobtest: An error is expected...
> > oobtest: error: read past end of device
> 
> Similar.
> 
> > I plan to do the torture test after this oobtest passed. And this
> > nand_test suites are intended to integrated into our Blackfin
> > uClinux-dist testsuites.
> 
> We are planning to clean up the tests and submit them for kernel
> inclusion some day, when we have time.
> 

Good news. Thanks
Best Regards,
- Bryan Wu
