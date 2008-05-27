Received: from smtp5.centerbeam.com ([63.120.115.250])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K137F-00006g-55
	for linux-mtd@lists.infradead.org; Tue, 27 May 2008 17:37:41 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Need help understanding jffs2 behaviour
Date: Tue, 27 May 2008 10:37:28 -0700
Message-ID: <32C4C619DF66B945B608E59A6791C8C3027BAED1@CBA0E2K11.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20
I have a linux 2.6.22.2 kernel running on an AT91SAM9260, using a
K9F1208U0b(64byte NAND) for storing the filesystem.

When I setup the nand by NFS booting, mounting /dev/mtdblock0 and then
untarring the filesystem into it, the filesystem ends up midway in the
flash, like so

<EMPTY>      <- Location 0
<EMPTY>
<EMPTY>
<START_DATA> <- Location 0x2978000
...

However, when I use u-boot to write the flash image, using=20
Nand write.jffs 22000000 0 $(filesize), the filesystem starts from block
0.

Why does this occur? The starting location and size of my fs indicate
that the filesys seems to be untarred from the bottom of the flash up -
is that default behaviour for mounted flash? I have issues with my
filesys (Segfaults, kernel reports unable to read /proc, etc) in the
first case (when I start at block 0 ), but not when I program the flash
from half way. I don't have nand partitions enabled.

Thanks
Manu
