From: mal@komcept.com (MAL)
Date: Wed, 26 Feb 2003 19:23:38 +0000
Subject: devfs & mtd
Message-ID: <3E5D143A.2060806@komcept.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi, i'm using a DiskOnChip 2000 48MB, with a 2.4.20 kernel, the CVS MTD 
patches and a patched grub CVS.

I'm also running devfsd, but only to set up legacy /dev nodes, (-np).

All works fine, as long as I use /dev/root as the root fs in fstab.  If 
I try to use /dev/nftl/disk0/part1, (which exists), the filesystem fails 
to mount at init, (even read-only), stating that the device cannot be found.

Yes, devfsd starts _before_ the filesystem mount.

Setting the root filesystem to /dev/root, (which points to 
/dev/nftl/disk0/part1 !), works fine.

Additionally, I still have to pass root=/dev/nftla1 to the kernel, even 
though this location doesn't exist!

Please can someone help me understand how this archaic mess up works :)

Cheers,
MAL
