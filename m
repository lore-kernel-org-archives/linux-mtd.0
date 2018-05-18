Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJaJD-0000Ki-4l
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 08:00:17 +0000
Received: by mail-qt0-x232.google.com with SMTP id c2-v6so9186067qtn.9
 for <linux-mtd@lists.infradead.org>; Fri, 18 May 2018 01:00:04 -0700 (PDT)
MIME-Version: 1.0
From: Levente <leventelist@gmail.com>
Date: Fri, 18 May 2018 10:00:02 +0200
Message-ID: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
Subject: mtd
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,


I don't know if I post this to the right place, so forgive my ignorance.

My college discovered a possible bug in OpenWRT's mtd utility. When
writing to jffs device, the 'mtd' utility does not skip bad blocks.

This patch seems to fix this issue.


diff --git a/package/system/mtd/src/jffs2.c b/package/system/mtd/src/jffs2.c
index b432f64ac0..5bf3eec328 100644
--- a/package/system/mtd/src/jffs2.c
+++ b/package/system/mtd/src/jffs2.c
@@ -308,6 +308,16 @@ int mtd_write_jffs2(const char *mtd, const char
*filename, const char *dir)
        for(;;) {
                struct jffs2_unknown_node *node = (struct
jffs2_unknown_node *) buf;

+               while (mtd_block_is_bad(outfd, mtdofs) && (mtdofs < mtdsize)) {
+                       if (!quiet)
+                               fprintf(stderr, "\nSkipping bad block
at 0x%08x   ", mtdofs);
+
+                       mtdofs += erasesize;
+
+                       /* Move the file pointer along over the bad block. */
+                       lseek(outfd, erasesize, SEEK_CUR);
+               }
+
                if (read(outfd, buf, erasesize) != erasesize) {
                        fdeof = 1;
                        break;


I've cloned your utility repository, but didn't find jffs2.c anywhere.

Best regards,
Levente
