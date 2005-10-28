Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EVZ80-0002BT-T6
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 19:39:02 +0100
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9SIcrvd027093
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 14:38:53 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9SIcruX121366
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 14:38:53 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j9SIcr1q019432
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 14:38:53 -0400
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.129])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j9SIcqvJ019161
	for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2005 14:38:53 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 28 Oct 2005 13:38:49 -0500
Message-Id: <1130524729.3775.39.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'll preface this with a disclaimer that we saw this on 2.4, however the
same general issue still seems to be present in MTD CVS.

We recently had an issue where we were getting some poor write
performance to flash through JFFS2.  Specifically, a write of about
256KiB was taking between 20-50 seconds at times.  After debugging this
for a couple days, we realized the following was happening:

Kupdated woke up and started erasing blocks on JFFS2's erase_pending
list.  The application writing continued to write in 256KiB chunks.  In
do_write_buffer, the chip is put into FL_WRITING mode and then
cfi_udelay(1) is called, which will call schedule_timeout if needed.

Here is where the difficult part comes in.  Kupdated got scheduled in
due to the wake_up at the end of do_write_buffer, but since the chip was
in FL_WRITING mode, it couldn't make any progress and got stuck on the
wait queue again.  So then the writing thread came in and finished it's
write, and called wake_up again.  But wake_up doesn't actually call
schedule, so the writing thread called do_write_buffer again with the
next chunk of data to be written and it wasn't scheduled out until
cfi_udelay was called after putting the chip into FL_WRITING state
again.  Repeat this until the overall 256KiB write was done.

Basically, the writing thread was starving kupdated from making any
progress and since kupdated was never charged with any time, the writing
thread was always being marked as needing to be scheduled in the wake_up
code.  This cause it to do a schedule_timeout(1) every buffer write (32
bytes).  In 2.4, that's approximately 10 milliseconds of wait time
because it's based on jiffies.

For a fix, we added a conditional reschedule in the loop that calls
do_write_buffer in the cfi_intelext_write_buffers function.  This made
write times of 256KiB go from 20-50 seconds to 1-6 seconds on average.

In 2.6 the problem is a bit less drastic since HZ is 1000 (or was at one
point) which means each jiffy is 1 ms instead of 10.  Also, you'd have
to be writing a _lot_ of data to probably see this happen.  But the fact
remains that it is possible.

Would adding a conditional reschedule be an acceptable fix?

josh
