Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FH3Ej-0001iq-Qw
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2006 13:18:22 -0500
Date: Wed, 8 Mar 2006 19:17:46 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20060308181742.GA18236@synertronixx3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Inode #285 was a directory with children - removing those too...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I don't get it:

devicetable:

#<name>         <type>  <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
/dev/null       c       666     0       0       1       3       0       0       -
/dev/console    c       666     0       0       5       1       -       -       -
/dev/ttySMX     c       640     0       0       204     41      0       1       3

/bin/busybox    f       4755    0       0       -       -       -       -       -
/tmp            d       4711    0       0       -       -       -       -       -
/var            d       2775    0       0       -       -       -       -       -
/var/log/       d       2775    0       0       -       -       -       -       -
/usr/local      d       2775    500     0       -       -       -       -       -
/usr/local/bin  d       2775    500     0       -       -       -       -       -

creation:

/usr/src/buildroot/toolchain_build_arm_nofpu/mtd-20050122.orig/util/mkfs.jffs2 \
 -e 0x20000 \
 -l \
 -d /usr/src/buildroot/build_arm_nofpu/root \
 -D device_table.txt \
 -o /usr/src/buildroot/rootfs.arm_nofpu.jffs2

mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/var': no parent directory!
mkfs.jffs2: skipping device_table entry '/var/log/': no parent directory!

mount:

scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":
0x00000000-0x00020000 : "U-boot"
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00240000 : "kernel"
0x00240000-0x00740000 : "root"
0x00740000-0x00800000 : "fs"
NET: Registered protocol family 2
IP route cache hash table entries: 256 (order: -2, 1024 bytes)
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
Inode #285 was a directory with children - removing those too...
VFS: Mounted root (jffs2 filesystem).

What am I doing wrong?
In the resulting / /var is missing :-(

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
