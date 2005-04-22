Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOoCj-00037F-B4
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 22:47:42 -0400
Received: by wproxy.gmail.com with SMTP id 37so513099wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2005 19:47:42 -0700 (PDT)
Message-ID: <29f91651050421194778a08471@mail.gmail.com>
Date: Thu, 21 Apr 2005 22:47:42 -0400
From: alfred hitch <alfred.hitch@gmail.com>
To: Murali Sampath <msampath@ai-logix.com>
In-Reply-To: <B2627A2E13B6DE4BADE1746A7DFBFA7E07B7A9@aimsg.corp.audiocodes.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <B2627A2E13B6DE4BADE1746A7DFBFA7E07B7A9@aimsg.corp.audiocodes.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 File System Problem for ST MICRO ELECTRONICS FLASH
Reply-To: alfred hitch <alfred.hitch@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hey did u guys  try correct block size while making jffs2 images ?

Cheers,
Alfred

On 4/21/05, Murali Sampath <msampath@ai-logix.com> wrote:
> HI
>=20
> I am using the Uboot and also I have AMD29LV640 flash device. I still get=
 the jffs2_scan_erase_block errors.
> I am stuck not able to get JFFS2 to work right. Any suggestions will  be =
greatly appreciated. I have no problem in using NFS.
> Thanks
> When I dump the memory I see the file system flashed in correctly. Iam st=
ill missing something.
>=20
> *************************************************************************
> Trace on my board looks like the following.
>=20
> PPP generic driver version 2.4.2
> PPP Deflate Compression module registered
> PowerPC/UBoot 8xx/8xxx flash device: 0x800000 bytes at 0xff800000 (16 bit=
s wide)
> PowerPC/Uboot 8xx/8xxx boards: Found 1 x16 devices at 0x0 in 16-bit mode
>  Amd/Fujitsu Extended Query Table at 0x0040
> PowerPC/Uboot 8xx/8xxx boards: CFI does not contain boot bank location. A=
ssuming top.
> number of CFI chips: 1
>=20
> cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
>=20
> Creating 4 MTD partitions on "PowerPC/Uboot 8xx/8xxx boards":
> 0x00000000-0x00040000 : "UbootConfig"
> mtd: Giving out device 0 to UbootConfig
> 0x00040000-0x00700000 : "JFFS2"
> mtd: Giving out device 1 to JFFS2
> 0x00700000-0x00780000 : "U-Boot"
> mtd: Giving out device 2 to U-Boot
> 0x00780000-0x00800000 : "Linux"
> mtd: Giving out device 3 to Linux
>=20
> ******
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030000: 0x=
0808 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030004: 0x=
0808 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030008: 0x=
6666 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003000c: 0x=
6666 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030010: 0x=
0606 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030014: 0x=
0606 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030018: 0x=
4646 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003001c: 0x=
4646 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030100: 0x=
3aa0 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030104: 0x=
6000
> *******
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of alfred hitch
> Sent: Thursday, April 21, 2005 10:01 AM
> To: Vikrant_Basotra
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: JFFS2 File System Problem for ST MICRO ELECTRONICS FLASH
>=20
> I am not too sure, but cna u try eraseall on the mtd partition
> and then write ur image using netflash or whatever u use ..
> also make sure ur jffs2 image was padded correctly.
>=20
> Cheers,
> Alfred
>=20
> On 4/21/05, Vikrant_Basotra <Vikrant_Basotra@satyam.com> wrote:
> > Hello All,
> > My board has one 16-bit flash: ST M29W640DB.
> >
> > M29W640DB (16 bit bus):
> >
> > 0x00000000-0x00700000 : "Root"
> > 0x00700000-0x00720000 : "U-Boot Bootloader"
> > 0x00720000-0x01000000 : "Linux Kernel"
> >
> > When power on, Linux kernel boots from flash and print out info such as=
:
> > "
> > ..............................................
> > PPP generic driver version 2.4.2
> > ..............................................
> > EP8248 flash map (size->0x800000 mem->0xFF800000)
> > Amd/Fujitsu Extended Query Table v1.3 at 0x0040
> > number of CFI chips: 1
> > cfi_cmdset_0002: Disabling fast programming due to code brokenness.
> > Creating 3 MTD partitions on "EP8248 flash memory":
> > 0x00000000-0x00700000 : "Root"
> > 0x00700000-0x00720000 : "U-Boot Bootloader"
> > 0x00720000-0x01000000 : "Linux Kernel"
> >
> > ......................................
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000: =
0x0020 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004: =
0x22df instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006000c: =
0x0008 instead
> > Further such events for this erase block will not be printed
> > ................................................................
> > Further such events for this erase block will not be printed
> > JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0000: =
0x0020 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004: =
0x22df instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c000c: =
0x0008 instead
> >
> > Further such events for this erase block will not be printed
> > JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
> > ....................................................................
> > ....................................................................
> > "
> > In u-boot, I entered commands to display memory:
> > u-boot=3D> md 0xff000000
> > The magic number 0x1985 IS here!No 0x0020 exists at all!!
> >
> > It's quite strange!! Why Linux detects 0x0020 instead?
> >
> > Why U-boot can read the data on flash correctly while linux can't?
> >
> > Why linux always read all data as 0x0020?
> >
> > When I simply replace ST M29W640DB with AMD AM29DL640D (the two chips a=
re
> > pin-to-pin compatible,) JFFS2 works very fine!
> >
> > What's the problem?
> >
> > I don't want to use AMD FLASH, can u suggest me what necessary changes =
are to be made in the code so that the ST M29W640DB Flash work,
> >
> > Regards,
> > VB
> >
> > DISCLAIMER:
> > This email (including any attachments) is intended for the sole use of =
the intended recipient/s and may contain material that is CONFIDENTIAL AND =
PRIVATE COMPANY INFORMATION. Any review or reliance by others or copying or=
 distribution or forwarding of any or all of the contents in this message i=
s STRICTLY PROHIBITED. If you are not the intended recipient, please contac=
t the sender by email and delete all copies; your cooperation in this regar=
d is appreciated.
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
