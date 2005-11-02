Received: from over.ny.us.ibm.com ([32.97.182.150] helo=pokfb.esmtp.ibm.com)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EXKuv-0008Lz-8r
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 15:52:50 +0000
Received: from e35.co.us.ibm.com (e35.boulder.ibm.com [9.17.249.45])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id jA2Fq4wJ013136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 2 Nov 2005 10:52:04 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.12.11/8.12.11) with ESMTP id jA2FpB3S019972
	for <linux-mtd@lists.infradead.org>; Wed, 2 Nov 2005 10:51:11 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	jA2FpBrq522440
	for <linux-mtd@lists.infradead.org>; Wed, 2 Nov 2005 08:51:11 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	jA2FpAU0027716
	for <linux-mtd@lists.infradead.org>; Wed, 2 Nov 2005 08:51:10 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 02 Nov 2005 09:50:58 -0600
Message-Id: <1130946658.4348.26.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-10-28 at 18:04 -0400, Nicolas Pitre wrote:
> 
> But current code has almost same behavior:

> And therefore I wonder if what you saw could occur with that version as 
> well.

Ok, here is a pseduo-description of the problem.  Sorry for the delay in
my reply, I've been trying to verify that it still exists in 2.6.  The
answer is "I think so" ;).

The basic issue is a starvation/contention issue on the flash chip
itself.  Assume you have 2 process.  Process A is writing a large chunk
of data to flash.  Process B is doing a read, erase, or some other
operation to the same chip.

In do_write_buffer, A puts the chip in FL_WRITING and then calls
cfi_udelay.  Assume A is scheduled out at this point and B is scheduled
in.  Process B attempts to get the chip to perform it's operation and
finds it can't because the state is FL_WRITING.  It is put on the chip
wait queue and scheduled out.

Process A resumes and finishes it's write.  At the end of
do_write_buffer, it places the chip state to FL_STATUS and calls
put_chip which calls wake_up on the chip's wait queue.  However, wake_up
does not actually call schedule, it just puts process B on the run
queue.  Process A is still the running thread at this point.

The wake_up also goes and recalculates the priorities of both process A,
and process B.  Since process B hasn't made any progress, it's priority
is better than that of A and A is marked as needing rescheduling.

As process A is still running, do_write_buffer returns and is
immediately called again by cfi_intelext_writev.  do_write_buffer then
puts the chip back in FL_WRITING can the same cycle repeats.

By adding a cond_resched after the do_write_buffer call in
cfi_intelext_writev, it allows the writing process to be scheduled out
and leave the chip in a state that is usable by other processes.

As I said, we did this in our kernel and it decreased write times quite
a bit in scenarios where we had such contention.  Namely when large
writes are being done (think 16MiB total in chunks of 256KiB).  In 2.6,
the problem is not quite so drastic as the sleep time of the writing
process is less due to a higher HZ value.  However, the general problem
does seem to exist.

Hope that is a bit more clear.  The problem itself is pretty icky, so
feel free to ask questions.

josh
