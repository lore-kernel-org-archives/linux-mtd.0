Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVeJx-0006i9-KZ
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2010 06:06:39 +0000
Received: by fxm19 with SMTP id 19so5697894fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 22:06:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1292777645.13362.3.camel@koala>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
	<1292340409.2538.40.camel@localhost>
	<AANLkTi=zB7UBjkvGYv_wdwZpH1Ghatn6eye1z5616h4X@mail.gmail.com>
	<1292777645.13362.3.camel@koala>
Date: Thu, 23 Dec 2010 14:06:33 +0800
Message-ID: <AANLkTikSVLNaFOT55piRosOCyJ9uXQ85QD0u3w75UimU@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Jason Liu <liu.h.jason@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Jason Liu <r64343@freescale.com>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem,

2010/12/20 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2010-12-15 at 09:55 +0800, Jason Liu wrote:
>> > =9A =9A =9A =9A/* Do not allow reads past end of device */
>> > =9A =9A =9A =9Aif (unlikely(from >=3D mtd->size ||
>> > =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A ops->ooboffs + readlen > ((mtd=
->size >> chip->page_shift) -
>> > =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A =9A(from >> chip->page_shift)) * len)) {
>> > =9A =9A =9A =9A =9A =9A =9A =9ADEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt re=
ad beyond end "
>> > =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A =9A"of device\n", __func__);
>> > =9A =9A =9A =9A =9A =9A =9A =9Areturn -EINVAL;
>> > =9A =9A =9A =9A}
>>
>> Here the mtd->size in nand_base.c should be the NAND flash chip size,
>
> I think this is partition size as well.

I think you are wrong. This should be the NAND flash chip size not the
partition size.

>
>> while in nand_oobtest,
>>
>> =9A =9A =9A =9A =9A =9A =9A /* Attempt to read off end of device */
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.mode =9A =9A =9A=3D MTD_OOB_AUTO;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.len =9A =9A =9A =3D 0;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.retlen =9A =9A=3D 0;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.ooblen =9A =9A=3D mtd->ecclayout->oo=
bavail;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.oobretlen =3D 0;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.ooboffs =9A =3D 1;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.datbuf =9A =9A=3D NULL;
>> =9A =9A =9A =9A =9A =9A =9A =9A ops.oobbuf =9A =9A=3D readbuf;
>> =9A =9A =9A =9A =9A =9A =9A =9A printk(PRINT_PREF "attempting to read pa=
st end of device\n");
>> =9A =9A =9A =9A =9A =9A =9A =9A printk(PRINT_PREF "an error is expected.=
..\n");
>> =9A =9A =9A =9A =9A =9A =9A =9A err =3D mtd->read_oob(mtd, mtd->size - m=
td->writesize, &ops);
>> =9A =9A =9A =9A =9A =9A =9A =9A if (err) {
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A printk(PRINT_PREF "error=
 occurred as expected\n");
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A err =3D 0;
>> =9A =9A =9A =9A =9A =9A =9A =9A } else {
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A printk(PRINT_PREF "error=
: read past end of device\n");
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A errcnt +=3D 1;
>> =9A =9A =9A =9A =9A =9A =9A =9A }
>> =9A =9A =9A =9A }
>>
>> here, mtd->size is mtd partition size right? when the mtd partition is
>> not the last MTD partition, the error will happen.
>
> I think this is the same in both. Try to debug this with printks().
>
>>
>> I have tested on real NAND, while not on nandsim.
>
> Please, try to reproduce this with nandsim as well, and if it works, try
> to find out why (using printk debugging)

Yes, I have reproduce this issue with nandsim, please check the following l=
og,

root@freescale ~$ insmod nandsim.ko first_id_byte=3D0x20
second_id_byte=3D0xaa third_id_byte=3D0x00 fourth_id_byte=3D0x15
parts=3D0x400,0x400
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
NAND device: Manufacturer ID: 0x20, Chip ID: 0xaa (ST Micro NAND
256MiB 1,8V 8-bit)
flash size: 256 MiB
page size: 2048 bytes
OOB area size: 64 bytes
sector size: 128 KiB
pages number: 131072
pages per sector: 64
bus width: 8
bits in sector size: 17
bits in page size: 11
bits in OOB size: 6
flash size with OOB: 270336 KiB
page address bytes: 5
sector address bytes: 3
options: 0x8
Scanning device for bad blocks
Creating 2 MTD partitions on "NAND 256MiB 1,8V 8-bit":
0x000000000000-0x000008000000 : "NAND simulator partition 0"
0x000008000000-0x000010000000 : "NAND simulator partition 1"
root@freescale ~$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00300000 00080000 "bootloader"
mtd1: 00500000 00080000 "nand.kernel"
mtd2: 10000000 00080000 "nand.rootfs"
mtd3: 10000000 00080000 "nand.userfs1"
mtd4: df800000 00080000 "nand.userfs2"
mtd5: 08000000 00020000 "NAND simulator partition 0"
mtd6: 08000000 00020000 "NAND simulator partition 1"
root@freescale ~$ insmod mtd_oobtest.ko dev=3D5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_oobtest: MTD device: 5
mtd_oobtest: MTD device size 134217728, eraseblock size 131072, page
size 2048, count of eraseblocks 1024, pages per eraseblock
64, OOB size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 1024 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 1024 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written 1024 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified 1024 eraseblocks
mtd_oobtest: test 2 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 1024 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written 1024 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified 1024 eraseblocks
mtd_oobtest: test 3 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 1024 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written 1024 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified 1024 eraseblocks
mtd_oobtest: test 4 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 1024 eraseblocks
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
mtd_oobtest: error: read past end of device
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error: read past end of device
mtd_oobtest: test 5 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 1024 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written 1023 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified 1023 eraseblocks
mtd_oobtest: finished with 2 errors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

>
> --
> Best Regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
