Received: from perninha.conectiva.com.br ([200.140.247.100])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbdQt-0008GB-Dp
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 07:27:37 -0500
Date: Mon, 14 Nov 2005 09:54:11 -0200
From: Luiz Fernando Capitulino <lcapitulino@mandriva.com.br>
To: akpm <akpm@osdl.org>
Message-Id: <20051114095411.4a30d25e.lcapitulino@mandriva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] - Fixes sparse warning in nettel driver.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The patch below fixes the following sparse warning:

drivers/mtd/maps/nettel.c:482:27: warning: Using plain integer as NULL pointer

Signed-off-by: Luiz Capitulino <lcapitulino@mandriva.com.br>

 drivers/mtd/maps/nettel.c |    2 +-
 include/linux/mtd/map.h   |    0 
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -479,7 +479,7 @@ void __exit nettel_cleanup(void)
 	}
 	if (nettel_intel_map.virt) {
 		iounmap(nettel_intel_map.virt);
-		nettel_intel_map.virt = 0;
+		nettel_intel_map.virt = NULL;
 	}
 #endif
 }
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h


-- 
Luiz Fernando N. Capitulino
