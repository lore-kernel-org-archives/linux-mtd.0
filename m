Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GNspD-0005a6-6s
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 16:08:24 +0100
Date: Thu, 14 Sep 2006 16:31:21 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Andrew Morton <akpm@osdl.org>
Subject: [-mm patch 2/4] AVR32 MTD: Define struct flash_platform_data
Message-ID: <20060914163121.241dec3e@cad-250-152.norway.atmel.com>
In-Reply-To: <20060914163026.49766346@cad-250-152.norway.atmel.com>
References: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
	<20060914163026.49766346@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Define a data structure for passing board-specific information to an
MTD mapping driver. For now it specifies a default partition layout.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 include/asm-avr32/arch-at32ap/board.h |    7 +++++++
 1 file changed, 7 insertions(+)

Index: linux-2.6.18-rc5-mm1/include/asm-avr32/arch-at32ap/board.h
===================================================================
--- linux-2.6.18-rc5-mm1.orig/include/asm-avr32/arch-at32ap/board.h	2006-09-07 15:14:20.000000000 +0200
+++ linux-2.6.18-rc5-mm1/include/asm-avr32/arch-at32ap/board.h	2006-09-07 15:19:08.000000000 +0200
@@ -6,6 +6,13 @@
 
 #include <linux/types.h>
 
+struct mtd_partition;
+
+struct flash_platform_data {
+	unsigned int nr_parts;
+	struct mtd_partition *parts;
+};
+
 /* Add basic devices: system manager, interrupt controller, portmuxes, etc. */
 void at32_add_system_devices(void);
 
