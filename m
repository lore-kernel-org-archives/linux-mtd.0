Received: from mail.kernelconcepts.de ([212.60.202.196])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqRKn-0002jH-BK
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 11:48:05 +0000
Received: from [192.168.2.159]
	by mail.kernelconcepts.de with esmtpa (Exim 4.63)
	(envelope-from <simon.budig@kernelconcepts.de>) id 1KqRUC-0002bZ-H9
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 13:57:48 +0200
Message-ID: <48F729ED.60704@kernelconcepts.de>
Date: Thu, 16 Oct 2008 13:47:57 +0200
From: Simon Budig <simon.budig@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS-Problem: overlapping first node (?)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all.

I am currently trying to debug a problem with a broken JFFS2-filesystem.
We have an JFFS-Image here that crashes our kernel when trying to mount
it. I am fairly certain that the image is corrupt (although I am unsure
how this happened) but then mounting should just fail instead of
crashing the kernel.

First some background: The Platform is a Blackfin-based (BF 561) board,
using an AT45DB642D Dataflash, which has a block size of 1056 bytes.

The kernel - unfortunately - is a 2.6.22.19 since this is the newest one
blackfin.uclinux.org provides as a RC-version.

The crash itself happens in fs/jffs2/readinode.c in
jffs2_add_tn_to_tree(), there is this code snippet:

        if (this) {
                /* If the node is coincident with another at a
                   lower address, back up until the other node is found.
                   It may be relevant */
                while (this->overlapped)
                        this = tn_prev(this);

                /* First node should never be marked overlapped */
                BUG_ON(!this);
                dbg_readinode("'this' found %#04x-%#04x (%s)\n",
                              this->fn->ofs,
                              this->fn->ofs + this->fn->size,
                              this->fn ? "data" : "hole");
        }

There a NULL-Pointer dereference happens in the while loop (which
probably should be written "while (this && this->overlapped)" for the
BUG_ON-Macro to actually have an effect) so for some reason a wrong
- ->overlapped-flag creeps into the data structure at some point.

Does anyone have an idea what could be wrong here? From my glance at the
code this flag seems not to be stored in the flash itself, but is there
anything stored in the flash that could cause this flag to be set
erroneously? It seems to work fine with newly created jffs2-filesystems,
but it worries me, that apparently wrong data in a corrupt jffs2
filesystem can crash the kernel.

One cause of the problem *might* be related to the weird blocksize of
1056 bytes. The partition in question has a size of 1080 blocks,
resulting in 1140480 bytes, which is not divisible by 512. While dd'ing
/dev/mtd0 results in the full number of bytes, dd'ing /dev/mtdblock0
only yields 1140224 bytes. JFFS however seems to properly detect the
block layout, so I am unsure if this really is a problem.

Any help would be greatly appreciated.

Further information (some boot messages and information from /proc):

mtd_dataflash spi1.2: AT45DB642x (8448 KBytes)
Creating 7 MTD partitions on "mtd_dataflash":
0x00729900-0x00840000 : "jffs"
0x00023100-0x00729900 : "kernel"
0x00022080-0x00023100 : "u-boot-env"
0x00431040-0x00729900 : "cramfs"
0x00000000-0x00000420 : "prebootloader"
0x00000420-0x00021000 : "u-boot"
0x00021000-0x00022080 : "u-boot-fallback-env"

JFFS2 write-buffering enabled buffer (1056) erasesize (8448)

root:~> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00116700 00000420 "jffs"
mtd1: 00706800 00000420 "kernel"
mtd2: 00001080 00000420 "u-boot-env"
mtd3: 002f88c0 00000420 "cramfs"
mtd4: 00000420 00000420 "prebootloader"
mtd5: 00020be0 00000420 "u-boot"
mtd6: 00001080 00000420 "u-boot-fallback-env"

root:~> cat /proc/partitions
major minor  #blocks  name

  31     0       1113 mtdblock0
  31     1       7194 mtdblock1
  31     2          4 mtdblock2
  31     3       3042 mtdblock3
  31     4          1 mtdblock4
  31     5        130 mtdblock5
  31     6          4 mtdblock6

Thanks a lot,
         Simon Budig

- --
       Simon Budig                        kernel concepts GbR
       simon.budig@kernelconcepts.de      Sieghuetter Hauptweg 48
       +49-271-771091-17                  D-57072 Siegen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkj3KeYACgkQO2O/RXesiHDM9ACeIikN+pKBWbRpcKoShZ/HNxiw
MzoAn2atn5VRcn8Udv8vjbJqo4rGHsMk
=wmbr
-----END PGP SIGNATURE-----
