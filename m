Received: from f120.pav1.hotmail.com ([64.4.31.120] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187uUn-0007aH-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Nov 2002 09:23:09 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: mtd2 partition mapping on mtd1?...
Date: Sat, 02 Nov 2002 09:52:47 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F120gLEbWm5zHXJ6uCu0001bb1e@hotmail.com>
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

Hi Friends,

Have added 3 partitions in mtd. The root filesystem is cramfs type.
Since it was not being located by default, hardcoded cramfs_read
to return the rootfs addr. Now the target is coming up..Am getting
below results too...

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 000c0000 00020000 "boot firmware + kernel"
mtd1: 00200000 00020000 "cramfs partition"
mtd2: 00100000 00020000 "test partition"

# mount
/dev/root on / type cramfs (rw)
/proc on /proc type proc (rw)
ramfs on /var type ramfs (rw)

Now, "cat /dev/mtd1" and "cat /dev/mtd2" are both fetching
same data. How's that?. A dd to /dev/mtd2 is going as..

# busybox dd if=mtd2fs.bin bs=94208 of=/dev/mtd2 count=1
MTD_open
MTD_write
vijay mtd_write (Í=E
(vijay) in physmap_write32(data=0xaa00aa, adr=0x1554)
(vijay) in physmap_write32(data=0x550055, adr=0xaa8)
(vijay) in physmap_write32(data=0x200020, adr=0x1554)
(vijay) in physmap_write32(data=0xa000a0, adr=0x0)
(vijay) in physmap_write32(data=0x28cd3d45, adr=0x400000)
(vijay) in physmap_read32(0xc3ba3000)
(vijay) in physmap_read32(0xc3ba3000)
(vijay) in physmap_read32(0xc3ba3000)
(vijay) in physmap_read32(0xc3ba3000)
:
:
:
(vijay) in physmap_read32(0xc3ba3000)
(vijay) in physmap_read32(0xc3ba3000)
(vijay) in physmap_read32(0xc3ba3000)
Last[3] is d726c2a6, datum is 28cd3d45
(vijay) in physmap_write32(data=0xf000f0, adr=0x0)
(vijay) in physmap_write32(data=0x900090, adr=0x0)
(vijay) in physmap_write32(data=0x0, adr=0x0)
dd: /dev/mtd2: Input/output error
MTD_close

On "cat /dev/mtd2", am still seeing old data(as on mtd1)?.

Any suggestions on what's going wrong here?..

Thanks and Regards,
Vijay


_________________________________________________________________
Surf the Web without missing calls! Get MSN Broadband.  
http://resourcecenter.msn.com/access/plans/freeactivation.asp
