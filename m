Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Ucs-0004pD-UV
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 11:15:32 +0000
Message-ID: <1346671221.3061.42.camel@sauron.fi.intel.com>
Subject: Re: TR: Notification d'envoi de fichier via http://dl.free.fr
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Fabien Comte <fabien.comte@ercogener.com>
Date: Mon, 03 Sep 2012 14:20:21 +0300
In-Reply-To: <003d01cd877e$39b71020$ad253060$@ercogener.com>
References: <20120831133153.764EC3495D9@dl.free.fr>
 <003d01cd877e$39b71020$ad253060$@ercogener.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-y0WLKskm/r0YNke6WPnq"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-y0WLKskm/r0YNke6WPnq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[CCing the MTD ML]

Mounts fine on nandsim + the latest UBIFS kernel (linux-ubifs), and all
files are readable - checked with rsync.

$ sudo modprobe nandsim first_id_byte=3D0x20 second_id_byte=3D0xaa third_id=
_byte=3D0x00 fourth_id_byte=3D0x15
$ sudo modprobe mtdchar
$ sudo dd if=3D~/tmp/Angstrom-fabien-image-eglibc-ipk-v2011.09-at91sam9260e=
k.rootfs.ubi of=3D/dev/mtd0 bs=3D2048
$ sudo modprobe ubi mtd=3D0
$ sudo mount -t ubifs /dev/ubi0_0  /mnt/ubifs/
$ dmesg | tail
....
[ 3980.001332] NAND device: Manufacturer ID: 0x20, Chip ID: 0xaa (ST Micro =
NAND 256MiB 1,8V 8-bit), page size: 2048, OOB size: 64
[ 3980.001337] flash size: 256 MiB
[ 3980.001338] page size: 2048 bytes
[ 3980.001346] OOB area size: 64 bytes
[ 3980.001347] sector size: 128 KiB
[ 3980.001348] pages number: 131072
[ 3980.001349] pages per sector: 64
[ 3980.001350] bus width: 8
[ 3980.001351] bits in sector size: 17
[ 3980.001351] bits in page size: 11
[ 3980.001352] bits in OOB size: 6
[ 3980.001353] flash size with OOB: 270336 KiB
[ 3980.001354] page address bytes: 5
[ 3980.001355] sector address bytes: 3
[ 3980.001355] options: 0x8
[ 3980.001616] Scanning device for bad blocks
[ 3980.005765] Creating 1 MTD partitions on "NAND 256MiB 1,8V 8-bit":
[ 3980.005769] 0x000000000000-0x000010000000 : "NAND simulator partition 0"
[ 4075.066153] UBI: attaching mtd0 to ubi0
[ 4075.070304] UBI: scanning is finished
[ 4075.071382] UBI: volume 0 ("at91sam9260ek-rootfs") re-sized from 543 to =
2004 LEBs
[ 4075.072470] UBI: attached mtd0 (name "NAND simulator partition 0", size =
256 MiB) to ubi0
[ 4075.072472] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 byte=
s
[ 4075.072473] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[ 4075.072474] UBI: VID header offset: 512 (aligned 512), data offset: 2048
[ 4075.072475] UBI: good PEBs: 2048, bad PEBs: 0, corrupted PEBs: 0
[ 4075.072476] UBI: user volume: 1, internal volumes: 1, max. volumes count=
: 128
[ 4075.072478] UBI: max/mean erase counter: 1/0, WL threshold: 4096, image =
sequence number: 383215587
[ 4075.072479] UBI: available PEBs: 0, total reserved PEBs: 2048, PEBs rese=
rved for bad PEB handling: 40
[ 4075.072528] UBI: background thread "ubi_bgt0d" started, PID 13967
[ 4091.803787] UBIFS: background thread "ubifs_bgt0_0" started, PID 13989
[ 4091.804518] UBIFS: mounted UBI device 0, volume 0, name "at91sam9260ek-r=
ootfs"(null)
[ 4091.804521] UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit =
sizes: 2048 bytes/2048 bytes
[ 4091.804522] UBIFS: FS size: 254564352 bytes (242 MiB, 1973 LEBs), journa=
l size 9033728 bytes (8 MiB, 71 LEBs)
[ 4091.804524] UBIFS: reserved for root: 0 bytes (0 KiB)
[ 4091.804526] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 6E97ED8D-=
B37E-4C41-8521-B7840B684C1B, small LPT model

$ [dedekind@np linux-ubifs (test)]$ ls -l /mnt/ubifs/
total 0
drwxrwxr-x  2 root root  9048 Sep 16  2011 bin
drwxrwxr-x  2 root root   160 Sep 16  2011 boot
drwxr-xr-x  3 root root  4896 Sep  3  2011 dev
drwxr-xr-x 39 root root  5952 Sep 16  2011 etc
drwxrwxr-x  3 root root   224 Sep 16  2011 home
drwxrwxr-x  6 root root  2760 Sep 16  2011 lib
lrwxrwxrwx  1 root root    12 Sep 16  2011 linuxrc -> /bin/busybox
drwxrwxr-x 10 root root   680 Sep 16  2011 media
drwxrwxr-x  2 root root   416 Sep 16  2011 mnt
drwxr-xr-x  2 root root   160 Sep  3  2011 proc
drwxrwxr-x  2 root root 10008 Sep 16  2011 sbin
drwxr-xr-x  2 root root   160 Sep  3  2011 sys
drwxrwxrwt  2 root root   160 Sep  3  2011 tmp
drwxrwxr-x 10 root root   672 Sep  3  2011 usr
drwxrwxr-x 10 root root  1000 Sep  3  2011 var
[dedekind@np linux-ubifs (test)]$ ls -l /mnt/ubifs/home/
total 0
drwxr-xr-x 2 root root 376 Sep 16  2011 root
[dedekind@np linux-ubifs (test)]$ ls -l /mnt/ubifs/home/root/
total 56
-rwxr-xr-x 1 root root  6640 Sep 16  2011 auto_install.sh
-rwxr-xr-x 1 root root 21868 Sep 16  2011 fw_printenv
-rwxr-xr-x 1 root root 21868 Sep 16  2011 fw_setenv

$ sudo rsync -aH --delete --devices --specials /mnt/ubifs /tmp/ubifs


Please, check yourself on ubifs-v2.6.37 if it works the same way. Weird
why it does not work for you.

Also, you never sent me the full log. Please, _before_ mounting, enable
debugging prints:

1. modprobe ubifs
2. echo 'format "UBIFS DBG" +pf' > /sys/kernel/debug/dynamic_debug/control
3. mount

then type "dmesg" and send full log please.

Thanks!


--=20
Best Regards,
Artem Bityutskiy

--=-y0WLKskm/r0YNke6WPnq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRJJ1AAoJECmIfjd9wqK0NLYP/RMsYU1Gi04/7PoihOtYp6LG
X8W5MANPGUNJ7BZyuIltvEdFnXxFAD8nRnLgd2WouTnvjF+xibuy1bj1mtkyJRSn
I/r9b52ITDDQJMS/nDzQpJCM8Ud1oMZKpQ0j1WLs7OqzRUmsTrBIzDih1g4ZJtBs
aZi6LTBRLFrXXqMHVVVRcDd/7MsOKo1Wk5h0JiwfoIKAJoT9/IWMcuhk8ysCy+8e
uhrMMlDFQKqlDybWxO+MK2rkvgYS8wooSgAcgkFMkgRIeyzhQ+XsvCGj4C6F+gDc
cHHm6ltG29CY8jQXZJDweLNd7qwfNvdIMSN5ME3oBS9YkYdS7OWUag/3VyMnso1x
znp2b7fsyPWgKpXT/IRZ3YIwXFdmarxf3AbU5rYvSmnzCm2uv/vjFtgm7kXNdRC8
jNh9WH6/DCYMK3bITGi8rtZ5H7c8eJVzecCQBJv1AHfIgBxmfdUDLYY8cRZMKnzs
WQTM2EKAZIuKvyWGhYDn8L0UzXNWVpCAf7rWX4yP1hi6jZd/ZRJA+ck2/uG2Q1wW
spreV3V8rKuV6khDcSuzFai+Q7FjwT+chOlkQ+fUg98lGZ9BO2PUpbBmfebxDg8x
PJGfhvAcfRnCKoQSF+BOKcPku5G2665b57AGkCUtNHMdPXl4eyM6k3cMlk3VtDZ9
cq2garHfcuf0LQ3xueZt
=FVFF
-----END PGP SIGNATURE-----

--=-y0WLKskm/r0YNke6WPnq--
