Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6urm-0003U6-F2
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 13:16:07 -0500
Received: by wproxy.gmail.com with SMTP id 37so473829wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Mar 2005 10:16:05 -0800 (PST)
Message-ID: <6934efce05030310155f826538@mail.gmail.com>
Date: Thu, 3 Mar 2005 10:15:52 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20050303140816.GA17270@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
References: <20050303140816.GA17270@synertronixx3>
Subject: Re: xip AND sync burst modus
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 Mar 2005 15:08:17 +0100, Konstantin Kletschke <lists@ku-gbr.de> w=
rote:
>=20
> Hi people!
>=20
> I am still desperately trying to get this XIP stuff stable running in
> conjuntion with the sync burst modus of intel K3 flash devices.
>=20
> General I think the XIP Kernel runs well.
> I set up the PageModeEmulation Mode between the flash device and the
> i.MX microcontroller and a XIP Kernel is running fine with the root file
> system on the same device, no problems.

What is PageModeEmulation?
=20
> But XIP is only saving time on my computer, if I succesfully enable the
> sync burst modus of the flash interface.

I don't understand this statement.  Can you clarify?

> Sometimes a XIP kernel boots with sync burst mode enabled but it breaks
> while mounting the root filesystem, most often at the same place.
> Of course I think I set up the sync burst modus wrong so the interface
> is unstable and all is my fault.
>=20
> But what I wonder is, when I put the xip Kernel into the
> Flash in sync burst modus but mounted the root via nfs all worked very
> fine, including mountig reading an writing jffs2 filesystems in the
> flash device.
> Also there are some other issues which are working well when sync burst m=
odus
> is enabled but should not when my setup is broken:
>=20
> mtest in u-boot runs fine.
>=20
> imls in u-boot _always_ looks like:
>=20
> scb9328> imls
> Image at 10040000:
>    Image Name:   Linux-2.6.10-rc2
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1357940 Bytes =3D  1.3 MB
>    Load Address: 08008000
>    Entry Point:  08008000
>    Verifying Checksum ... OK
>    ^^^^^^^^^^^^^^^^^^
> crc32 around varying regions with different length _always_ have same
> checksums when repeated.

Can you give an example?
Is the crc32 for a given length always the same?

> The mounting of the root file system breaks _always_ this way:
>=20
> Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
> scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank
>  Intel/Sharp Extended Query Table at 0x0031
> Using buffer write method
> cfi_cmdset_0001: Erase suspend on write enabled
> 5 cmdlinepart partitions found on MTD device scb9328_flash
> Creating 5 MTD partitions on "scb9328_flash":
> 0x00000000-0x00020000 : "U-boot"
> 0x00020000-0x00040000 : "U-boot_env"
> 0x00040000-0x00240000 : "kernel"
> 0x00240000-0x00740000 : "root"
> 0x00740000-0x01000000 : "fs"
> NET: Registered protocol family 2
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 1024 bind 2048)
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x00037448: Read 0x9=
acd7a6e, calculated 0x2dcc220b
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x0006c4ac: Read 0x0=
3371d6d, calculated 0xb77e85a5
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x0008f20c: Read 0xb=
08c7dea, calculated 0xc2706a75
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 60K
> Kernel panic - not syncing: No init found.  Try passing init=3D option to=
 kernel.
>=20
> Reset, bootm:
>=20
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x00037448: Read 0x9=
acd7a6e, calculated 0x2dcc220b
> Name for which CRC failed is (now) 'ld-uClibc-0.9.26r', ino #186
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x0006c4ac: Read 0x0=
3371d6d, calculated 0xb77e85a5
> Name for which CRC failed is (now) 'libresolv-0.=D1', ino #209
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x0008f20c: Read 0xb=
08c7dea, calculated 0xc2706a75
> Name for which CRC failed is (now) 'modules.ieee=DE', ino #222
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 76K
> Kernel panic - not syncing: No init found.  Try passing init=3D option to=
 kernel.
>=20
> Regardeless if xip kernel, classic non xip kernel loaded per tftpboot
> and started via bootm, classic setup with boot by copying and decompressi=
ng
> into ram by u-boot.
>=20
> Has anybody sync burst modus on intel K3 flash running with an ARM9
> based microcontroller whome I can share experiences with?
>=20
> As said. Of course my hardware setup may be broken, but there are so
> many software constellations, which always breaks the same way! I would
> 100% blame hardware setup if things would break a little else every boot
> or such...
>=20
> Kind regards, Konsti
>=20
> --
> GPG KeyID EF62FCEF
> Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

If the XIP kernel is working but jffs2 fails I would assume one of the
following is true:
1-your kernel code is not bursting
2-your jffs2 image is bad
3-your jffs2 code is bad
4-your flash is in status mode when the system starts mounting

I would try another flash based fs.  If another flash based fs mounts.
 Then it is less likely 2,3, and 4 are problems.  Try using cramfs
patched with the CELF cramfs-linear-xip-3.patch from
http://tree.celinuxforum.org/CelfPubWiki/PatchArchive it doesn't patch
cleanly to 2.6.10 but the fix is easy to do manually.
