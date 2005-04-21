Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOcF3-0008FI-8L
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 10:01:18 -0400
Received: by wproxy.gmail.com with SMTP id 37so379898wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2005 07:01:19 -0700 (PDT)
Message-ID: <29f91651050421070154aa1afc@mail.gmail.com>
Date: Thu, 21 Apr 2005 10:01:12 -0400
From: alfred hitch <alfred.hitch@gmail.com>
To: Vikrant_Basotra <Vikrant_Basotra@satyam.com>
In-Reply-To: <D8595042F3765A4285B848A78A2C2ED1016149@bsdmsg002.corp.satyam.ad>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <D8595042F3765A4285B848A78A2C2ED1016149@bsdmsg002.corp.satyam.ad>
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

I am not too sure, but cna u try eraseall on the mtd partition=20
and then write ur image using netflash or whatever u use ..=20
also make sure ur jffs2 image was padded correctly.

Cheers,
Alfred

On 4/21/05, Vikrant_Basotra <Vikrant_Basotra@satyam.com> wrote:
> Hello All,
> My board has one 16-bit flash: ST M29W640DB.
>=20
> M29W640DB (16 bit bus):
>=20
> 0x00000000-0x00700000 : "Root"
> 0x00700000-0x00720000 : "U-Boot Bootloader"
> 0x00720000-0x01000000 : "Linux Kernel"
>=20
> When power on, Linux kernel boots from flash and print out info such as:
> "
> ..............................................
> PPP generic driver version 2.4.2
> ..............................................
> EP8248 flash map (size->0x800000 mem->0xFF800000)
> Amd/Fujitsu Extended Query Table v1.3 at 0x0040
> number of CFI chips: 1
> cfi_cmdset_0002: Disabling fast programming due to code brokenness.
> Creating 3 MTD partitions on "EP8248 flash memory":
> 0x00000000-0x00700000 : "Root"
> 0x00700000-0x00720000 : "U-Boot Bootloader"
> 0x00720000-0x01000000 : "Linux Kernel"
>=20
> ......................................
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000: 0x=
0020 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004: 0x=
22df instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006000c: 0x=
0008 instead
> Further such events for this erase block will not be printed
> ................................................................
> Further such events for this erase block will not be printed
> JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0000: 0x=
0020 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004: 0x=
22df instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c000c: 0x=
0008 instead
>=20
> Further such events for this erase block will not be printed
> JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
> ....................................................................
> ....................................................................
> "
> In u-boot, I entered commands to display memory:
> u-boot=3D> md 0xff000000
> The magic number 0x1985 IS here!No 0x0020 exists at all!!
>=20
> It's quite strange!! Why Linux detects 0x0020 instead?
>=20
> Why U-boot can read the data on flash correctly while linux can't?
>=20
> Why linux always read all data as 0x0020?
>=20
> When I simply replace ST M29W640DB with AMD AM29DL640D (the two chips are
> pin-to-pin compatible,) JFFS2 works very fine!
>=20
> What's the problem?
>=20
> I don't want to use AMD FLASH, can u suggest me what necessary changes ar=
e to be made in the code so that the ST M29W640DB Flash work,
>=20
> Regards,
> VB
>=20
> DISCLAIMER:
> This email (including any attachments) is intended for the sole use of th=
e intended recipient/s and may contain material that is CONFIDENTIAL AND PR=
IVATE COMPANY INFORMATION. Any review or reliance by others or copying or d=
istribution or forwarding of any or all of the contents in this message is =
STRICTLY PROHIBITED. If you are not the intended recipient, please contact =
the sender by email and delete all copies; your cooperation in this regard =
is appreciated.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
