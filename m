Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZlFY-000259-KT
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 17:32:41 +0000
Received: by mail-ie0-f178.google.com with SMTP id x13so7169340ief.9
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 10:32:19 -0700 (PDT)
Date: Fri, 25 Oct 2013 10:32:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] final MTD fixes for 3.12
Message-ID: <20131025173215.GH20061@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Marek Vasut <marex@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

Can you please pull a few more MTD regression fixes for 3.12?

I signed my tag this time, although you still have little reason to trust
it.

Thanks,
Brian

The following changes since commit b291a22952e74bb2fcf9c57c6d8bae52a4f197e2:

  Merge tag 'for-linus-20131008' of git://git.infradead.org/linux-mtd (2013-10-10 11:30:33 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20131025

for you to fetch changes up to 031e2777e03401d629e62602c8ce42b017732d4d:

  mtd: gpmi: fix ECC regression (2013-10-25 10:09:43 -0700)

----------------------------------------------------------------

A few more last-minute regression fixes, prepared jointly by me and David
Woodhouse:

* Revert pxa3xx to its old name to avoid breaking existing 'mtdparts=' boot
  strings.

* Return GPMI NAND to its legacy ECC layout for backwards compatibility. We
  will revisit this in 3.13.

A note from David on the latter fix: "This leaves a harmless cosmetic warning
about an unused function. At this point in the cycle I really don't care."

----------------------------------------------------------------
David Woodhouse (1):
      mtd: gpmi: fix ECC regression

Ezequiel Garcia (1):
      mtd: nand: pxa3xx: Fix registered MTD name

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/pxa3xx_nand.c         | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
