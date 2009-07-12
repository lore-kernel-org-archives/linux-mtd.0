Received: from cluster-h.mailcontrol.com ([208.87.234.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPtMG-0008Vl-Q2
	for linux-mtd@lists.infradead.org; Sun, 12 Jul 2009 07:20:40 +0000
Received: from rly28h.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly28h.srv.mailcontrol.com (MailControl) with ESMTP id
	n6C7KA4t016035
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jul 2009 08:20:13 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly28h.srv.mailcontrol.com (MailControl) id n6C7JPSt010196
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jul 2009 08:19:25 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: ubiattach problem
Date: Sun, 12 Jul 2009 10:19:20 +0300
Message-ID: <ED252DAAC10AF74791BDFAD3BF09B5DB030DA29F@tlvntmail1.verifone.com>
In-Reply-To: <1246981542.20721.327.camel@localhost.localdomain>
From: Oren Sokolowsky <Oren_S3@VERIFONE.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks you very much... Artem,
After fixing the NAND driver ,I finally succeed format,attach and mount =
ubifs as a rootfs.
As I already mention I am using kernel 2_6_27_18 ...is there a list of =
known UBI/UBFS issues for this kernel version?

=20

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Tuesday, July 07, 2009 6:46 PM
To: Oren Sokolowsky
Cc: linux-mtd@lists.infradead.org
Subject: Re: ubiattach problem

On Tue, 2009-07-07 at 18:38 +0300, Oren wrote:
> cp /mnt/pc/Linux_2_6_27_old/mtd-utils/ubi_format.sh .
> ~ # chmod 777 ubi_format.sh
> ~ # ./ubi_format.sh
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00020000 "NAND-block1"
> mtd1: 01e00000 00020000 "jffs2"
> mtd2: 05200000 00020000 "NAND-block2"
> ubinfo
> UBI version:                    1
> Count of UBI devices:           0
> UBI control device major/minor: 10:63
> ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> ubiformat: mtd0 (nand), size 16777216 by[42949488.970000]=20
> Uncorrectable ECC error!!!!  :f0000fff tes (16.0 MiB), 128 eraseblocks =

> [42949488.980000] Uncorrectable ECC error!!!!  :f0000fff of 131072=20
> bytes (128.0 KiB), min[42949488.990000] Uncorrectable ECC error!!!! =20
> :f0000fff . I/O size 2048 bytes
> libscan: [42949489.000000] Uncorrectable ECC error!!!!  :f0000fff=20
> start scanning eraseblocks 0-128[42949489.010000] Uncorrectable ECC=20
> error!!!!  :f0000fff
>=20
> libscan: scanning eraseblock 0[42949489.010000] Uncorrectable ECC=20
> error!!!!  :f0000fff
> : empty
> libscan: scanning eraseblock 1: empty
> libscan: scanning eraseblock 2: empty
> libscan: scanning eraseblock 3: empty
> libscan: scanning eraseblock 4: empty
> libscan: scanning eraseblock 5: empty
> libscan: scanning eraseblock 6: empty
> libscan: scanning eraseblock 7: empty
> libscan: scanning eraseblock 8: empty
> libscan: scanning eraseblock 9: empty
> libscan: scanning eraseblock 10: empty
> libscan: scanning eraseblock 11: empty
> libscan: scanning eraseblock 12: empty libscan:[42949489.060000]=20
> Uncorrectable ECC error!!!!  :f0000fff  scanning eraseblock 13: empty=20
> [42949489.070000] Uncorrectable ECC error!!!!  :f0000fff
> libscan: scanning eraseblock 14:[42949489.080000] Uncorrectable ECC=20
> error!!!!  :f0000fff  empty
> libscan: scanning eraseb[42949489.090000] Uncorrectable ECC error!!!!  =

> :f0000fff lock 15: empty
> libscan: scannin[42949489.090000] Uncorrectable ECC error!!!! =20
> :f0000fff g eraseblock 16: empty libscan:[42949489.100000]=20
> Uncorrectable ECC error!!!!  :f0000fff  scanning eraseblock 17: empty
> libscan: scanning eraseblock 18: empty
> libscan: scanning eraseblock 19: empty
> libscan: scanning eraseblock 20: empty
> libscan: scanning eraseblock 21: empty

...

> [42949490.870000] UBI: logical eraseblock size:    126976 bytes
> [42949490.880000] UBI: smallest flash I/O unit:    2048
> [42949490.880000] UBI: VID header offset:          2048 (aligned 2048)
> [42949490.890000] UBI: data offset:                4096
> [42949490.900000] UBI DBG (pid 90): ubi_scan: process PEB 0=20
> [42949490.910000] UBI DBG (pid 90): process_eb: scan PEB 0=20
> [42949490.910000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip=20
> detected at PEB 0 [42949490.920000] UBI warning: ubi_io_read_ec_hdr:=20
> bad magic number at PEB 0: 15400000 instead of 55424923=20
> [42949490.930000] Erase counter header dump:
> [42949490.930000] 	magic          0x15400000
> [42949490.940000] 	version        0
> [42949490.940000] 	ec             0
> [42949490.940000] 	vid_hdr_offset 0
> [42949490.950000] 	data_offset    0
> [42949490.950000] 	hdr_crc        0x000000
> [42949490.950000] erase counter header hexdump:
> [42949490.960000] 00000000: 15 40 00 00 00 00 00 00 00 00 00 00 00 00=20
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =20
> .@..............................
> [42949490.970000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=20
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =20
> ................................

OK, I admit UBI should print a better error message when it finds =
nothing but rubbish on flash. I'll try to implement this.

But you probably now noticed that UBI could not find a valid nodes, so =
something is wrong with your flash. You should check your driver.

:-)

I suggest you nandtests:
http://git.infradead.org/users/ahunter/nand-tests.git

--
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
