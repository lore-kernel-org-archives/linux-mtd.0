Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blvM9-0002lZ-GK
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 09:59:22 +0000
Date: Mon, 19 Sep 2016 11:58:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: Fixes for 4.8-rc8
Message-ID: <20160919115858.30ac7fca@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here is a PR containing 3 fixes for 4.8-rc8. I know you're quite busy,
so please let me know if you can't take them through your tree, I'll
ask Richard to send a PR to Linus, or queue them for 4.9.

Thanks,

Boris

The following changes since commit 3be7988674ab33565700a37b210f502563d932e6:

  Linux 4.8-rc7 (2016-09-18 17:27:41 -0700)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/fixes-for-4.8-rc8

for you to fetch changes up to 38178e7b88dcbe1ab384f27a7370074e774dda81:

  mtd: nand: mxc: fix obiwan error in mxc_nand_v[12]_ooblayout_free() funct=
ions (2016-09-19 11:57:12 +0200)

----------------------------------------------------------------
Fixes for 4.8-rc8:
- Fix a wrong OOB layout definition in the mxc driver
- Fix incorrect ECC handling in the mtk driver

----------------------------------------------------------------
Lothar Wa=C3=9Fmann (1):
      mtd: nand: mxc: fix obiwan error in mxc_nand_v[12]_ooblayout_free() f=
unctions

RogerCC Lin (2):
      mtd: nand: fix generating over-boundary ECC data when writing
      mtd: nand: fix chances to create incomplete ECC data when writing

 drivers/mtd/nand/mtk_ecc.c  | 12 ++++++++----
 drivers/mtd/nand/mtk_nand.c |  7 +++++--
 drivers/mtd/nand/mxc_nand.c |  2 +-
 3 files changed, 14 insertions(+), 7 deletions(-)
