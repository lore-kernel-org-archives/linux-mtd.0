Received: from mail.kendin.com ([209.128.93.97])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nPpc-0004E1-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 20:03:40 +0000
Received: from kamwin (209-128-93-100.BAYAREA.NET [209.128.93.100])
	by mail.kendin.com (8.11.6/8.11.2) with SMTP id g2JK99l16038
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 12:09:09 -0800
Message-ID: <025f01c1cf83$11e23f70$9c011f0a@kamwin>
From: "Kam Lee" <kamlee@kendin.com>
To: <linux-mtd@lists.infradead.org>
Subject: newbee question
Date: Tue, 19 Mar 2002 12:17:13 -0800
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

Hi all,
I'm just starting looking into JFFS2 & MTD, after following the HOWTO,
mounting JFFS2 gives the following complain:

# mount -t jffs2 /dev/mtdblock3 /mnt
mount: Mounting /dev/mtdblock3 on /mnt failed: No such device or address

Hope somebody can hints me what am I missing.
Thanks in advance.

More info:

cat /proc/mtd gives:
dev:    size   erasesize  name
mtd0: 00020000 00020000 "bootp"
mtd1: 00080000 00020000 "zImage"
mtd2: 000a0000 00020000 "initrd"
mtd3: 00020000 00020000 "part1"

mtd3 is a jffs2  file system image created by mkfs.jffs2

ls /dev/mtd* gives:
crw-rw-r--    1 root     root      90,   0 Mar 16  2002 /dev/mtd0
crw-rw-r--    1 root     root      90,   2 Mar 19  2002 /dev/mtd1
crw-rw-r--    1 root     root      90,   4 Mar 19  2002 /dev/mtd2
crw-rw-r--    1 root     root      90,   6 Mar 19  2002 /dev/mtd3
brw-rw-r--    1 root     root      31,   0 Mar 16  2002 /dev/mtdblock0
brw-rw-r--    1 root     root      31,   1 Mar 16  2002 /dev/mtdblock1
brw-rw-r--    1 root     root      31,   2 Mar 16  2002 /dev/mtdblock2
brw-rw-r--    1 root     root      31,   3 Mar 16  2002 /dev/mtdblock3
