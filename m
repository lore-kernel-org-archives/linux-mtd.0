Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arBvt-00045q-E1
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 22:09:45 +0000
Received: by mail-pf0-x234.google.com with SMTP id n1so60722999pfn.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 15:09:24 -0700 (PDT)
Date: Fri, 15 Apr 2016 15:09:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] MTD fix for v4.6-rc4
Message-ID: <20160415220921.GN2545@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160415

for you to fetch changes up to 20c07a5bf094198ff2382aa5e7c930b3c9807792:

  mtd: nand: Drop mtd.owner requirement in nand_scan (2016-04-02 23:03:51 -0700)

----------------------------------------------------------------
One MTD fix for v4.6-rc4:

In the v4.4 cycle, we relaxed the requirement for assigning mtd->owner, but we
didn't remove this error case. It's hit only by drivers that are both:

(a) using nand_scan() directly and
(b) built as modules

We haven't seen explicit complaints about this (most use cases don't fit one or
both of the above), but we should definitely not be BUG()'ing here.

----------------------------------------------------------------
Ezequiel García (1):
      mtd: nand: Drop mtd.owner requirement in nand_scan

 drivers/mtd/nand/nand_base.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)
