Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PcapW-0008F4-VX
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 09:47:56 +0000
Received: by qyk27 with SMTP id 27so24062416qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 01:47:53 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 11 Jan 2011 09:47:52 +0000
Message-ID: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
Subject: validate_sb: bad superblock, error 8 (Minimum UBI volume size for
	UBIFS image)
From: Andrew Murray <amurray@mpcdata.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Is there a way to determine the minimum UBI volume size which will
support a given UBIFS filesystem image?

I've read the infradead.org FAQ's and browsed the source - however can
not find a suitable answer. My current conclusion is that the minimum
UBI volume is somehow dependant on the filesystem size, the log and
the journal. I'm working on an upgrade mechanism which uses UBI/UBIFS
and only creates UBI volumes of the minimum size to support a UBIFS
filesystem and thus struggling to determine the safest minimum size.

This is what I've attempted. In these examples UBIFS is claiming that
the journal size is 71 LEB's - however the filesystem will only mount
if my UBI volume is 77 LEB's - how do I account for this difference?

# ubinfo -a
UBI version: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01
Count of UBI devices: =A0 =A0 =A0 =A0 =A0 1
UBI control device major/minor: 10:63
Present UBI devices: =A0 =A0 =A0 =A0 =A0 =A0ubi0
ubi0
Volumes count: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
Logical eraseblock size: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 129024 bytes, 126.=
0 KiB
Total amount of logical eraseblocks: =A0 =A0 911 (117540864 bytes, 112.1 Mi=
B)
Amount of available logical eraseblocks: 401 (51738624 bytes, 49.3 MiB)
Maximum count of volumes =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 128
Count of bad physical eraseblocks: =A0 =A0 =A0 1
Count of reserved physical eraseblocks: =A09
Current maximum erase counter value: =A0 =A0 350
Minimum input/output unit size: =A0 =A0 =A0 =A0 =A02048 bytes
Character device major/minor: =A0 =A0 =A0 =A0 =A0 =A0251:0
Present volumes: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
Volume ID: =A0 0 (on ubi0)
Type: =A0 =A0 =A0 =A0dynamic
Alignment: =A0 1
Size: =A0 =A0 =A0 =A0497 LEBs (64124928 bytes, 61.2 MiB)
State: =A0 =A0 =A0 OK
Name: =A0 =A0 =A0 =A0rootfs
Character device major/minor: 251:1

# ls -l rootfs.ubifs
-rw-r--r-- =A0 =A01 default =A0default =A0 6838272 Jan 10 =A02011 rootfs.ub=
ifs
# ubimkvol /dev/ubi0 -N test -s 6838272
Volume ID 1, size 53 LEBs (6838272 bytes, 6.5 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 > c->leb_size * c->main_lebs: 5419008
UBIFS error (pid 1109): validate_sb: bad superblock, error 8
mount: mounting ubi0:test on /tmp/a/ failed: Invalid argument

# ubirmvol =A0/dev/ubi0 -N test
# ubimkvol /dev/ubi0 -N test --lebs=3D77
Volume ID 1, size 77 LEBs (9934848 bytes, 9.5 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 < c->leb_size * c->main_lebs: 8515584
UBIFS: mounted UBI device 0, volume 1, name "test"
UBIFS: file system size: =A0 8515584 bytes (8316 KiB, 8 MiB, 66 LEBs)
UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root: =A00 bytes (0 KiB)
# umount /tmp/a
UBIFS: un-mount UBI device 0, volume 1

# ubimkvol /dev/ubi0 -N test --lebs=3D71
Volume ID 1, size 71 LEBs (9160704 bytes, 8.7 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 > c->leb_size * c->main_lebs: 7741440
UBIFS error (pid 1136): validate_sb: bad superblock, error 8
mount: mounting ubi0:test on /tmp/a/ failed: Invalid argument

# ubirmvol /dev/ubi0 -N test
# ubimkvol /dev/ubi0 -N test --lebs=3D72
Volume ID 1, size 72 LEBs (9289728 bytes, 8.9 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 > c->leb_size * c->main_lebs: 7870464
UBIFS error (pid 1144): validate_sb: bad superblock, error 8
mount: mounting ubi0:test on /tmp/a/ failed: Invalid argument

# ubirmvol /dev/ubi0 -N test
# ubimkvol /dev/ubi0 -N test --lebs=3D76
Volume ID 1, size 76 LEBs (9805824 bytes, 9.4 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 > c->leb_size * c->main_lebs: 8386560
UBIFS error (pid 1152): validate_sb: bad superblock, error 8
mount: mounting ubi0:test on /tmp/a/ failed: Invalid argument

# ubirmvol /dev/ubi0 -N test
# ubimkvol /dev/ubi0 -N test --lebs=3D77
Volume ID 1, size 77 LEBs (9934848 bytes, 9.5 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# ubiupdatevol /dev/ubi0_1 rootfs.ubifs
# mount -t ubifs ubi0:test /tmp/a/
c->max_bud_bytes: 8388608 < c->leb_size * c->main_lebs: 8515584
UBIFS: mounted UBI device 0, volume 1, name "test"
UBIFS: file system size: =A0 8515584 bytes (8316 KiB, 8 MiB, 66 LEBs)
UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root: =A00 bytes (0 KiB)

Many Thanks,

Andrew Murray
