Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F15m-0006sn-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 23:13:54 +0100
Message-ID: <3B390B4C.65A5DB68@daniel.com>
Date: Tue, 26 Jun 2001 17:23:08 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>,
 	MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Problems with JFFS2/MTD upgrade to latest in CVS.
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

Hmm, I upgraded from an <older> version (before the dir change)of JFFS2
& MTD (that I've been testing) to the latest one in CVS
and to the 2.4.5 kernel.

When I mounted my JFFS2 flash partition again, I got the following on
the console.
Now the system periodically does not respond for multiple "seconds" to
CR's on the bash prompt.

What's going on?

Vipin


jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with
0x00031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00080000 ends at 0x00080000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x000c0000 ends at 0x000c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00100000 ends at 0x00100000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00140000 ends at 0x00140000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00180000 ends at 0x00180000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x001c0000 ends at 0x001c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00200000 ends at 0x00200000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00240000 ends at 0x00240000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00280000 ends at 0x00280000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x002c0000 ends at 0x002c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00300000 ends at 0x00300000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00340000 ends at 0x00340000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00380000 ends at 0x00380000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x003c0000 ends at 0x003c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00400000 ends at 0x00400000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00440000 ends at 0x00440000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00480000 ends at 0x00480000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x004c0000 ends at 0x004c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00500000 ends at 0x00500000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00540000 ends at 0x00540000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00580000 ends at 0x00580000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x005c0000 ends at 0x005c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00600000 ends at 0x00600000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00640000 ends at 0x00640000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00680000 ends at 0x00680000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x006c0000 ends at 0x006c0000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00700000 ends at 0x00700000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00740000 ends at 0x00740000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00780000 ends at 0x00780000 (with
0x20031985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x007c0000 ends at 0x007c0000 (with
0x00031985)! Marking dirty
Waiting for chip to read, status = 4
Waiting for chip to read, status = 4
Waiting for chip to read, status = 7
Waiting for chip to read, status = 4
Waiting for chip to read, status = 7
Waiting for chip to read, status = 4
Waiting for chip to read, status = 4
Waiting for chip to read, status = 4
....
....
....
