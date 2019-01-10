Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghVep-0003mC-6K
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 08:25:44 +0000
Date: Thu, 10 Jan 2019 09:25:31 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: Fixes for 5.0-rc2
Message-ID: <20190110092531.766738a0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus,

Here is the MTD fixes PR for 5.0-rc2.

Regards,

Boris 

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-5.0-rc2

for you to fetch changes up to 81d9bdf59092e4755fc4307c93c4589ef0fe2e0f:

  mtd: rawnand: qcom: fix memory corruption that causes panic (2019-01-08 12:33:24 +0100)

----------------------------------------------------------------
MTD Fixes:
- Fix a bug introduced when exposing MTD devs as NVMEM providers and
  check for add_mtd_device() return code everywhere

raw NAND fixes:
- Fix a memory corruption in the QCOM driver

----------------------------------------------------------------
Boris Brezillon (2):
      mtd: Fix the check on nvmem_register() ret code
      mtd: Check add_mtd_device() ret code

Christian Lamparter (1):
      mtd: rawnand: qcom: fix memory corruption that causes panic

 drivers/mtd/mtdcore.c             |  2 +-
 drivers/mtd/mtdcore.h             |  2 +-
 drivers/mtd/mtdpart.c             | 36 +++++++++++++++++++++++++++++++-----
 drivers/mtd/nand/raw/qcom_nandc.c | 20 ++++++++++----------
 4 files changed, 43 insertions(+), 17 deletions(-)
