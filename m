From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Thu, 27 Feb 2003 20:41:54 +0100
Subject: Latest recommended release to use with 2.4.18 kernel
In-Reply-To: <D775A533262CD141BADE285756C75FEA0141FEA1@cdasc02.sc.rd.canon.com>
References: <D775A533262CD141BADE285756C75FEA0141FEA1@cdasc02.sc.rd.canon.com>
Message-ID: <20030227194154.GB29233@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 27 February 2003 10:50:06 -0800, Suzuki, Stephanie wrote:
> 
> I checked out this release and ran the patch script in mtd/patches/patchin.sh against my kernel source. However, I found that only directory fs/jffs was updated and not fs/jffs2. Furthermore, jffs2 header files in include/linux were not updated as well. I hand-edited the script file to make the necessary links to jffs2 files to see if it would work. However, I ran into a lot of compilation problems with header files not in the correct place, zlib function calls not available, etc. This led me to believe that maybe PHASE2_FINAL_BETA is not the correct tag version to use for kernel 2.4.18.

You need the shared zlib patch. Look in dwmw2's home on www.kernel.org
or search the archives for it, shouldn't be too hard to find.

J?rn

-- 
Victory in war is not repetitious.
-- Sun Tzu
