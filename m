Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKVxK-0005IV-5C
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 16:43:06 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/3] UBI: block: Assorted fixes
Date: Mon,  3 Mar 2014 13:42:37 -0300
Message-Id: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Fixes for the warnings and build errors reported by Fengguang's kbuild test
robot. I'm still not sure how avr32 gcc thinks u64 (unsigned long long) has
a different size than loff_t (long long).

However, I haven't had time to look at it deeper, and I'd rather send the
fixes sooner than later.

Ezequiel Garcia (3):
  UBI: block: Mark init-only symbol as __initdata
  UBI: block: Use 'u64' for the 64-bit dividend
  UBI: block: Add CONFIG_BLOCK dependency

 drivers/mtd/ubi/Kconfig | 1 +
 drivers/mtd/ubi/block.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.8.1.5
