Date: Sat, 27 Aug 2016 21:43:34 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org
Subject: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline parameter
Message-ID: <20160827194326.GA1817@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

In an attempts to fix the flaws of the current set of UBI-related
patches we are carrying in OpenWrt, I re-wrote the way mounting the
rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
which cannot be easily addressed using other means which are already
available in the kernel is the fact that UBIFS and squashfs-on-UBI
require different parameters to be set on the cmdline, e.g.
for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs

The idea behind this patchset is to provide a single syntax which
allows mouting rootfs in both cases. To achieve that, the parsing of
the volume name string from UBIFS is moved to UBI, so it can be
reused by other in-kernel users. This is then used by init/do_mounts.c
to create a ubiblock device if the filesystem on the device is
non-UBIFS. To actually set this device to be ROOT_DEV, ubiblock_create
is extended to allow passing-back the created ubiblock device.

With those changes, a single set of cmdline parameters is
sufficient to mount either UBIFS or any other block filesystem
by creating a ubiblock device:
ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs

Please comment on the code, which is to considered a loose draft hacked
up during this evening -- it's untested and certainly still has a lot
of flaws. Yet, I felt it'd be good to discuss the general direction at
this early stage.

Cheers

Daniel


Daniel Golle (3):
  UBIFS, UBI: move volume string parser from UBIFS to UBI
  mtd: ubiblock: introduce ubiblock_create_dev
  init: auto-create ubiblock device for non-UBIFS rootfs on UBI

 drivers/mtd/ubi/block.c | 11 ++++++++-
 drivers/mtd/ubi/kapi.c  | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |  2 ++
 fs/ubifs/super.c        | 64 +-----------------------------------------------
 include/linux/mtd/ubi.h | 17 +++++++++++++
 init/do_mounts.c        | 62 ++++++++++++++++++++++++++++++++++++++++------
 6 files changed, 150 insertions(+), 71 deletions(-)

-- 
2.9.3
