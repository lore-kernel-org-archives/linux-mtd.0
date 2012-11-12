Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh1-00014O-Es
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:36 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247427bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:33 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/5] MTD: bcm63xxpart: small code cleanup
Date: Mon, 12 Nov 2012 10:52:46 +0100
Message-Id: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Cc: Maxime Bizon <mbizon@freebox.fr>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is a bunch of small code cleanups. No functional changes.

Jonas Gorski (5):
  MTD: bcm63xxpart: remove unused variable
  MTD: bcm63xxpart: merge sparelen calculation
  MTD: bcm63xxpart: make fixed part length calculation more generic
  MTD: bcm63xxpart: move the last curpart++ to its correct place
  MTD: bcm63xxpart: use correct printk format for partitions

 drivers/mtd/bcm63xxpart.c |   32 ++++++++++++++------------------
 1 files changed, 14 insertions(+), 18 deletions(-)

-- 
1.7.2.5
