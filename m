Received: from avanto.mpei.ac.ru ([193.233.71.179] helo=avanto.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ca9wn-0004sS-PY
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2004 04:41:55 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1Ca9ws-0007Q8-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Dec 2004 12:41:58 +0300
From: Dmitry Skorinko <skorinkod@mail.ru>
To: linux-mtd@lists.infradead.org
Date: Fri, 3 Dec 2004 12:42:12 +0300
References: <200412021931.05132.skorinkod@mosk.ru>
In-Reply-To: <200412021931.05132.skorinkod@mosk.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200412031242.12036.skorinkod@mail.ru>
Subject: Re: Booting from DiskOnChip
Reply-To: skorinkod@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

People!
Help me to install grub to DiskOnChip, plz...
Just for BIOS see it... Then I will install system self

This problem stops all my work :(

> I patch and build grub-0.92, then:
>
> # ./doc_loadbios /dev/mtd0 ./grub_firmware
> Performing Flash Erase of length 16384 at offset 0
> ioctl(MEMERASE): Input/output error
> # dmesg | tail -8
> MTD_open
> MTD_ioctl
> MTD_ioctl
> nand_erase: start =3D 0x00000000, len =3D 16384
> nand_isbad_bbt(): bbt info for offs 0x00000000: (block 2) 0x00
> nand_erase: attempt to erase a bad block at page 0x00000000
> MTD_close
> nand_sync: called

if I use M-System tools:

# ./dformat -win:e000 -s:./DOC514.EXB -first -bdkf0:./grub_firmware -y
DFORMAT Version 5.1.4.37 for Linux
Copyright (C) M-Systems, 1992-2002

DiskOnChip 2000 TSOP found in 0xe0000.
256M media, 16K unit

=46ormatting =A0 =A0 =A0 =A0 =A0 =A0 =A0 16384
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Mounting Disk Partition 0
Unit 16368 out of 16368

Writing boot image =A0 =A0 =A0 197728

Writing file to BDK 0 =A0 =A098304
OK
Please reboot to let DiskOnChip install itself.
#reboot

BIOS:
searching for boot sector on SCSI... not found

I can dformat flash with DOS:
# ./dformat -win:e000 -s:./DOC514.EXB -first
then from floppy
SYS A: C:
and MS-DOS can boot from flash... =3D> Problem is not in hardware.


Thanks
Dmitry
