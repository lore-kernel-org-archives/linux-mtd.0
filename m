Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeX05-0003u6-6R
 for linux-mtd@lists.infradead.org; Sat, 12 Mar 2016 00:01:46 +0000
Received: by mail-pa0-x231.google.com with SMTP id fl4so110653918pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2016 16:01:24 -0800 (PST)
Date: Fri, 11 Mar 2016 16:01:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [GIT PULL] Late MTD fix for v4.5
Message-ID: <20160312000121.GF2545@google.com>
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

I have 2 small, late updates for MTD. The fix is trivial and tested.
Both low reward (it's just a test) and even lower risk.

And some suckers^Wlovely people offered to help out maintaining and
reviewing "officially," so we might as well get them in now.

The following changes since commit 44248affb5d82d32cdb58a92a94ce191d4ddee60:

  MAINTAINERS: add maintainer entry for FREESCALE GPMI NAND driver (2016-02-25 11:22:37 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160311

for you to fetch changes up to 9df4f913eb39046fa57c4217bb3429a63e164000:

  MAINTAINERS: add a maintainer for the NAND subsystem (2016-03-10 10:48:04 -0800)

----------------------------------------------------------------
Late MTD fix for v4.5:

 * A simple error code handling fix for the NAND ECC test; this was a
   regression in v4.5-rc1

 * A MAINTAINERS update, which might as well go in ASAP

----------------------------------------------------------------
Boris BREZILLON (1):
      MAINTAINERS: add a maintainer for the NAND subsystem

Jorge Ramirez-Ortiz (1):
      mtd: nand: tests: fix regression introduced in mtd_nandectest

 MAINTAINERS                         | 11 +++++++++++
 drivers/mtd/tests/mtd_nandecctest.c |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)
