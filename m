Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HC5m-00013D-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 23:22:54 +0100
Message-ID: <3B40F5BE.6DC58E3A@daniel.com>
Date: Mon, 02 Jul 2001 17:29:18 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: jffs-dev <jffs-dev@axis.com>
CC: David Woodhouse <dwmw2@infradead.org>,
 	MTD for Linux <linux-mtd@lists.infradead.org>,
 	elw_dev_list@embeddedlinuxworks.com
Subject: Update on JFFS2 jitter tests
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

Ok folks, here is the latest that I have on the JFFS2 Jitter tests that
I've been doing:

To recap there are two things that I found:

1. If a task is writing to the JFFS2 fs, then it can be blocked for
"A_LARGE_TIME_SECS". How long this is is highly dependent on the speed
of the underlying platform + the type of data on the JFFS2 fs. If the
data is highly compressed, then the time is larger.
On a 486DX4 133 processor (approx 61VAX MIPS), the block time can be as
large as 8 seconds for (mostly) incompressible data and > 40seconds for
compressible data!

This result still stands (in agreement with what I reported earlier).

2. I had originally reported that "other" RT tasks not interacting with
JFFS2 also get blocked for a VARY_LARGE_TIME_SECS. This is
NOT NECESSARILY TRUE.

I was running the task filling up the JFFS2 fs as a POSIX real time
SCHED_FIFO/SCHED_RR task (behavior is same with both?). This was causing
the
GC in the write() to JFFS2 to happen with the priority of the RT task,
thus blocking my "other" task. My bad for this one!

On further tests, with a POSIX RT SCHED_RR task NOT INTERACTING with
JFFS2, and a "regular" linux user task filling up the JFFS2 fs, I found
that the
worst case block (jitter) for the RT task was from ~50ms to ~130ms. This
was again dependent on the type and amount of compressible data on the
JFFS2 fs.

This is different from what I had earlier reported and quite acceptable
from a system standpoint.

I think that we still need to, if we can, speed up the GC process so
that the block times for tasks writing to JFFS2 go down. Block times as
high as 8+ seconds
are IMHO not very palatable.

David, this is also with the rev 1.49 scan.c + nodemgmt.c and erase.c
patched with the two patches you sent me last weekend.

Vipin
