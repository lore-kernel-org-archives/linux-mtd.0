Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhCa3-0003HB-Ro
	for linux-mtd@lists.infradead.org; Mon, 15 Oct 2007 00:09:12 +0100
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [patch 2.6.23-git] MTD: m25p80 whitespace fix
Date: Sun, 14 Oct 2007 16:01:23 -0700
References: <200706241512.35332.david-b@pacbell.net>
In-Reply-To: <200706241512.35332.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710141601.23334.david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Whitespace fix:  a recent patch added some extraneous whitespace.
Highlighted in glaring color by kernel-configured text editors...

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- g26.orig/drivers/mtd/devices/m25p80.c	2007-10-13 15:02:40.000000000 -0700
+++ g26/drivers/mtd/devices/m25p80.c	2007-10-13 15:02:46.000000000 -0700
@@ -36,7 +36,7 @@
 #define	OPCODE_READ		0x03	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
-#define	OPCODE_BE_4K 		0x20	/* Erase 4KiB block */
+#define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
