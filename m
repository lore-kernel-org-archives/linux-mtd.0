Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOz6-0001Kx-1h
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:51:25 +0000
Received: by vxd2 with SMTP id 2so4760259vxd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 May 2011 23:51:22 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 May 2011 12:21:22 +0530
Message-ID: <BANLkTikajvqW8J+8PTk_Zof1OXnbR8qq8w@mail.gmail.com>
Subject: Not able to mount to a data partition with UBIFS
From: Govinda <govindg279@gmail.com>
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

Hi all,

I am new to ubifs. And, am facing the below problem.

I have a 32MB nand flash.
and Creating 5 MTD partitions on "atmel_nand"

[42949373.400000] 0x00000000-0x00100000 : "Bootstrap"
[42949373.410000] 0x00100000-0x00300000 : "Kernel"
[42949373.410000] 0x00300000-0x01400000 : "FileSystem"
[42949373.420000] 0x01400000-0x01d00000 : "DataSection"
[42949373.430000] 0x01d00000-0x02000000 : "DfltArea"


Here rootfs is mounted successfully. below is the log:

[42949373.440000] UBI: attaching mtd2 to ubi0
[42949373.440000] UBI: physical eraseblock size:=A0=A0 131072 bytes (128 Ki=
B)
[42949373.450000] UBI: logical eraseblock size:=A0=A0=A0 129024 bytes
[42949373.450000] UBI: smallest flash I/O unit:=A0=A0=A0 2048
[42949373.460000] UBI: sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 512
[42949373.460000] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 (a=
ligned 512)
[42949373.470000] UBI: data offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2048
[42949373.510000] UBI: attached mtd2 to ubi0
[42949373.510000] UBI: MTD device name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "F=
ileSystem"
[42949373.520000] UBI: MTD device size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 17=
 MiB
[42949373.520000] UBI: number of good PEBs:=A0=A0=A0=A0=A0=A0=A0 136
[42949373.530000] UBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0
[42949373.530000] UBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 128
[42949373.540000] UBI: wear-leveling threshold:=A0=A0=A0 4096
[42949373.540000] UBI: number of internal volumes: 1
[42949373.550000] UBI: number of user volumes:=A0=A0=A0=A0 1
[42949373.550000] UBI: available PEBs:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0
[42949373.560000] UBI: total number of reserved PEBs: 136
[42949373.560000] UBI: number of PEBs reserved for bad PEB handling: 2
[42949373.570000] UBI: max/mean erase counter: 2/0

After the system booted up, from the command prompt:
Since the DataSection partion number is 3, and
when am trying to mount a partition "DataSection", It seems getting
mounted succefully.

But, the data is not visible at the mounted path.

Below are the sequence of commands that I have used to mount a partition:

# ubiformat /dev/mtd3 -s 512
ubiformat: mtd3 (nand), size 9437184 bytes (9.0 MiB), 72 eraseblocks
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 71 -- 100 % complete
ubiformat: 72 eraseblocks have valid erase counter, mean value is 5
ubiformat: formatting eraseblock 71 -- 100 % complete
# ubiattach /dev/ubi_ctrl -m 3
[ 4352.750000] UBI: attaching mtd3 to ubi1
[ 4352.760000] UBI: physical eraseblock size:=A0=A0 131072 bytes (128 KiB)
[ 4352.760000] UBI: logical eraseblock size:=A0=A0=A0 129024 bytes
[ 4352.770000] UBI: smallest flash I/O unit:=A0=A0=A0 2048
[ 4352.770000] UBI: sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5=
12
[ 4352.780000] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 (alig=
ned 512)
[ 4352.780000] UBI: data offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 2048
[ 4352.850000] UBI: attached mtd3 to ubi1
[ 4352.850000] UBI: MTD device name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Data=
Section"
[ 4352.860000] UBI: MTD device size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 9 MiB
[ 4352.860000] UBI: number of good PEBs:=A0=A0=A0=A0=A0=A0=A0 72
[ 4352.870000] UBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0
[ 4352.870000] UBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 128
[ 4352.880000] UBI: wear-leveling threshold:=A0=A0=A0 4096
[ 4352.880000] UBI: number of internal volumes: 1
[ 4352.890000] UBI: number of user volumes:=A0=A0=A0=A0 0
[ 4352.890000] UBI: available PEBs:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 66
[ 4352.900000] UBI: total number of reserved PEBs: 6
[ 4352.900000] UBI: number of PEBs reserved for bad PEB handling: 2
[ 4352.910000] UBI: max/mean erase counter: 13/6
[ 4352.910000] UBI: background thread "ubi_bgt1d" started, PID 32460

# ubiattach /dev/ubi_ctrl -m 3

# ubinfo -a
UBI version:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1
Count of UBI devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
UBI control device major/minor: 10:63
Present UBI devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ubi0, ubi1

ubi0
Volumes count:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 1
Logical eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
9024 bytes, 126.0 KiB
Total amount of logical eraseblocks:=A0=A0=A0=A0 136 (17547264 bytes, 16.7 =
MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
8
Count of bad physical eraseblocks:=A0=A0=A0=A0=A0=A0 0
Count of reserved physical eraseblocks:=A0 2
Current maximum erase counter value:=A0=A0=A0=A0 2
Minimum input/output unit size:=A0=A0=A0=A0=A0=A0=A0=A0=A0 2048 bytes
Character device major/minor:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 253:0
Present volumes:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0

Volume ID:=A0=A0 0 (on ubi0)
Type:=A0=A0=A0=A0=A0=A0=A0 dynamic
Alignment:=A0=A0 1
Size:=A0=A0=A0=A0=A0=A0=A0 130 LEBs (16773120 bytes, 16.0 MiB)
State:=A0=A0=A0=A0=A0=A0 OK
Name:=A0=A0=A0=A0=A0=A0=A0 rootfs
Character device major/minor: 253:1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ubi1
Volumes count:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0
Logical eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
9024 bytes, 126.0 KiB
Total amount of logical eraseblocks:=A0=A0=A0=A0 72 (9289728 bytes, 8.9 MiB=
)
Amount of available logical eraseblocks: 66 (8515584 bytes, 8.1 MiB)
Maximum count of volumes=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
8
Count of bad physical eraseblocks:=A0=A0=A0=A0=A0=A0 0
Count of reserved physical eraseblocks:=A0 2
Current maximum erase counter value:=A0=A0=A0=A0 13
Minimum input/output unit size:=A0=A0=A0=A0=A0=A0=A0=A0=A0 2048 bytes
Character device major/minor:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 251:0

# mknod /dev/ubi1 c 251 0

# ubimkvol /dev/ubi1 -N DataSection -s 6838272
Volume ID 0, size 53 LEBs (6838272 bytes, 6.5 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "DataSection", alignment 1

# mount -t ubifs ubi1:DataSection /mnt/mtd3_DataSection/
[ 4622.320000] UBIFS: default file-system created
[ 4622.340000] UBIFS: background thread "ubifs_bgt1_0" started, PID 1876
[ 4622.410000] UBIFS: mounted UBI device 1, volume 0, name "DataSection"
[ 4622.410000] UBIFS: file system size: 5548032 bytes (5418 KiB, 5 MiB, 43 =
LEBs)
[ 4622.420000] UBIFS: journal size: 1032193 bytes (1008 KiB, 0 MiB, 6 LEBs)
[ 4622.430000] UBIFS: default compressor: LZO
[ 4622.430000] UBIFS: media format 4, latest format 4

#cd /mnt/mtd3_DataSection/
# ls
<No data visible, but expected the same data.>


AND
adding some more info...

Utils and args used to build the xxxx.ubi
# mkfs.ubifs -r DefaultElems -m 2048 -e 129024 -c 2048 -o default.ubifs -x =
lzo
# ubinize -o default-elm.ubi -m 2048 -p 128KiB -s 512 default.cfg

here 'DefaultElems' directory contains some sub dirs and some data as
well. (the same data expecting after mount operation=A0 )
default.cfg:
[default-elm]
mode=3Dubi
image=3Ddefault.ubifs
vol_id=3D0
vol_type=3Ddynamic
vol_name=3DDataSection

and the resultant image default-elm.ubi flashed at the partition
'DataSection' (0x01400000-0x01d00000 : "DataSection")
kernel version : 2.6.27


Could someone please help me...


=A0Thanks &
Regards,
Govinda.
