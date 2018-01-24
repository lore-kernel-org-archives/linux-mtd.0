Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeHwg-0006HS-Vm
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 10:06:20 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990395AbeAXKGFcxXmV (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 24 Jan 2018 11:06:05 +0100
Date: Wed, 24 Jan 2018 11:06:04 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v2 0/3] Add managed ioremap function for shared resources
Message-ID: <20180124100604.GA19593@lenoch>
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

Many drivers can simplified by using devm_ioremap_resource()
instead of open coding its functionality. However, as pointed
by Wei Yongjun, that function cannot be used when memory region
is already taken. See previous discussion here:
https://www.spinics.net/lists/linux-pci/msg68495.html

To ease job of driver developers, new function for that
purpose is implemented and its usage shown on davinci
mtd driver.

Changes from previous version:
- moved function prototype in headers other way around (PATCH 1/3),
  the rest of patches was dropped.

Ladislav Michl (3):
  devres: Move devm_ioremap_resource() out of device.h
  devres: Add devm_ioremap_shared_resource()
  mtd: nand: davinci: Use devm_ioremap_shared_resource()

 drivers/mtd/nand/davinci_nand.c | 24 +++++++-----------------
 include/linux/device.h          |  2 --
 include/linux/io.h              |  7 +++++++
 lib/devres.c                    | 22 ++++++++++++++--------
 4 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.15.1
