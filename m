Received: from mg02.austin.ibm.com ([192.35.232.12])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZeWk-00059w-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 22:27:34 +0100
Received: from austin.ibm.com (netmail2.austin.ibm.com [9.3.7.139])
	by mg02.austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id QAA63530
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 16:28:30 -0500
Received: from popmail.austin.ibm.com (popmail.austin.ibm.com [9.53.247.178])
	by austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id QAA17154
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 16:27:32 -0500
Received: from mahi190.austin.ibm.com (mahi190.austin.ibm.com [9.3.154.190]) by popmail.austin.ibm.com (AIX4.3/8.9.3/8.7-client1.01) with ESMTP id QAA24590 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 16:27:31 -0500
Subject: "Read-only file system" error while writing
From: Stephen Hui <gromit1463@mailworks.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 30 Jul 2002 16:27:23 -0500
Message-Id: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I have a set of STMicro flash chips (M28W320CT) that use the Intel
Extended CFI command set (0001), and I'm using kernel 2.4.2.  I can
partition the chips, lock and unlock the chips, erase the chips and read
from (dd) the chips perfectly fine.

When I write to the chips using either cat, dd, stdout redirection, or
cp, the CFI driver complains of attempting to write to a "Read-only file
system", even after unlocking all blocks in the partition and erasing
the partition.  I can mount /dev/mtdblock*, but mount complains and I
still can't put anything into the mounted partition.  do_write_buffer()
in cfi_cmdset_0001.c is returning the error (EROFS).

All I want to do is put a JFFS2 image onto the partition and be able to
erase and update the image later.

I've scoured the list archive back about a year, but haven't found
anything like the problem I'm experiencing.  Would it be worth my while
to backport cfi_cmdset_0001.c from a later kernel rev (2.4.18 or
2.4.17), besides to get the bug fix in do_write_buffer() (the one posted
to this list a little while ago)?  I diff'ed the 2.4.2 cfi_cmdset_0001.c
with a 2.4.18 and didn't see any really major differences between the
two.  Or could the bug in do_write_buffer() have something to do with
this?

Thanks in advance,
Stephen.


-- 
"Find out what you've been missing while you've been
rebooting Windows NT." -- Infoworld on Linux

http://www.ao.com/~regan/penguins/tux.html
