Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvnH8-00051W-DE
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 09:28:03 +0000
Received: by wyh11 with SMTP id 11so4981404wyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 02:27:59 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix compile warning with newer GCC in flash maps
Date: Tue, 23 Aug 2011 10:27:50 +0100
Message-Id: <1314091670-15175-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For invalid map bankwidths, BUG() out for map_word_load() and
inline_map_write() like inline_map_read() does.  This fixes the warning
below and for other maps.

drivers/mtd/chips/cfi_cmdset_0002.c: In function 'cfi_amdstd_write_words':
include/linux/mtd/map.h:330:11: warning: 'r$x$0' may be used uninitialized in this function

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 include/linux/mtd/map.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index a9e6ba4..cbc5a3d 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -341,6 +341,8 @@ static inline map_word map_word_load(struct map_info *map, const void *ptr)
 #endif
 	else if (map_bankwidth_is_large(map))
 		memcpy(r.x, ptr, map->bankwidth);
+	else
+		BUG();
 
 	return r;
 }
@@ -424,6 +426,9 @@ static inline void inline_map_write(struct map_info *map, const map_word datum,
 #endif
 	else if (map_bankwidth_is_large(map))
 		memcpy_toio(map->virt+ofs, datum.x, map->bankwidth);
+	else
+		BUG();
+
 	mb();
 }
 
-- 
1.7.4.1
