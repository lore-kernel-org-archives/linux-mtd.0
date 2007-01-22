Received: from wr-out-0506.google.com ([64.233.184.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H915N-0000d8-DK
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 10:27:55 -0500
Received: by wr-out-0506.google.com with SMTP id i31so698492wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jan 2007 07:27:31 -0800 (PST)
Message-ID: <b647ffbd0701220727y67a7ac2dpf6c4b147175080ea@mail.gmail.com>
Date: Mon, 22 Jan 2007 16:27:30 +0100
From: "Dmitry Adamushko" <dmitry.adamushko@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Dmitry Adamushko <dmitry.adamushko@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()

If jffs2_sum_init() fails in jffs2_do_mount_fs(), c->blocks is not freed.
The patch addresses this issue.

Signed-off-by: Dmitry Adamushko <dmitry.adamushko at gmail dot com>

---

-- fs/jffs2/build.c    2006-12-17 21:29:07.000000000 +0100
+++ fs/jffs2/build-fix.c        2007-01-19 01:05:51.000000000 +0100
@@ -348,23 +348,27 @@ int jffs2_do_mount_fs(struct jffs2_sb_in

       ret = jffs2_sum_init(c);
       if (ret)
-               return ret;
+               goto out_blocks;

       if (jffs2_build_filesystem(c)) {
               dbg_fsbuild("build_fs failed\n");
               jffs2_free_ino_caches(c);
               jffs2_free_raw_node_refs(c);
-#ifndef __ECOS
-               if (jffs2_blocks_use_vmalloc(c))
-                       vfree(c->blocks);
-               else
-#endif
-                       kfree(c->blocks);

-               return -EIO;
+               ret = -EIO;
+               goto out_blocks;
       }

       jffs2_calc_trigger_levels(c);

       return 0;
+
+ out_blocks:
+#ifndef __ECOS
+               if (jffs2_blocks_use_vmalloc(c))
+                       vfree(c->blocks);
+               else
+#endif
+                       kfree(c->blocks);
+       return ret;
 }
