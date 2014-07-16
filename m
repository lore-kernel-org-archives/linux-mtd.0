Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7TEL-0003FI-2C
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 17:43:01 +0000
Received: by mail-ig0-f177.google.com with SMTP id hn18so1127992igb.16
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2014 10:42:39 -0700 (PDT)
Date: Wed, 16 Jul 2014 10:42:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 3.16-rc6
Message-ID: <20140716174235.GU7537@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

Hi Linus,

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20140716

for you to fetch changes up to 812c5fa82bae9f377f49000d7636c19a8b61735c:

  mtd: cfi_cmdset_0001.c: add support for Sharp LH28F640BF NOR (2014-07-13 22:22:47 -0700)

----------------------------------------------------------------
MTD updates for 3.16-rc6
- Fix ELM suspend/resume
- Reduce warnings if NAND ECC is too weak
- Add CFI support for Sharp LH28F640BF NOR

The last fix is coming in because other commits in the 3.16 cycle depended on
this support.

----------------------------------------------------------------
Andrea Adami (1):
      mtd: cfi_cmdset_0001.c: add support for Sharp LH28F640BF NOR

Ted Juan (1):
      mtd: devices: elm: fix elm_context_save() and elm_context_restore() functions

Thomas Petazzoni (1):
      mtd: nand: reduce the warning noise when the ECC is too weak

 drivers/mtd/chips/cfi_cmdset_0001.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/elm.c           |  2 ++
 drivers/mtd/nand/nand_base.c        |  6 ++++--
 3 files changed, 49 insertions(+), 2 deletions(-)
