Received: from smtp-vbr13.xs4all.nl ([194.109.24.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MggN6-0006le-Ik
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 14:54:45 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr13.xs4all.nl (8.13.8/8.13.8) with ESMTP id n7REsaeU079514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 16:54:37 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4A969E2C.7080302@aimvalley.nl>
Date: Thu, 27 Aug 2009 16:54:36 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Mtd List <linux-mtd@lists.infradead.org>
Subject: Interest in making jffs2 physically correct NAND bit-flips
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


First some background:
Unfortunately we have deployed products that have a NAND device
which suffers from bit-flips.
Occasionally uncorrectable bit-flips occur (-EBADMSG) causing
data loss.
We use JFFS2. As known JFFS2 detects and corrects single bit-flips
(per 256 byte subpage) but it doesn't physically correct them
on the NAND device itself.
To prevent further trouble (2 bit-flips in one subpage) we've
made JFFS2 correct NAND bit-flips on the NAND device itself
(and try to upgrade the deployed products a.s.a.p.).

Btw. in our case the bit-flips are caused by a single bits charge loss
causing a programmed 0 to become 1.

I know UBI(FS) already corrects bit-flips on NAND, but it is not an
option for us to upgrade deployed products to another flash fs.
Besides we're using the good old linux-2.4 kernel.

My question is: is there any interest in an mtd-2.6.git patch to make
jffs2 correct NAND bit-flips ?

I'm asking because it is quite some work to forward patch (and test) the
fix to mtd-2.6.git.
Also note that most likely reviews/corrections (code style issues, bugs,
etc..) have to be made (after all I'm not a kernel/mtd developer).
Of course I'm willing to process all corrections/comments/questions
that one may have.

We make jffs2 correct the NAND bit-flips in a couple of (simple) steps:
-1- detect bit-flip and post JEB to a worker_list
-2- process worker_list (in a separate thread) by moving the JEB from
     regular jffs2 list (e.g. dirty_list) to the bad_used list.
-3- trigger JFFS2 GC to process the JEB on the bad_used list

JFFS2 GC does the rest (moving the valid data to another block and
erase the JEB).

The fix can be turned on/off with a kernel config #define.

Since we have quite some static data on the NAND (cached by the kernel)
reading NAND blocks and detecting bit-flips also happens regularly
(by a seperate thread).
We also have a lot of free space (and not a lot of dirty nodes) so
originally GC never got triggered.

Any feedback is welcome.
