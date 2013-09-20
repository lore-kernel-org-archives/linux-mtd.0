Received: from s250.sam-solutions.net ([217.21.49.219])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMzCs-0006h7-GS
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2013 11:49:07 +0000
Message-ID: <523C35AA.1000107@sam-solutions.com>
Date: Fri, 20 Sep 2013 14:46:50 +0300
From: Andrei Andreyanau <a.andreyanau@sam-solutions.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: Incorrect detection of Micron MT29F32G08
References: <5237FE9A.5080707@sam-solutions.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA13155@DBDE04.ent.ti.com>
 <523C27BB.5050900@sam-solutions.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA147A0@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA147A0@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Pekon,
20.09.2013 14:23, Gupta, Pekon =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi, Pekon
>> 17.09.2013 15:30, Gupta, Pekon =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Hi, I've faced a problem with the Micron NAND MT29F32G08, which is
>> 4GiBs, 8K blocks per LUN, 224b OOB, 512K erase size, has two planes 4k
>> blocks each. In the kernel (I use v3.0.35) it is detected
>>>> as 2GiB device. Only when I disable part of the code which belongs to
>> ONFI detection, add definition for this device in nand_ids.c (device has
>> id=3D0x48), add 224b OOB table, I can see that it's a
>>>> 4GiBs device, but when I'm trying formatting the largest partition (I =
have 4
>> partitions - barebox, env, kernel, rootfs <- the largest) - it drops an =
I/O error
>> about bad blocks (I did scan and mark
>>>> all bad blocks before)... It seems to me that the amount of pages per =
lun
>> is not detected correctly which leads to incorrect detection of device's=
 size
>> etc. Bad thing is that the datasheet for a/m
>>>> NAND doesn't contain what are the values from NAND-device registers
>> mean (or I missed something). Could you please suggest where to dig?
>>> You can try printing values of following towards end of nand_scan_tail(=
) in
>> drivers/mtd/nand/nand_base.c - mtd->writesize - mtd->erasesize - mtd-
>>> oobsize
>> Here it is what the kernel givewithout any modifications (I mean - with =
ONFI-
>> support enabled):
>> ...
>> ONFI flash detected
>> ONFI param page 0 valid
>> NAND device: Manufacturer ID: 0x2c, Chip ID: 0x48 (Micron
>> MT29F32G08AFACAWP)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3Dnand_scan_tail=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> - writesize=3D4096
>> - erasesize=3D524288
>> - oobsize=3D224
>> gpmi-nand imx6q-gpmi-nand.0: enable asynchronous EDO mode 5
>> Bad block table not found for chip 0
>> Creating 4 MTD partitions on "gpmi-nand":
>> 0x000000000000-0x000000200000 : "bootloader"
>> 0x000000200000-0x000000600000 : "env"
>> 0x000000600000-0x000000e00000 : "kernel"
>> 0x000000e00000-0x000080000000 : "filesystem"
>> GPMI NAND driver registered. (IMX)
>>
>> mtd_debug output (for "filesystem"):
>> $mtd_debug info /dev/mtd5
>> mtd.type =3D MTD_NANDFLASH
>> mtd.flags =3D MTD_WRITEABLE
>> mtd.size =3D 2132803584 (1G)
>> mtd.erasesize =3D 524288 (512K)
>> mtd.writesize =3D 4096 (4K)
>> mtd.oobsize =3D 224
>> regions =3D 0
>>
> Data above is correct ...
> Your "filesystem" partition size =3D (0x80000000 - 0xe00000)
> which is "mtd.size =3D 2132803584"
> mtd->size  is the size of the partition, not the complete
> size of NAND device. It=E2=80=99s the nand_chip->chipsize, which gives
> complete storage density of the NAND device. And
> nand_chip->chipsize =3D lun_count * blocks_per_lun * erasesize;
Yes, I understand, but in second case (without ONFI) it has
detected 4GiB (well, 3GiB remaining after partitioning by the kernel) size.
Moreover, I'm confused a little bit with the fact that with ONFI detection
enabled the driver detects incorrect amount of blocks per lun (4096 instead=
 of 8192)
which in fact results on the total size of the device. According to the dat=
asheet, the
device has two planes 4K blocks each, located on one LUN.
So I should argue with you that the problem is within the driver...
> Now question remains about why you are seeing bad-blocks,
> even after running 'nand scrub' command from u-boot.
> So there can be two reasons for it.
> (1) these are actual badblocks (which are identified again)
> (2) these are fictitious bad blocks due to some problem in your
> NAND flashing utility or nand driver in 3.0.35 kernel version.
>
> For (2) you have to check Freescale support as you are using
> GPMI based driver, or debug using 'nand dump -N' in kernel.
>
> With regards, pekon
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
So, what nanddump gave me:
$nanddump --oob --bb=3Ddumpbad /dev/mtd5
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 8
Number of bbt blocks: 0
Not printing binary garbage to tty. Use '-a'
or '--forcebinary' to override.
(keys --oob/--bb used because it complained about deprecated params)

Also, I tried both, nand scub (in barebox, as I'm using it) as well as nand=
 -d (deregister a bad block aware device) without luck.


Thanks in advance,
Andrei
