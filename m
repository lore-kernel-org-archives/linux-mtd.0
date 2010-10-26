Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAgGr-0004YG-Ft
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:56:46 +0000
Subject: [PATCH] mtd: cfi_cmdset_0001: use defined value of
	P_ID_INTEL_PERFORMANCE instead of hardcoded one
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 26 Oct 2010 11:55:29 +0200
Message-ID: <20101026095529.6964.80927.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 9e2b7e9..ad9268b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1496,7 +1496,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	switch (mode) {
 	case FL_WRITING:
-		write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0x40) : CMD(0x41);
+		write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0x40) : CMD(0x41);
 		break;
 	case FL_OTP_WRITE:
 		write_cmd = CMD(0xc0);
@@ -1661,7 +1661,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	cmd_adr = adr & ~(wbufsize-1);
 
 	/* Let's determine this according to the interleave only once */
-	write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0xe8) : CMD(0xe9);
+	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
 
 	mutex_lock(&chip->mutex);
 	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
