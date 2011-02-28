Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ptsrf-0005p1-5e
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 02:29:35 +0000
From: Lei Wen <leiwen@marvell.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] pxa3xx_nand update series set version 5
Date: Mon, 28 Feb 2011 10:32:09 +0800
Message-Id: <1298860335-18638-1-git-send-email-leiwen@marvell.com>
In-Reply-To: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
References: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V4:
rework the patch set accroding to Eric's suggestion.
Move the recode judgement to the after command execution.

V5:
clean code style issue.

Lei Wen (6):
  pxa3xx_nand: make scan procedure more clear
  pxa3xx_nand: rework irq logic
  pxa3xx_nand: discard wait_for_event,write_cmd,__readid function
  pxa3xx_nand: unify prepare command
  pxa3xx_nand: mtd scan id process could be defined by driver itself
  pxa3xx_nand: clean the keep configure code

 arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |    2 +-
 drivers/mtd/nand/pxa3xx_nand.c               |  977 ++++++++++++--------------
 2 files changed, 458 insertions(+), 521 deletions(-)
