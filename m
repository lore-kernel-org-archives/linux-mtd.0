Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF4j6-0001AH-8c
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 02:57:19 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 172478964E4
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 16:28:04 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 4B1E38964E4
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 16:28:03 +1000 (EST)
Message-ID: <43267172.20702@magellan-technology.com>
Date: Tue, 13 Sep 2005 16:28:02 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: JFFS2+NAND problem in 2.6.13-at91
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was previously using 2.6.12-rc1, AT91 with JFFS2 on NAND and I had no
problems whatsoever with using JFFS2 on NAND.

I recently upgraded to 2.6.13 and now JFFS2 on NAND seems a little broken ...

This is what I usually do when configuring a new board:

# flash_eraseall -j /dev/mtd3
# mount -t jffs2 /dev/mtdblock3 /mnt/NAND
# copy FS to /mnt/NAND, etc ,etc

but now the mount fails with output::

/root # mount -t jffs2 /dev/mtdblock3 /mnt/NAND
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028038: 0xffff
instead

<SNIP> much of the same ...

jffs2_scan_eraseblock(): Node at 0x00b28008 {0x1985, 0x2003, 0x00000008) has
invalid CRC 0xffffffdf (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b2800c: 0x0008
instead

<SNIP> much of the same ...

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ff0030: 0xffff
instead
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 1024
mount: Mounting /dev/mtdblock3 on /mnt/NAND failed: Input/output error


I had a look at previous posts and I couldn't find any answers, so I enabled
debugging for MTD at level 3 and ... the mount worked(!) and I could write a
file to NAND, reboot, remount and the file was still there. So it proves that
the formatting was correct.

When I changed the MTD debugging to level 2 (or less), the mount started to
fail again. Therefore something in the reading from the NAND must be incorrect.

This sounds like some sort of timing issues to me if switching on debugging
output causes the system to start working.

Has anyone else seen this problem?

regards,

Aras Vaichas
