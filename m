Received: from reefedge.com ([216.10.14.212] helo=reefedge.reefedge.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AzGR-0008Or-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 20:00:31 +0000
Received: from gwydir (localhost.localdomain [127.0.0.1])
	by reefedge.reefedge.com (8.12.1/8.12.1) with SMTP id fB3K9vAI032258
	for <linux-mtd@lists.infradead.org>; Mon, 3 Dec 2001 15:09:58 -0500
From: "Craig Gwydir" <craig@reefedge.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs v1 - runs out of space...what next?
Date: Mon, 3 Dec 2001 15:14:26 -0500
Message-ID: <BCEMJHKGMLINCAMLMLBFOELLCDAA.craig@reefedge.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

For rather evil purposes, we are using the linux 2.4.16 jffs code on a
read-write filesystem.
Occasionally, I use rsync to update this jffs filesystem then reboot.

A problem occurs when the jffs v1 filesystem becomes full.  The next reboot
of the target displays:

jffs_scan_flash(): did not find even a single chuck of freespace. That is
BAD!
jffs_scan_flash(): free sized accounting screwed
jffs_scan_flash(): free_chukc_size1 == 0xf00000, free_chuck_size2 == 0x0,
                   fmc->free_size == 0x0

JFFS: failed to mount root device
kernel panic: Unable to mount root fs
kdb>

There is only about 12MB on my 16MB flash in use tho.  I believe rsync
created a tmp file
during the transfer of a large file which caused useable space to fill.


Question:

1) Any internal JFFS config settings I can tweak to avoid this condition?
   (Yes, I know, the "don't do that" suggestion works here ;)

2) Has anybody had this condition of jffs running out of space, and they
experience the same
   condition?

Yes, I know I probably should run jffs mounts as real-only since it is
flash.
I thought that jffs v1 was supposed to be robust enough to handle failures,
including
"no space on device" errors.

Thanks,
Craig
