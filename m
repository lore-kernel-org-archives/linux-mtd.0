Received: from s23012.evanzo-server.de ([62.140.23.12]
	helo=s512.evanzo-server.de)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FrvTV-0001uv-QD
	for linux-mtd@lists.infradead.org; Sun, 18 Jun 2006 07:30:06 -0400
Message-ID: <20060618125542.k4ipq4lfqtpwco88@webmail.7labs.de>
Date: Sun, 18 Jun 2006 12:55:42 +0200
From: Sebastian Haag <Sebastian@7labs.de>
To: linux-mtd@lists.infradead.org
Subject: Use jffs2-formatted initrd from RAM (not Flash)
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a minimal linux system which consists of a bzImage (kernel 2.6.16.5)=
 and
a rootfs (initrd). The rootfs is formatted with ext2. The kernel and initrd=
 is
stored on a bootp server and is loaded at system startup into the system RA=
M.
Kernel gets extracted, mounts the rootfs and executes init.
Everything works fine.

To save memory in RAM, I want to compress the rootfs. I decided to use jffs=
2 as
filesystem, because its writable.

My kernel supports jffs2 filesystems and mtd devices (I hope so).

What I did:
- mkfs.jffs2 -l -o ../jffs_root.img
- test in qemu:

-----------------------------------
INITRD=3Djffs_root.img

qemu $INITRD -kernel bzImage -initrd $INITRD -net nic,vlan=3D0 -net
tap,vlan=3D0,ifname=3Dtap0 -append "root=3D/dev/mtdblock0 rw blkmtd_device=
=3D/dev/ram0
rootfstype=3Djffs2"
-----------------------------------

I added the whole "-append thing", but I=B4m not absolutely sure what I did=
 ;-)
But I=B4m sure, it doesn=B4t work...

I get the following messages:

RAMDISK driver initialized: 1 RAM disks of 4096K size 1024 blocksize
blkmtd: version $Revision: 1.27 $
blkmtd: mtd1: [/dev/ram0] erase_size =3D 128KiB
block2mtd: version $Revision: 1.30 $
...
RAMDISK: Couldn=B4t find valid RAM disk image starting at 0.
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 104k freed
Warning: unable to open an initial console.
Kernel panic - not syncing: No init found. Try passing init=3D option to ke=
rnel.



Do you have an idea which kernel parameters are needed to mount this
jffs2-rootfs properly?

Thanks,

Sebastian
