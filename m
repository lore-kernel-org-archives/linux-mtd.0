Received: from freesurfmta04.sunrise.ch ([194.230.0.33] helo=freesurfmail.sunrise.ch)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16M9yq-0002IX-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 15:40:32 +0000
Received: from theodul (194.230.169.161) by freesurfmail.sunrise.ch (6.0.037)
        id 3C29156E0006EA1F for linux-mtd@lists.infradead.org; Thu, 3 Jan 2002 16:44:58 +0100
From: Felix Frey <ffrey@freesurf.ch>
To: linux-mtd@lists.infradead.org
Subject: Compatibility between m-system and mtd-driver
Date: Thu, 3 Jan 2002 16:51:16 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
MIME-Version: 1.0
Message-Id: <02010316511600.01040@theodul>
Content-Transfer-Encoding: quoted-printable
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

Hi folks,

I have a x86-board with a DOC-millenium. The DOC contains a single partit=
ion=20
with a ext2-fs which is intented to be the rootfs. The partition was crea=
ted=20
and populated using the m-system driver v4.2.
When I use a kernel 2.4.9 with included mtd- and nftl-support, everything=
=20
works fine. On boot up the kernel reports:

  M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
  $Id: nftlcore.c,v 1.73 2001/06/09 01:0943 dwmw2 Exp $
  Partition Check:
   nftla: nftla1
  VFS: Mounted root (ext2 Filesystem) readonly.
 ....
 init started: Busybox v0.51.....
--------

When I use the latest mtd-code from CVS and try to do the same, I get thi=
s:

  NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 =
$=20
  NFTL_notify_add for DiskOnChip Millennium=20
  NFTL_setup
   nftla: nftla1
  VFS: Mounted root (ext2 filesystem) readonly.
  Freeing unused kernel memory: 48k freed
  Kernel panic: No init found.  Try passing init=3D option to kernel.
----
=2E..and it's definitely not a problem with the init. The kernel seems to=
 mount=20
the filesystem but has problem to read it correctly.=20
There is something which makes it confusing. When I use a harddrive to mo=
unt=20
the rootfs and try to mount and read the DOC-partition later, I don't see=
 any=20
problems.

Any comments ?
Felix
