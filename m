Received: from mail-iw0-f172.google.com ([209.85.214.172])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PRPPY-0004k7-55
	for linux-mtd@lists.infradead.org; Sat, 11 Dec 2010 13:22:52 +0000
Received: by iwn40 with SMTP id 40so7494668iwn.31
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Dec 2010 05:22:50 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 11 Dec 2010 21:22:50 +0800
Message-ID: <AANLkTi=-L0DuQziSkzzock8LOJEDY2z37t2bLWQQ_YXG@mail.gmail.com>
Subject: About MTD Testing suite included in the Linux kernel.
From: os user <gnusercn@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When I work on MTD testing tool (drivers/mtd/tests) included in the
Linux kernel, I found a problem.
For mtd_oobtest, I failed at the testing '4 of 5'. This testing case
will test 'reading past the device'.

Since for my Nandflash controller, no special function is provided for
reading OOB, I looked into the standard implementation 'nand_do_read_oob'.
The logic below seems a little bit confusing for me,

/* Do not allow reads past end of device */
       if (unlikely(from >= mtd->size ||
                    ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
                                       (from >> chip->page_shift)) * len)) {
               DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
                                       "of device\n", __func__);
               return -EINVAL;
       }


In mtd_oobtest program, the testing code looks like,

/* Attempt to read off end of device */
               ops.mode      = MTD_OOB_AUTO;
               ops.len       = 0;
               ops.retlen    = 0;
               ops.ooblen    = mtd->ecclayout->oobavail + 1;
               ops.oobretlen = 0;
               ops.ooboffs   = 0;
               ops.datbuf    = NULL;
               ops.oobbuf    = readbuf;
               printk(PRINT_PREF "attempting to read past end of device\n");
               printk(PRINT_PREF "an error is expected...\n");
               err = mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops);
               if (err) {
                       printk(PRINT_PREF "error occurred as expected\n");
                       err = 0;
               } else {
                       printk(PRINT_PREF "error: read past end of device\n");
                       errcnt += 1;
               }

It seems, according to the logic in MTD testing suite, MTD should
return an error. But I do not observed any error reported.

Could anyone please have a look at the two code pieces and tell me which
side needs a modification?

Thanks.

BR
