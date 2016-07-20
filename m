Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPzRh-0006LK-V5
 for linux-mtd@lists.infradead.org; Wed, 20 Jul 2016 21:54:26 +0000
Received: by mail-pf0-x22c.google.com with SMTP id x72so22898314pfd.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2016 14:54:05 -0700 (PDT)
From: Ray Jui <ray.jui@broadcom.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prafulla Kota <prafulla.kota@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2 0/2] Add big endian and ONFI support to iProc NAND
Date: Wed, 20 Jul 2016 14:53:49 -0700
Message-Id: <1469051631-7896-1-git-send-email-ray.jui@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series adds big endian and ONFI support to iProc based NAND wrapper
that utilizes the BRCMSTB NAND core driver. It also adds missing NAND DT
properties for NS2 SVK

This patch series is based off v4.7-rc1 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: iproc-nand-be-v2

Changes from v1:
 - Fixed minor format by adding braces around the 'else'

Ray Jui (2):
  mtd: brcmnand: iProc big endian and ONFI support
  arm64: dts: Updated NAND DT properties for NS2 SVK

 arch/arm64/boot/dts/broadcom/ns2-svk.dts |  2 ++
 drivers/mtd/nand/brcmnand/brcmnand.c     | 12 ++++++------
 drivers/mtd/nand/brcmnand/brcmnand.h     | 13 ++++++++-----
 drivers/mtd/nand/brcmnand/iproc_nand.c   | 18 ++++++++++++++----
 4 files changed, 30 insertions(+), 15 deletions(-)

-- 
2.1.4
