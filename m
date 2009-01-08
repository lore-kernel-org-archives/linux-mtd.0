Received: from ns6.sharp.co.jp ([202.32.86.16])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKiSy-0007dT-SO
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 00:09:41 +0000
Received: from at15.sharp.co.jp (unknown [10.76.9.63])
	by ns6.sharp.co.jp (Postfix) with ESMTP id 46C2417A02A8
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jan 2009 09:09:35 +0900 (JST)
Received: from at15 (localhost.localdomain [127.0.0.1])
	by at15.sharp.co.jp (Postfix) with SMTP id 2EFA98B0E88
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jan 2009 09:09:35 +0900 (JST)
Received: from vt12.sharp.co.jp (unknown [127.0.0.1])
	by vt12.sharp.co.jp (Symantec Mail Security) with ESMTP id 316E96D802E
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jan 2009 09:09:32 +0900 (JST)
Received: from mta03.sharp.co.jp (unknown [10.76.2.133])
	by vt12.sharp.co.jp (Symantec Mail Security) with ESMTP id 21787688001
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Jan 2009 09:09:32 +0900 (JST)
From: "Shigeru Moriwake" <moriwake.shigeru@sharp.co.jp>
To: <linux-mtd@lists.infradead.org>
Subject: [BUG][MTD] number of bytes returned in mtd_oob_buf.start instead of
	length in MEMREADOOB.
Date: Thu, 8 Jan 2009 09:09:29 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20090108000931.DFF4449D1B8@mta03.sharp.co.jp>
Cc: kajiwara.yoshiaki@sharp.co.jp, kimura.kenichi@sharp.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I found what looks like a bug in MEMREADOOB ioctl introduced in 2.6.8.  Can
anybody confirm this?

The API reads the OOB, and return the data and number of bytes read, in
struct mtd_oob_buf.  However, the number of bytes goes into
mtd_oob_buf.start instead of mtd_oob_buf.length in the current code.

This bug is not in MEMWRITEOOB, or kernels prior to 2.6.8-rc1-bk8.  I was
not able to locate the specific mail which introduced this bug.

The argument to put_user() points to the head of mtd_oob_buf, which is
member start.  The member length is at an offset, so the fix is below.

--- drivers-mtd-mtdchar.c.orig  2009-01-07 17:35:18.000000000 +0900
+++ drivers-mtd-mtdchar.c       2009-01-07 17:42:36.000000000 +0900
@@ -579,17 +579,17 @@

                ops.oobbuf = kmalloc(buf.length, GFP_KERNEL);
                if (!ops.oobbuf)
                        return -ENOMEM;

                buf.start &= ~(mtd->oobsize - 1);
                ret = mtd->read_oob(mtd, buf.start, &ops);

-               if (put_user(ops.oobretlen, (uint32_t __user *)argp))
+               if (put_user(ops.oobretlen, (uint32_t __user *)(argp + 
+ offsetof(mtd_oob_buf, length))))
                        ret = -EFAULT;
                else if (ops.oobretlen && copy_to_user(buf.ptr, ops.oobbuf,
                                                    ops.oobretlen))
                        ret = -EFAULT;

                kfree(ops.oobbuf);
                break;
        }
----

Thanks,
Shigeru Moriwake
