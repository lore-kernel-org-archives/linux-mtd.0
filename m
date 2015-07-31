Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZL8Lu-0002Vq-95
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 11:19:51 +0000
Message-Id: <cover.1438340815.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 31 Jul 2015 13:06:55 +0200
Subject: [PATCH v2 0/5] improve mtdpart robustness
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this is v2 series following the discussion about conflict between s3c64xx and
ofpart.

I tried loading some fabricated ofpart partitions and it appears to work
reasonably.

ofpart assigns partition numbers backwards from bottom to top but that's
probably not something to be concerned about. Sorting partitions by offset
would be nice but that's way beyond just making the two drivers not conflict.

Thanks

Michal

Michal Suchanek (5):
  mtd: mtdpart: add debug prints to partition parser.
  mtd: mtdpart: Do not fail mtd probe when parsing partitions fails.
  mtd: ofpart: update devicetree binding specification
  mtd: ofpart: document the lock flag.
  mtd: ofpart: move ofpart partitions to a dedicated dt node

 .../devicetree/bindings/mtd/partition.txt          | 69 +++++++++++++---------
 drivers/mtd/mtdpart.c                              | 14 ++++-
 drivers/mtd/ofpart.c                               | 56 +++++++++++++-----
 3 files changed, 93 insertions(+), 46 deletions(-)

-- 
2.1.4
