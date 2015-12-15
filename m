Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifP-0008Jc-1C
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:00:55 +0000
Received: by pfbo64 with SMTP id o64so5020077pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:33 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
Date: Tue, 15 Dec 2015 05:59:26 +0000
Message-Id: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently nand_bbt.c is tied with struct nand_chip, and it makes other
NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
onenand has own bbt(onenand_bbt.c).

Separate struct nand_chip from BBT code can make current BBT shareable.
We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
Struct nand_bbt contains all the information BBT needed from outside and
it should be embedded into NAND family chip struct (such as struct nand_chip).
NAND family driver should allocate, initialize and free struct nand_bbt.

Below is mtd folder structure we want:
	mtd
	├── Kconfig
	├── Makefile
	├── ...
	├── nand_bbt.c
	├── nand
	│   ├── Kconfig
	│   ├── Makefile
	│   ├── nand_base.c
	│   ├── nand_ids.c
	│   ├── ...
	│   └── xway_nand.c
	├── spi-nand
	│   ├── Kconfig
	│   ├── Makefile
	│   ├── spi-nand-base.c
	│   ├── ...
	│   └── spi-nand-device.c
	└── ...

Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.com>.
http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/nand-bbt
Based on Brian's suggestion, I make my previous BBT patch into 12 independent
patches. Previous patch is http://patchwork.ozlabs.org/patch/492066/
Beside the patch split, I also moved nand_bbt.c to mtd folder, which didn't in
previous patch.

Patch 3, 7, 8, 9, 10 and 11 are totally borrowed from Brian's git tree. I just
test and split the code into independent patch. Patch 1, 2, 5 and 6 are partial
borrowed. I make some changes from Brian's git tree and the changes are recorded
in commit log. Patch 4 and 12 are written by me.

The patch is tested on Zed board.

v2 changes:
	rebase patch series on master branch of l2-mtd.git

Brian Norris (10):
  mtd: nand_bbt: new header for nand family BBT
  mtd: nand_bbt: introduce struct nand_bbt
  mtd: nand_bbt: add new API definitions
  mtd: nand: use new BBT API instead of old ones
  mtd: nand_bbt: use erase() and is_bad_bbm() hook in BBT
  mtd: nand: make nand_erase_nand() static
  mtd: nand_bbt: remove struct nand_chip from nand_bbt.c
  mtd: nand_bbt: remove old API definitions
  mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
  mtd: nand: remove nand_chip.bbt

Peter Pan (2):
  mtd: nand_bbt: add nand_bbt_markbad_factory() interface
  mtd: nand-bbt: move nand_bbt.c to mtd folder

 drivers/mtd/Kconfig               |   7 +
 drivers/mtd/Makefile              |   1 +
 drivers/mtd/nand/Kconfig          |   2 +-
 drivers/mtd/nand/Makefile         |   2 +-
 drivers/mtd/nand/docg4.c          |   6 +-
 drivers/mtd/nand/nand_base.c      | 145 +++++++++-
 drivers/mtd/{nand => }/nand_bbt.c | 542 ++++++++++++++++----------------------
 include/linux/mtd/bbm.h           |  96 +------
 include/linux/mtd/nand.h          |  16 +-
 include/linux/mtd/nand_bbt.h      | 177 +++++++++++++
 10 files changed, 562 insertions(+), 432 deletions(-)
 rename drivers/mtd/{nand => }/nand_bbt.c (68%)
 create mode 100644 include/linux/mtd/nand_bbt.h

-- 
1.9.1
