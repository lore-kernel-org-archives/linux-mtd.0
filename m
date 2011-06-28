Received: from mail127.messagelabs.com ([216.82.250.115])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbMtk-000051-Rr
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 01:15:29 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Q: jffs2 "Erase at 0x???????? failed immediately: errno -5"
Date: Mon, 27 Jun 2011 18:14:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201106271814.52461.hartleys@visionengravers.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have tried everything I can think of but my system still occasionally
spits out error messages like:

Erase at 0x01cc0000 failed immediately: errno -5

What do these messages actually mean?  Everything appears to be
working fine but the errors worry me a bit.

For the record, my filesystem is on a NOR device partitioned as follows:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "RedBoot"
mtd1: 00020000 00020000 "unallocated"
mtd2: 0001f000 00020000 "FIS directory"
mtd3: 00001000 00020000 "RedBoot config"
mtd4: 00200000 00020000 "kernel"
mtd5: 00c00000 00020000 "root"
mtd6: 03180000 00020000 "user"

And mounted like this:

# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw,relatime)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
mdev on /dev type tmpfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
/dev/mtdblock6 on /user type jffs2 (rw,relatime)

If I understand the error messages correctly, they all appear to be happening
in the /dev/mtdblock6 partition.  I do a:

# flash_erase -j /dev/mtd6 0 0

On this partition before using it.

Any ideas will be appreciated.

Thanks,
Hartley
