Received: from [213.170.46.14] (helo=madimc2.indra.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MqhG-0004K8-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 14:21:47 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Carlos Mateo <cmateo@indra.es>
Reply-To: cmateo@indra.es
To: "Alejandro O. Gonzalez" <aogonzalez@uolsinectis.com.ar>,
 <linux-mtd@lists.infradead.org>
Subject: Re: Linux installation on DOC / problems / I need your help
Date: Fri, 13 Dec 2002 15:50:02 -0100
References: <002c01c2a2a9$54ea2900$a2e4f4d8@nnn123>
In-Reply-To: <002c01c2a2a9$54ea2900$a2e4f4d8@nnn123>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212131550.02199.cmateo@indra.es>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The second problem you described (UnitSizeFactor !=3D 1) was solved some =
time=20
ago.  Try the latest CVS code.
I have used it with DFORMAT and grub as bootloader and it works.

Carlos Mateo

El Vie 13 Dic 2002 12:12, Alejandro O. Gonzalez escribi=F3:
> I rebuild the kernel. Then I made this
>
> 1- run the driver
> #modprobe doc2000
> #modprobe docprobe
>
> 2- format the memory
> #nftl_format /dev/mtd0 0 16777216
>
> 3- run nftl
> #modprobe nftl
>
> 4- make a partition
> #fdisk /dev/nftla
> I make two partition first DOS, and second Linux.
>
> 5- make filesystem
> #mkfs.msdos /dev/nftla1
> #mke2fs /dev/nftla2
>
> 6-Install syslinux
> #syslinux /dev/nftla1
>
> 7-configure boot and reboot
>
> I don=B4t know if this procedure is correct, but when reboot the bios n=
ot
> found a valid boot device.
> When I format all memory with nftl_format command I delete the TrueFFS =
bios
> of MSYS. This is Ok ?
>
> I try then to overwrite the TrueFFS bios driver
>
> DFORMAT /WIN:E000 /S:DOC512.EXB /NOFORMAT /FIRST
>
> but display an error, can=B4t write the bios.
>
> I do so that the bios recognize the DOC like a valid device of boot.
>
> I try also to format with MSYS utility, then create a 2MB of DOS partit=
ion.
> Boot with linux and format the last 14 MB of memory with
> nftl_format. But when startup nftl driver says "we don=B4t support
> UnitSizeFactor!=3D1" and it is not possible to work with a nftl partiti=
on.
> I will appreciate any commentary, thank you for your time.
> Regards,
> Alejandro Gonzalez
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
