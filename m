Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLYTA-0001G1-8L
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 23:27:46 -0500
Received: by zproxy.gmail.com with SMTP id x3so1304936nzd
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Mar 2006 20:27:42 -0800 (PST)
Message-ID: <eae046ff0603202027q74a472ddra7ac62c658b3e91@mail.gmail.com>
Date: Tue, 21 Mar 2006 09:57:42 +0530
From: "Sharad P. Katti" <sharad.katti@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: flashing from linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm working on sigma designs' arm based em8622 board with 2.4.22-2
kernel with uclinux patch applied, in which i have 4MB nor flash which
is amd/fujitsu complaint.

Now, when i try to update the flash with a new initrd image from the
linux, it is allowing me to erase and write only 64Kbytes
where as in the mtdpartitions.h, my Rootfs is having the size of 3840 bytes=
.

dmesg shows me the partitions created in the flash as follows.

Probing EM86XX Flash Memory
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
Using word write method
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to EM86XX mapped flash
Creating 4 MTD partitions on "EM86XX mapped flash":
0x00030000-0x003c0000 : "RootFS"
mtd: Giving out device 1 to RootFS
0x003f0000-0x00400000 : "User"
mtd: Giving out device 2 to User
0x00000000-0x00010000 : "BootROM1"
mtd: Giving out device 3 to BootROM1
0x00010000-0x00030000 : "BootROM2"
mtd: Giving out device 4 to BootROM2

from the flash_info utility, i'm getting the partition informations as
em86xx#./flash_info /dev/mtd/1
MTD_open
MTD_ioctl
Device /MTD_close
dev/mtd/1 has 0 erase regions

and the mtd_debug o/p shows me the erasesize as,

em86xx#./mtd_debug info /dev/mtd/1
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 3932160 (3M)
mtd.erasesize =3D 65536 (64K)
mtd.oobblock =3D 0
mtd.oobsize =3D 0
mtd.ecctype =3D MTD_ECC_NONE
regions =3D 0


These are the steps i followed to write the new image to the flash.
em86xx#flashcp -v /new/Image/romfs.bin /dev/mtd/1
after writing the first 64K of the /dev/mtd/1, i'm getting the warning
message as
"File does not seem to match flash data. First mismatch at 0x00000000
- 0x00002800"

I have set the folowing in my kernel configurations wrt mtd drivers.
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D2
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CONCAT=3Dy
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=3Dy
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=3Dy
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=3Dy
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_EM86XX=3Dy
# CONFIG_MTD_EM86XX_FLASH2 is not set
# CONFIG_MTD_EM86XX_16BIT_BUSWIDTH is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_DRAGONIX is not set
# CONFIG_MTD_NETtel is not set
# CONFIG_MTD_SNAPGEODE is not set
# CONFIG_MTD_NETteluC is not set
# CONFIG_MTD_MBVANILLA is not set
# CONFIG_MTD_KeyTechnology is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_CDB89712 is not set

can anyone shows me a pointer about what could be wrong with the
configurations.?

regards,

--
Sharad P.Katti

"GOD is real, unless declared as an int"
