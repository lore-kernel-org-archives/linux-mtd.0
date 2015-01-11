Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YALSp-0003Rp-O8
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 16:34:08 +0000
Received: by mail-wg0-f49.google.com with SMTP id n12so15630142wgh.8
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 08:33:42 -0800 (PST)
From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: compr_rubin: Remove unused function
Date: Sun, 11 Jan 2015 17:36:48 +0100
Message-Id: <1420994209-20980-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Cc: linux-kernel@vger.kernel.org,
 Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the function pulledbits() that is not used anywhere.

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 fs/jffs2/compr_rubin.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index 92e0644b..556de10 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -84,11 +84,6 @@ static inline int pullbit(struct pushpull *pp)
 	return bit;
 }
 
-static inline int pulledbits(struct pushpull *pp)
-{
-	return pp->ofs;
-}
-
 
 static void init_rubin(struct rubin_state *rs, int div, int *bits)
 {
-- 
1.7.10.4
