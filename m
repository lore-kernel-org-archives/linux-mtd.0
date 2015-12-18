Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9kwy-0004aI-C0
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 02:39:27 +0000
Received: by mail-pf0-x231.google.com with SMTP id n128so22873457pfn.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2015 18:38:59 -0800 (PST)
Date: Thu, 17 Dec 2015 18:38:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD update for 4.4-rc6
Message-ID: <20151218023856.GA68411@google.com>
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

Hi Linus,

I was holding out on this pull request for a bit, since there are a few
other small issues being discussed that look like 4.4-rc regressions.
Hopefully I can get those stabilized soon, but these are ready at any
rate.

The following changes since commit 1ddaa021b000220b5f2ad023e4f15ed44990974b:

  MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs (2015-11-18 13:16:58 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20151217

for you to fetch changes up to e488ca9f8d4f62c2dc36bfa5c32f68e7f05ab381:

  doc: dt: mtd: partitions: add compatible property to "partitions" node (2015-12-08 17:10:20 -0800)

----------------------------------------------------------------
MTD update for 4.4-rc6:

A little bit of a last-minute change for the device tree "fixed partition"
binding. This is needed because we might want to reuse the 'partitions' subnode
for other sorts of partitioning descriptions -- e.g., for describing which
on-flash partition format(s) might be used on the system.

Also tone down a warning message, since it is probably going to show up on a
lot of systems where it should just be ignored.

----------------------------------------------------------------
Brian Norris (2):
      mtd: ofpart: don't complain about missing 'partitions' node too loudly
      doc: dt: mtd: partitions: add compatible property to "partitions" node

 Documentation/devicetree/bindings/mtd/partition.txt |  7 ++++++-
 drivers/mtd/ofpart.c                                | 12 ++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)
