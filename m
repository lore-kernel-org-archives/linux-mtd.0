Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TePQn-0007uK-NA
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 12:10:58 +0000
Message-ID: <1354277506.30168.110.camel@sauron.fi.intel.com>
Subject: Re: UBIFS always readonly - ubifs_iget: failed to read inode 11414,
 error -22
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Bechtold <thomasbechtold@jpberlin.de>, micah anderson
 <micah@riseup.net>
Date: Fri, 30 Nov 2012 14:11:46 +0200
In-Reply-To: <50ADDF4A.90506@jpberlin.de>
References: <50ADDF4A.90506@jpberlin.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GqpCagMe2ID4fnGGRkDQ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GqpCagMe2ID4fnGGRkDQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 09:16 +0100, Thomas Bechtold wrote:
> Hi,
>=20
> I use UBIFS with upstream kernel 3.2.32 on an ARMv5 (Stamp9G20) and NAND
> Flash. When the device starts, the root-fs is mounted readonly. I can
> not remount the FS. The FAQ [1] told me that I can ask here for help.
> The device is remote and only accessable over ssh. It's expensive to go
> there so it would be nice if something could be done to repair the FS
> remotely.
>=20
> The output from dmesg is:
>=20
> #################### BEGIN #########################
> # dmesg |grep -i ubi
> Kernel command line: console=3DttyS0,115200 mem=3D128M
> mtdparts=3Datmel_nand:128k(bootstrap)ro,256k(uboot),128k(env1),128k(env2)=
,2M(linux),-(root)rw
> ubi.mtd=3D5 root=3Dubi0_0 rootfstype=3Dubifs boardtype=3DrevC
> UBI: attaching mtd5 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI: max. sequence number:       5115
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "root"
> UBI: MTD device size:            509 MiB
> UBI: number of good PEBs:        4064
> UBI: number of bad PEBs:         11
> UBI: number of corrupted PEBs:   0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             119
> UBI: total number of reserved PEBs: 3945
> UBI: number of PEBs reserved for bad PEB handling: 40
> UBI: max/mean erase counter: 39/1
> UBI: image sequence number:  -393607928
> UBI: background thread "ubi_bgt0d" started, PID 248
> TCP cubic registered
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 0, volume 0, name "m40rootfs"
> UBIFS: file system size:   501387264 bytes (489636 KiB, 478 MiB, 3886 LEB=
s)
> UBIFS: journal size:       25159680 bytes (24570 KiB, 23 MiB, 195 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  4952683 bytes (4836 KiB)
> VFS: Mounted root (ubifs filesystem) on device 0:10.
> UBIFS error (pid 1): read_znode: bad indexing node at LEB 3174:70736,
> error 6

Hmm, s similar report as another I got recently [1]. Similar symptoms, a
bit different kind of garbage in znode. I guess my answers to this are
similar:

1. Never saw before
2. Node dump is absent, try ingore_loglevel. Would make sens to dump the
node, may be we could have some clue from the dump?
3. Kernel is ancient.
4. May be a memory corruption. But may be a bug in UBIFS.

Probably if you could somehow make this reproducible, we could think how
find out what triggers this.

1.
http://lists.infradead.org/pipermail/linux-mtd/2012-November/044970.html

--=20
Best Regards,
Artem Bityutskiy

--=-GqpCagMe2ID4fnGGRkDQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuKKCAAoJECmIfjd9wqK063gP+wQfJvzTVXx+U0p8YWjrkLZ7
5/7lMW8mWx4Y9wRTuClCllyw042sFn2f870c5JBRKq812YEIOi2pvi6WC0P5E3A+
clvoj7EhxSIPxRD+jvYfSAClgvCfsXa/GmZ0WBaU5implj2S+KIDFjPLIgzxbjyd
5Pfw4V0pRyarYpTTjPN7usJKPjz7WnqFo5Ol5XbqCIWDm7/AInE3WW4C56E2f58j
rqA6L1HhOYbiXVCzXFOhfVWcTay/FosYGg5JM4RI/ssBNVKnSKnWmHkSIeaWK/vI
gLfGW7S73hnVOMbsoo7TO/QAdRZYbidZ2MbsMZDI+viHrIA8Gx46uu1piA3k/w7i
gxudolDGFnN0mFEfuO4I9xxQ07GRo85/oTkKAmCEjEp9wZk3sOz0WUAnBhzYrinV
KPTA/jniIyPR5CZEUTD/utV5tksQTpdbG9tD6eLQrdmQTFiGGtFmsnhBa+yZnD7I
nMDzK6buGnADByBrfENUuP1UffC081WG+uSJI9EfKUtJVyOS8C5BSXZDCELz5epe
ZV6jwhujsjPfW+sHkToVVKR6tVnTEzmTtZzMp2P4YR9Y1uPdXyYEEOaqCksZsSgA
EKfrS/OAuq82W4QPIpGTm9oybES18ACPveZaLBRpVGr/JLKptckdMqVBc27oFo71
osXy3uXhtzEgR2DWNBrA
=abS+
-----END PGP SIGNATURE-----

--=-GqpCagMe2ID4fnGGRkDQ--
