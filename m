Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byduY-0004vE-2b
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 11:59:29 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: Danesh Daroui <Danesh.Daroui@ascom.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Failure on MTD sub-page test
Date: Mon, 24 Oct 2016 11:58:32 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79095770AFB1@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC7909015DDE3F@SEGOTEXCH02.ascom-Resource.ads>
 <1476448883.2342.924.camel@gmail.com>
 <39BC08CB3FF4C84CB6397533D4FC7909015DE2F7@SEGOTEXCH02.ascom-Resource.ads>
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC7909015DE2F7@SEGOTEXCH02.ascom-Resource.ads>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I ran the tests this time without mouting the file system and now all tests=
 except OOB has been passed. The result for OOB test is:

mtd_oobtest: MTD device: 0
mtd_oobtest: MTD device size 1073741824, eraseblock size 524288, page size =
4096, count of eraseblocks 2048, pages per eraseblock 128, OOB size 128
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 2048 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2048 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written 2048 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified 2048 eraseblocks
mtd_oobtest: test 2 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2048 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written 2048 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: error: verify failed at 0x5300000
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified 2048 eraseblocks
mtd_oobtest: test 3 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2048 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written 2048 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified 2048 eraseblocks
mtd_oobtest: test 4 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2048 eraseblocks
mtd_oobtest: attempting to start write past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to start read past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: test 5 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2048 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written 2047 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified 2047 eraseblocks
mtd_oobtest: finished with 1 errors

The interesting thing is that the file system is forced to switch to read-o=
nly mode at startup due to checksum error and some corrupted data that cann=
ot be verified. Now my question is, can failing OOB test explain this failu=
re? I mean, if OOB test fails (like our case) then it is very likely that t=
he device experience data integrity problem at start up since OOB or Out Of=
 Band area contains meta data info for the file system and is the first par=
t that is read and verified during start up so if it fails, it can force th=
e file system into read-only mode to prevent further data corruption. Am I =
right?

Regards,

Danesh Daroui


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Danesh Daroui
Sent: den 14 oktober 2016 16:14
To: dedekind1@gmail.com; linux-mtd@lists.infradead.org
Subject: RE: Failure on MTD sub-page test

Hi Artem,

Thanks for your reply. I can unmount the device and run the tests, but then=
 how can we make sure whether the problem is in UBI/UBIFS layers or only MT=
D layer? Anyway, if we update the kernel, then both MTD drivers and UBI/UBI=
FS will be updated, am I right?

Regards,

Danesh Daroui

=20
-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
Sent: den 14 oktober 2016 14:41
To: Danesh Daroui <Danesh.Daroui@ascom.com>; linux-mtd@lists.infradead.org
Subject: Re: Failure on MTD sub-page test

On Tue, 2016-10-11 at 11:11 +0000, Danesh Daroui wrote:
> Hello,
>=20
> We are using UBIFS which is shipped with the Kernel 2.6.39.4 on a NAND=20
> Flash memory. When I run "mtd_debug info /dev/mtd0" following info are
> shown:
>=20
> mtd.type =3D MTD_NANDFLASH
> mtd.flags =3D MTD_CAP_NANDFLASH
> mtd.size =3D 1073741824 (1G)
> mtd.erasesize =3D 524288 (512K)
> mtd.writesize =3D 4096 (4K)
> mtd.oobsize =3D 128
> regions =3D 0
>=20
> Now the problem is that when I run mtd tests, only read and NAND ECC=20
> tests are passed. Then all other tests fail on exactly page 21. For=20
> instance this is the output when I run page test:

If mtd tests do not work, you need to focus on your MTD drivers and fix the=
m.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> mtd_subpagetest: MTD device: 0
> mtd_subpagetest: MTD device size 1073741824, eraseblock size 524288,=20
> page size 4096, subpage size 1024, count of eraseblocks 2048, pages
... snip ...
> mtd_subpagetest: verified up to eraseblock 1280
> mtd_subpagetest: verified up to eraseblock 1536
> mtd_subpagetest: verified up to eraseblock 1792 UBIFS error (pid
> 4243): ubifs_read_node: bad node type (255 but expected 1) UBIFS error=20
> (pid 4243): ubifs_read_node: bad node at LEB 30:98088, LEB mapping=20
> status 1 UBIFS error (pid 4243): do_readpage: cannot read page 21 of=20
> inode 791, error -22

This is a bit confusing - why messages go together. Do you run mtd tests an=
d also have the same mtd device mounted at the same time?

The tests hammer the MTD device directly, they do not go through UBI/UBIFS.=
 So make sure UBI/UBIFS are not using the MTD device that you are testing.

Artem.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
