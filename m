Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1SSC-0006EP-OA
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 07:58:40 +0000
Date: Thu, 29 Mar 2018 09:58:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.17
Message-ID: <20180329095815.746d5f3f@bbrezillon>
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

Hi,

Here is the SPI NOR PR for 4.17. As you can see, there's not much
material for this release, mainly due to lack of time on Cyrille's side
which led him to take the decision to resign from his maintainer role
(which is why I'm the one sending this PR).

Sorry for those who didn't get their patches merged in this release and
those who had their fixes delayed (which is even worse).

We (Marek, Richard and I) will try to take over the maintenance of the
spi-nor sub-subsystem, but it's likely to be a bit laggy for a few more
weeks. For those who have urgent spi-nor fixes pending, don't hesitate
to ping us.

Regards,

Boris

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.17

for you to fetch changes up to 85da6da228438aba4ff832293122117d5b7d1c11:

  dt-bindings: fsl-quadspi: Add the example of two SPI NOR (2018-03-29 09:46:09 +0200)

----------------------------------------------------------------
* Make fsl-quaspi assign different names to MTD devices connected
  to the same QSPI controller
* Remove an unneeded driver.bus assigned in the fsl-qspi driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: fsl-quadspi: Remove unneeded driver.bus assignment

Fabio Estevam (2):
      mtd: fsl-quadspi: Distinguish the mtd device names
      dt-bindings: fsl-quadspi: Add the example of two SPI NOR

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 24 ++++++++++++++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                     | 19 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
