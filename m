Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJQ2W-0007cp-RU
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2016 19:25:33 +0000
From: John Crispin <john@phrozen.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Crispin <john@phrozen.org>
Subject: [PATCH 0/2] mtd: spi-nor: add some new chip ids
Date: Tue, 20 Dec 2016 20:25:21 +0100
Message-Id: <1482261923-62559-1-git-send-email-john@phrozen.org>
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

These have been lingering inside the owrt/lede tree for a while.

André Valentin (1):
  mtd: spi-nor: add support for mx25u3235f

Ash Benz (1):
  mtd: spi-nor: add support for macronix mx25u25635f

 drivers/mtd/spi-nor/spi-nor.c |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.10.4
