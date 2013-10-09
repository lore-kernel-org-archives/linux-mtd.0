Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTjHD-0004Up-Qm
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 02:13:28 +0000
Received: by mail-ob0-f179.google.com with SMTP id wp18so197516obc.38
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 19:13:06 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 3.12-rc
Date: Tue,  8 Oct 2013 19:10:22 -0700
Message-Id: <1381284622-24286-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus!

David Woodhouse and I have queued up a few MTD fixes for 3.12. As David seems
to be MIA again, I am sending the following pull request with his permission.

Thanks,
Brian

The following changes since commit 7b9e3a6ac00be4f3d654a711573b1794b046c22f:

  Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc (2013-09-19 18:49:08 -0500)

are available in the git repository at:


  git://git.infradead.org/linux-mtd.git tags/for-linus-20131008

for you to fetch changes up to 2b468ef0e7959b703626b64c4d264ef822c9267a:

  mtd: m25p80: Fix 4 byte addressing mode for Micron devices. (2013-09-27 05:56:22 -0500)

----------------------------------------------------------------

- fix a small memory leak in some new ONFI code
- account for additional odd variations of Micron SPI flash

----------------------------------------------------------------
Brian Norris (1):
      mtd: nand: fix memory leak in ONFI extended parameter page

Elie De Brauwer (1):
      mtd: m25p80: Fix 4 byte addressing mode for Micron devices.

 drivers/mtd/devices/m25p80.c | 17 +++++++++++++++--
 drivers/mtd/nand/nand_base.c |  8 +++-----
 2 files changed, 18 insertions(+), 7 deletions(-)
