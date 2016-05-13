Received: from borkhuis.xs4all.nl ([212.238.181.189] helo=borkhuis.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b18fg-0001j8-P0
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 08:42:09 +0000
Received: from www.borkhuis.com (localhost [127.0.0.1])
 by borkhuis.com (8.14.3/8.14.3/Debian-9.1ubuntu1) with ESMTP id u4D8llY8029100
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2016 10:47:47 +0200
Message-ID: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
Date: Fri, 13 May 2016 10:47:47 +0200
Subject: UBIFS automatic recovery
From: "Johan Borkhuis" <maillist@borkhuis.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On our current system we had some issues with corrupted file systems after
power failures. The system is a TI AM3517 with kernel 2.6.37 and the
backport of UBIFS. The system had one partition, so when the file system
is corrupted the system cannot boot any more.

To improve I change the layout:
- UBI0: 2 partitions, ubi0_0 (rootfs) and ubi0_1 (application), both
read-only
- UBI1: 2 partitions, ubi1_0 (settings) and ubi1_1 (logging)

To test how good this is working I wrote a test application to have a lot
of disk-I/O on the logging partition. Now I cut the power every minute.
I see the erase-counters increase quite fast on UBI1, but UBI0 stays at
the same value (which is what I was looking for)

Once in a while this test results in an error on one of the UBI1
partitions (both settings and logging). The partition cannot be mounted
any more. I can fix this using ubiupdatevol, but I loose the data on this
partition. This was expected and works quite well, the system is always
accessible.

However, when I continue to pull the power on a system with a broken
partition (without running the test-application, this is only started when
all partitions are mounted correctly) after some time (this can be a few
reboots, or a couple of 100 reboots) the system fixes the partition
itself, and I can access the data again, without any indications in the
log.

When it fails it shows the following during a mount (also shown sometimes
for LEB 3 and 6):
UBIFS: recovery needed
UBIFS error (pid 640): ubifs_recover_log_leb: unrecoverable log corruption
in LEB 5

Another UBIFS message I see during a failed mount is:
UBIFS error (pid 637): ubifs_recover_master_node: dumping first master node

As long the mount fails the same message is repeated.

But the first time it succeeds again I get the following output when
mounting:
UBIFS: recovery needed
UBIFS: recovery completed

Now my question is if there is a process in the background that fixes the
problem. If this is the case, how can I trigger or help this process, so
that it will fix the problem on the first time the problem is detected.

Or is there another way to fix/repair a broken partition without loosing
the data that is stored on it?

Regards,
    Johan
