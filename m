From: Stephanie.Suzuki@cda.canon.com (Suzuki, Stephanie)
Date: Thu, 27 Feb 2003 10:50:06 -0800
Subject: Latest recommended release to use with 2.4.18 kernel
Message-ID: <D775A533262CD141BADE285756C75FEA0141FEA1@cdasc02.sc.rd.canon.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I am trying to get a more recent, release of mtd/jffs2 for my linux =
2.4.18 kernel.  From the dialog on this mailing list, it seems that =
there are many fixes since the version that was integrated into 2.4.18 =
kernel.  I looked at the tags in CVS and PHASE2_FINAL_BETA seems to be =
the most recent tag available.

I checked out this release and ran the patch script in =
mtd/patches/patchin.sh against my kernel source. However, I found that =
only directory fs/jffs was updated and not fs/jffs2. Furthermore, jffs2 =
header files in include/linux were not updated as well. I hand-edited =
the script file to make the necessary links to jffs2 files to see if it =
would work. However, I ran into a lot of compilation problems with =
header files not in the correct place, zlib function calls not =
available, etc. This led me to believe that maybe PHASE2_FINAL_BETA is =
not the correct tag version to use for kernel 2.4.18.

I am wondering if there is a tagged version available that is applicable =
to kernel 2.4.18? I am hesitant in using the latest checked-in version =
as it is still a work-in-progress.

Stephanie Suzuki
