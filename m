Received: from nm10-vm0.bullet.mail.ird.yahoo.com ([77.238.189.90])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rzt1c-0007X1-39
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 16:57:16 +0000
Message-ID: <1329843430.47249.YahooMailNeo@web29019.mail.ird.yahoo.com>
Date: Tue, 21 Feb 2012 16:57:10 +0000 (GMT)
From: Patrick <kpa_info@yahoo.fr>
Subject: Error whe mounting ubifs volume
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Patrick <kpa_info@yahoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear mailing-list,=0A=0AI am using UBI and UBIFS for the first time on a cu=
stom board that use a SLC NAND. We use the 3.0.21 kernel with UBI and UBIFS=
 enabled.=0AI use mkfs.ubifs to generate a ubifs image of my rootfs with th=
e following arguments: -m 2048 -e 129024 -c 4060=0A=0A=0AI the use the foll=
owing sequence to flash this image and mount it:=0A=0Aflash_eraseall /dev/m=
td4=0Aubiformat /dev/mtd4=0Aubiattach -p /dev/mtd4=0Aubimkvol /dev/ubi0 -N =
volume_name -s 128MiB=0Aubiupdatevol /dev/ubi0_0 my_rootfs.ubifs=0Amount -t=
 ubifs ubi0:volume_name /media/test=0A=0AEverything works well but when doi=
ng the mount I have the following error:=0A=0Amount: wrong fs type, bad opt=
ion, bad superblock on /dev/ubi0_0,=0A=A0=A0=A0=A0=A0=A0 missing codepage o=
r helper program, or other error=0A=A0=A0=A0=A0=A0=A0 In some cases useful =
info is found in syslog - try=0A=A0=A0=A0=A0=A0=A0 dmesg | tail=A0 or so=0A=
=0A=0AOn the kernel log I have the following error:=0A=0A=A0UBIFS error (pi=
d 397): ubifs_read_node: bad node type (0 but expected 6)=0A=A0UBIFS error =
(pid 397): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 1=0A=0A=
=0AI am probably doing something wrong but I am not able to point what's th=
e problem.=0A=0AAny help is welcome. Thanks in advance=0A=0APatrick=0A
