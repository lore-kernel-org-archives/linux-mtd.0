Received: from wx-out-0506.google.com ([66.249.82.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7hbf-0003Mc-Kd
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 19:27:49 -0500
Received: by wx-out-0506.google.com with SMTP id s16so360179wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Jan 2007 16:27:25 -0800 (PST)
Message-ID: <b647ffbd0701181620k540156ccq38a8a3c94fcb4359@mail.gmail.com>
Date: Fri, 19 Jan 2007 01:20:30 +0100
From: "Dmitry Adamushko" <dmitry.adamushko@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()
In-Reply-To: <b647ffbd0701181614l4d0d724cu9749943d1a57efdf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <b647ffbd0701181614l4d0d724cu9749943d1a57efdf@mail.gmail.com>
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()

If  jffs2_sum_init()  fails,  c->blocks is not freed neither in
jffs2_do_mount_fs() nor in jffs2_do_fill_super().

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
