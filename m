Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bODgW-0008Ui-CR
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 00:42:24 +0000
Received: by mail-pf0-x242.google.com with SMTP id y134so2957847pfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 17:42:04 -0700 (PDT)
Date: Fri, 15 Jul 2016 17:42:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] Late MTD fix for v4.7
Message-ID: <20160716004200.GA64021@google.com>
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

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160715

for you to fetch changes up to 7ce9ea7e6b35a652034486133174d4e17055cef5:

  mtd: nand: omap2: Add check for old elm binding (2016-07-14 08:57:36 -0700)

----------------------------------------------------------------
Late MTD fix for v4.7:

One regression in the Device Tree handling for OMAP NAND handling of the ELM
node. TI migrated to using the property name "ti,elm-id", but forgot to keep
compatibility with the old "elm_id" property.

Also, might as well send out this MAINTAINERS fixup now.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for mtd device tree bindings

Teresa Remmet (1):
      mtd: nand: omap2: Add check for old elm binding

 MAINTAINERS              | 1 +
 drivers/mtd/nand/omap2.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)
