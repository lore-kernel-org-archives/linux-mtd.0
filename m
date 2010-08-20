Received: from sand.ocn.ne.jp ([122.28.30.136] helo=smtp.sand.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmMhL-0007no-E6
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 08:11:36 +0000
From: Jon Povey <jon.povey@racelogic.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nanddump: Fix hexdump nybble ordering
Date: Fri, 20 Aug 2010 17:11:19 +0900
Message-Id: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
Cc: Jon Povey <jon.povey@racelogic.co.uk>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hex dumps were being printed with the nybbles reversed since
commit 6ff458433ba15b8a7cb258ce64e64e98982df26e
Fix.

Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
CC: Brian Norris <norris@broadcom.com>
---
 nanddump.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index acfdb33..22fec5f 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -239,8 +239,8 @@ static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 
 	for (j = 0; (j < len) && (lx + 3) <= linebuflen; j++) {
 		ch = buf[j];
-		linebuf[lx++] = hex_asc[ch & 0x0f];
 		linebuf[lx++] = hex_asc[(ch & 0xf0) >> 4];
+		linebuf[lx++] = hex_asc[ch & 0x0f];
 		linebuf[lx++] = ' ';
 	}
 	if (j)
-- 
1.6.3.3
