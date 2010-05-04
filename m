Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9Jem-0000Qd-GB
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 15:03:33 +0000
Received: by wwb39 with SMTP id 39so63042wwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 08:03:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 May 2010 17:03:29 +0200
Message-ID: <s2i804f0d21005040803tdaec81f3lf572d260f3153cca@mail.gmail.com>
Subject: strange flash effects - ask for help
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

you probably sick and tired of question to messages like

"Empty flash at 0x009cf28c ends at 0x009cf800"

But I coudn't found enough information about that. To finally clear
that stuff - may I ask some question?
Please help!

1) Is this a jffs2 message? So in other words - is it an absolute
flash address of with offset to a mounted jffs partion?
In case of an offset and I would have more than one jffs partion -
where do I know from which has a problem?

2) From what I read is this message caused by a mismatch of erasesize
of flash-IC / settings for linux ( which can be seen in /proc/mtd) and
building the jffs-fs whith mkfs.jffs2 ( -e parameter). I did used the
1.6 version of mkfs.jffs2 (recent 1.3.1 mtdutil) and with both 128 and
131072 (kB and B) size.
Both resulting jffs files are same (that has been different in 1.5)

3) cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "X-Loader"
mtd1: 00080000 00020000 "U-Boot"
mtd2: 00020000 00020000 "U-Boot Environment"
mtd3: 00400000 00020000 "Kernel(1)"
mtd4: 00400000 00020000 "Kernel(2)"
mtd5: 02800000 00020000 "system(1)"
mtd6: 02800000 00020000 "system(2)"
mtd7: 02740000 00020000 "extra"

looks fine for the 128kByte / 131072 byte setting.

"mkfs.jffs2 -lqnp -e 128 -r /opt/rootfs -o /mnt/hgfs/share/rootfs.jffs2"

Nevertheless I get this message "empty flash .." while booting after I
changed something in the filesystem (even with a clean "halt").

As this is just a part of my flash-fs problems, I need to know, whats
going wrong here.

4) After a while of power cycles I get messages like
uncorrectable error : <3>uncorrectable error : <3>uncorrectable error
: <3>uncorrectable error : <3>uncorrectable error : <3>uncorrectable
error : <3>uncorrectable error : <3>uncorrectable error :
<4>mtd->read(0x1fa14 bytes from 0x1c05ec) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001cc504:
0xadd7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001cc508:
0xc179 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001cc50c:
0xcbae instead
and
JFFS2 notice: (1) jffs2_get_inode_nodes: Node header CRC failed at
0x1cc594. {e99d,d185,2da85850,efc64922}
although I don't believe to write anything into flash)

What does this <3> and <4> and this messages mean and how to prevent them?

-------------

The filesystem has been flashed in uboot with
"nandecc sw; nand write.i 0x81600000 8c0000 2800000" (of course
cleaning the RAM with ff and loading the jffs2)

I do have 2 badblocks inside, but they are not in the area of the message above.
uboot: 0x1400000  / flash_eraseall: 0xb40000
uboot: 0x1600000  / flash_eraseall: 0xd40000
(I guess linux message is relative to its /dev/mtd5)

boot message:
Creating 8 MTD partitions on "omap2-nand.0":
0x00000000-0x00020000 : "X-Loader"
0x00020000-0x000a0000 : "U-Boot"
0x000a0000-0x000c0000 : "U-Boot Environment"
0x000c0000-0x004c0000 : "Kernel(1)"
0x004c0000-0x008c0000 : "Kernel(2)"
0x008c0000-0x030c0000 : "system(1)"
0x030c0000-0x058c0000 : "system(2)"
0x058c0000-0x08000000 : "extra"

5) How can I come closer to repair or inspect it?

Thanks!
Arno
