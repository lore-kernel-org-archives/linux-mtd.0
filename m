Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bc6Cz-0003sp-R1
 for linux-mtd@lists.infradead.org; Tue, 23 Aug 2016 07:33:19 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/7] UBI: various cleanup/fixes
Date: Tue, 23 Aug 2016 09:32:47 +0200
Message-Id: <1471937574-8045-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is a set of cleanup patches (+one fix in patch 3 for a bug that
is unlikely to happen).

Note that I'm not doing that for fun. I'm currently trying to patch UBI
to support the 'LEB consolidation' concept (which is the solution we're
heading to for reliable MLC NAND support), and the duplication of
similar code blocks makes this transition harder to code/review.

This is just the beginning (more cleanup patches will come), but since
the patches are simple and self-contained I thought it would be good to
submit them early.

Regards,

Boris

Boris Brezillon (7):
  UBI: fastmap: use ubi_find_volume() instead of open coding it
  UBI: fastmap: avoid multiple be32_to_cpu() when unneccesary
  UBI: fastmap: scrub PEB when bitflips are detected in a free PEB EC
    header
  UBI: factorize code used to manipulate volumes at attach time
  UBI: factorize destroy_av() and ubi_remove_av() code
  UBI: fastmap: use ubi_rb_for_each_entry() in unmap_peb()
  UBI: provide helpers to allocate and free aeb elements

 drivers/mtd/ubi/attach.c  | 242 ++++++++++++++++++++++++++++++++--------------
 drivers/mtd/ubi/fastmap.c |  99 +++++--------------
 drivers/mtd/ubi/ubi.h     |   4 +
 drivers/mtd/ubi/vtbl.c    |   4 +-
 4 files changed, 200 insertions(+), 149 deletions(-)

-- 
2.7.4
