Received: from nproxy.gmail.com ([64.233.182.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDtbP-0000Vi-Mm
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2006 20:24:38 -0500
Received: by nproxy.gmail.com with SMTP id l23so772581nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Feb 2006 17:24:26 -0800 (PST)
Message-ID: <d0cf8c90602271724k474cae9dsad5af4fd2ad8f517@mail.gmail.com>
Date: Tue, 28 Feb 2006 09:24:25 +0800
From: "Kein Yuan" <kein.yuan@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Intel J3A Flash support in latest cvs broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
    I am working on PXA270 with Intel J3 flash.  CFI detect is OK and
jffs2 image was correctly written to the place by blob, the
bootloader. However kernel failed to mount jffs2 partition as root
filesystem.  After I boot with NFS as rootfs and tried to use
"flash_eraseall /dev/mtd2" to erase file system partition, it always
reports:

MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
Panther Flash: block erase error: (bad command sequence, status 0x700070)
MTD_ioctl
Panther Flash: block erase error: (status timeout)
MTD_ioctl
Panther Flash: Waiting for chip to be ready timed out. Status 0
MTD_ioctl
Panther Flash: Waiting for chip to be ready timed out. Status 0
MTD_ioctl
Panther Flash: Waiting for chip to be ready timed out. Status 0
MTD_ioctl
Panther Flash: Waiting for chip to be ready timed out. Status 0
MTD_ioctl
Panther Flash: Waiting for chip to be ready timed out. Status 0
MTD_ioctl
Panther Flash: block erase error: (status timeout)
MTD_close
Panther Flash: Waiting for chip to be ready timed out. Status 0


I also checked  drivers/mtd/chips/cfi_cmdset_0001.c :
static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
{
    struct map_info *map =3D mtd->priv;
    struct cfi_private *cfi =3D map->fldrv_priv;
    struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;

    printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
                        "erase on write disabled.\n");
    extp->SuspendCmdSupport &=3D ~1;
}

This function is obviously wrong since it can't be built.  It should be

    struct cfi_pri_intelext *extp =3D cfi->cmdset_priv;
instead of
    struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;


So I am doube does this file still supported?

Can anybody give me some hints that why "bad command sequence, status 0x700=
070"
will happen since I can delect flash by CFI?  The boot log was pasted as be=
low:
...

Probing Panther Flash at physical address 0x00000000 (32-bit bankwidth)
Panther Flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Suspend erase on write disabled.
cfi_cmdset_0001: write suspend disabled
Using buffer write method
erase region 0: offset=3D0x0,size=3D0x40000,blocks=3D128
Using static partitions on Panther Flash
Creating 3 MTD partitions on "Panther Flash":
0x00000000-0x00040000 : "Bootloader"
mtd: Giving out device 0 to Bootloader
0x00040000-0x00240000 : "Kernel"
mtd: Giving out device 1 to Kernel
0x00240000-0x01240000 : "Filesystem"
mtd: Giving out device 2 to Filesystem
MSC0 is 0x7ffc7ff0.
...


Thanks,

Kein
