Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvSl-0007jT-D9
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:33 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 00/21] UBI: various rework/cleanup/fixes
Date: Mon,  5 Sep 2016 17:04:51 +0200
Message-Id: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is a set of cleanup patches (+one fix in patch 4 for a bug that
is unlikely to happen).

Note that I'm not doing that for fun. I'm currently trying to patch UBI
to support the 'LEB consolidation' concept (which is the solution we're
heading to for reliable MLC NAND support), and the duplication of
similar code blocks makes this transition harder to code/review.

If you want to see the big picture, here is my development branch [1].
It contains the current state of MLC support in UBI. It's not finished
yet, but should give a good idea why the cleanup changes are needed. 

Regards,

Boris

Changes since v1:
- add a more rework/cleanups to ease future introduction of MLC support

[1]https://github.com/bbrezillon/linux-sunxi/commits/ubi/mlc

Boris Brezillon (17):
  UBI: fastmap: use ubi_find_volume() instead of open coding it
  UBI: fix add_fastmap() to use the vid_hdr passed in argument
  UBI: fastmap: avoid multiple be32_to_cpu() when unneccesary
  UBI: fastmap: scrub PEB when bitflips are detected in a free PEB EC
    header
  UBI: factorize code used to manipulate volumes at attach time
  UBI: factorize destroy_av() and ubi_remove_av() code
  UBI: fastmap: use ubi_rb_for_each_entry() in unmap_peb()
  UBI: fastmap: use ubi_io_{read,write}_data() instead of
    ubi_io_{read,write}()
  UBI: provide helpers to allocate and free aeb elements
  UBI: move the global ech and vidh variables into struct
    ubi_attach_info
  UBI: simplify recover_peb() code
  UBI: simplify LEB write and atomic LEB change code
  UBI: add an helper to check lnum validity
  UBI: provide an helper to check whether a LEB is mapped or not
  UBI: provide an helper to query LEB information
  UBI: hide EBA internals
  UBI: introduce the VID buffer concept

 drivers/mtd/ubi/attach.c  | 304 ++++++++++++++--------
 drivers/mtd/ubi/build.c   |   2 +-
 drivers/mtd/ubi/cdev.c    |   4 +-
 drivers/mtd/ubi/eba.c     | 637 +++++++++++++++++++++++++++-------------------
 drivers/mtd/ubi/fastmap.c | 188 ++++++--------
 drivers/mtd/ubi/io.c      |  39 +--
 drivers/mtd/ubi/kapi.c    |  16 +-
 drivers/mtd/ubi/ubi.h     | 132 +++++++---
 drivers/mtd/ubi/vmt.c     |  40 ++-
 drivers/mtd/ubi/vtbl.c    |  17 +-
 drivers/mtd/ubi/wl.c      |  19 +-
 11 files changed, 829 insertions(+), 569 deletions(-)

-- 
2.7.4
