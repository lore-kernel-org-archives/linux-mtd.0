Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OY94b-0006uz-38
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 02:48:49 +0000
Received: by iwn40 with SMTP id 40so4811118iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Jul 2010 19:48:48 -0700 (PDT)
Message-ID: <4C3A828D.1070509@gmail.com>
Date: Sun, 11 Jul 2010 21:48:45 -0500
From: Neal B <nealb001@gmail.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 2/6] Mtd: fixed space after open parenthesis
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: maximlevitsky@gmail.com, cascardo@holoscopio.com,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, jkosina@suse.cz,
	mohanlaljangir@gmail.com, rmk+kernel@arm.linux.org.uk, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 From d1caf6c1e0e1c8137a0c23c570df5ce764eb60f6 Mon Sep 17 00:00:00 2001
From: Neal Buckendahl <nealb001@gmail.com>
Date: Sun, 11 Jul 2010 17:06:12 -0500
Subject: [PATCH 2/6] Mtd: fixed space after open parenthesis found by 
the checkpatch.pl tool
  Signed-off-by: Neal Buckendahl <nealb001@gmail.com>

---
  drivers/mtd/ar7part.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 6697a1e..7ccfdca 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -148,6 +148,6 @@ static int __init ar7_parser_init(void)
  module_init(ar7_parser_init);

  MODULE_LICENSE("GPL");
-MODULE_AUTHOR(	"Felix Fietkau <nbd@openwrt.org>, "
+MODULE_AUTHOR("Felix Fietkau <nbd@openwrt.org>, "
  		"Eugene Konev <ejka@openwrt.org>");
  MODULE_DESCRIPTION("MTD partitioning for TI AR7");
-- 
1.7.1
