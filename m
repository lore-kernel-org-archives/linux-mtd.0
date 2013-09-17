Received: from s250.sam-solutions.net ([217.21.49.219])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLpMD-0005FG-NJ
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 07:05:58 +0000
Received: from s246.sam-solutions.net ([217.21.35.55])
 by s250.sam-solutions.net with esmtps (TLSv1:RC4-MD5:128) (Exim 4.77)
 (envelope-from <A.Andreyanau@sam-solutions.com>) id 1VLpLl-0000e1-Qs
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 10:05:29 +0300
Message-ID: <5237FE9A.5080707@sam-solutions.com>
Date: Tue, 17 Sep 2013 10:02:50 +0300
From: Andrei Andreyanau <a.andreyanau@sam-solutions.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Incorrect detection of Micron MT29F32G08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I've faced a problem with the Micron NAND MT29F32G08,
which is 4GiBs, 8K blocks per LUN, 224b OOB, 512K erase size,
has two planes 4k blocks each. In the kernel (I use v3.0.35)
it is detected as 2GiB device. Only when I disable part of the
code which belongs to ONFI detection, add definition for this
device in nand_ids.c (device has id=0x48), add 224b OOB table,
I can see that it's a 4GiBs device, but when I'm trying formatting
the largest partition (I have 4 partitions - barebox, env, kernel,
rootfs <- the largest) - it drops an I/O error about bad blocks
(I did scan and mark all bad blocks before)...
It seems to me that the amount of pages per lun is not detected
correctly which leads to incorrect detection of device's size etc. Bad
thing is that the datasheet for a/m NAND doesn't contain what
are the values from NAND-device registers mean (or I missed something).
Could you please suggest where to dig?

Thanks in advance,
Andrei Andreyanau
