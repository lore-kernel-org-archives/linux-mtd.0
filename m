Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FlmD-000128-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2001 01:04:49 +0100
Message-ID: <3B3BC857.7FB81774@daniel.com>
Date: Thu, 28 Jun 2001 19:14:15 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>,
 	MTD for Linux <linux-mtd@lists.infradead.org>,
 	elw_dev_list@embeddedlinuxworks.com
Subject: JFFS2 is broken
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

For all practical purposes, JFFS2, in its present form, IMHO,  is
broken.

I've been doing a lot of "jitter" or "blocking" time testing for various
tasks running on a system where there is JFFS2 activity going on (info
for those that have not been following my posts).

Here are the results:

Task interacting with JFFS2 fs directly. JFFS2 compression enabled. (the
latest code in CVS):

Worst case jitter on a POSIX real time task interacting with
JFFS2~>30*seconds*

POSIX RT Tast NOT directly interacting with JFFS2. JFFS2 compression
enabled, but another task reading/writing to JFFS2 system.

Worst case jitter on *task NOT interacting with JFFS2* ~>30 seconds!
(same for task interacting with JFFS2).

Ok, so I turned compression off (hacked the code. There is no option to
do this).

Worst case jitter on task interacting with JFFS2, ~>4 seconds! Quite am
improvement!

Worst case jitter on task NOT interacting with JFFS2, ~>4seconds! :(

So, in other words, if you use JFFS2 in your embedded system, you cannot
expect a guranteed response to anything in less than 30 seconds if you
use the stock code.
If you turn compression off, that time is ~4 seconds.

Note that these times are HIGHLY system speed dependent. My test system
is a AMD SC520 (486 DX4 w/16MB L1 cache) @133MHz w/ 64MB 66MHz SDRAM.
(~61 VAX MIPS). 8MB of AMD flash connected 32 bits wide.

The problem is that JFFS2 tries to be a good guy and tries its hand at
GC'ing dirty flash, _from within a write() system call_

Now, I don't know if this can be made schedulable or not, but at this
time, *all other* activity in the system stops.
When the GC is complete, life resumes as before, but more than 30-40
seconds may have elapsed.

To test my hypothesis, I hacked the code, to refuse to try to GC from
within a write() to the JFFS2 fs. all GC is now done by the gc thread
(as it should).
In the compression turned off case, my block times for the task not
interacting with JFFS2 WENT DOWN TO 49.9 *ms* worst case, with the test
going
from an empty JFFS2 to a completely full JFFS2 fs (as in all cases
above).

Unfortunately, there is a problem with this approach. If write() cannot
find space and now we refuse to GC inside the write and return with
-ENOSPC, a lot of stock programs may break. I am returning -ENSPC
because I just didn't take the time to figure out how to return 0, which

IMHO is the right thing to do.

Under POSIX write() can return 0, and it not be an error. The system is
not ready for the write yet- exactly as in our case.
However, I think stock programs will break with this too.

The only solution, that I think will work, is to find a way to block the
write() to JFFS2 but allow kernel schedduling to go on. I really don't
know
if this is possible under Linux as it exists today, maybe someone else
can answer this question.

Comments welcome

Vipin
