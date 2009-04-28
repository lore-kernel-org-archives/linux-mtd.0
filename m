Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyoGk-0001tS-Ew
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 14:26:52 +0000
Received: by qw-out-1920.google.com with SMTP id 4so471111qwk.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 07:26:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
References: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
	<Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
Date: Tue, 28 Apr 2009 09:21:20 -0500
Message-ID: <587a08410904280721k30a5045bifb03423ae3aed3ec@mail.gmail.com>
Subject: Re: Mounting NAND flash as the root file system
From: Jatin Sharma <sharmaj@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>, gausinghnsit@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Actually, I was mounting the block device but wrote it wrong in the email.

WDS# mount -t jffs2 /dev/mtdblock0 /mnt
mount: mounting /dev/mtdblock0 on /mnt failed

Since the flash_eraseall and nandwrite tools are working on the NAND
device, NAND driver is working fine. Would you agree? I don't have the
nanddump tools on my file system but will include it to make sure NAND
is getting updating after being written by nandwrite.

I am planning to turn on JFFS2 debug in the kernel to see any related
errors. I have the following switches in my .config file:

CONFIG_MTD=3Dy
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_NAND=3Dy
CONFIG_MTD_NAND_ISPAN=3Dy
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
CONFIG_JFFS2_FS_NAND=3Dy

I would appreciate if you could give some direction on where to debug
for mount problems.

Thanks,
Jatin


2009/4/28 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Mon, 27 Apr 2009, Jatin Sharma wrote:
>
>> When I boot the kernel using ramdisk (FS in RAM), I am able to run the
>> flash_eraseall utility successfully. But the mount command fails:
>>
>> WDS# mount -t jffs2 /dev/mtd0 /mnt
>> mount: mounting /dev/mtd0 on /mnt failed
>
> You should be using the block device - /dev/mtdblock0 - and not the
> character device when mounting.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30
>
