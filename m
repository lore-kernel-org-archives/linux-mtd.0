Received: from law14-oe42.law14.hotmail.com ([64.4.20.100] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Vnhh-00027t-Pt
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 08:31:29 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 25 Jun 2003 19:53:49 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE42JsaJbqJGN00053f83@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 Mount problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,
I have built a kernel in RAM and Put in Jffs2 Support with two partitions.

On Booting However I get these messages for a huge number of times
..........
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e20c8:
0x0007 id
...........
JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
.....
...........

when running the command
 mount -t jffs2 /dev/mtdblock1 /mnt

I get

arena opened of 1 failed
mount: Mounting /dev/mtdblock1 on /mnt failed: No such device

What could be the reason?

Vikram
