Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp3TI-0002ca-O5
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 07:16:47 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 2CB6F22897
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jul 2004 15:16:05 +0400 (MSD)
Message-ID: <4104E7F5.1060005@oktetlabs.ru>
Date: Mon, 26 Jul 2004 15:16:05 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------030304000704030601060503"
Subject: bugreport
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030304000704030601060503
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

There is a bug in jffs2 module registration function - super.c line 293: 
the init_jffs2_fs function doesn't properly perform
the de-initialization in case of failures on lines 315 and 321.

The jffs2_inode_cachep is also not feed.

The proposed patch is attached.

Note 1: I didn't test this patch and didn't even compile JFFS2 with it - 
*be careful*.

Note 2: The similar ought to be fixed in super-v24.c

Artem.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru

--------------030304000704030601060503
Content-Type: text/plain;
 name="super.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="super.c.diff"

--- super.c	2004-07-18 18:44:42.000000000 +0400
+++ /home/dedekind/tmp/super_fixed.c	2004-07-26 15:05:34.000000000 +0400
@@ -318,7 +318,7 @@
 	ret = jffs2_compressors_init();
 	if (ret) {
 		printk(KERN_ERR "JFFS2 error: Failed to initialise compressors\n");
-		goto out;
+		goto out_proc;
 	}
 	ret = jffs2_create_slab_caches();
 	if (ret) {
@@ -336,10 +336,12 @@
 	jffs2_destroy_slab_caches();
  out_compressors:
 	jffs2_compressors_exit();
+ out_proc:
 #ifdef CONFIG_JFFS2_PROC
         jffs2_proc_exit();
 #endif
  out:
+        kmem_cache_destroy(jffs2_inode_cachep);
 	return ret;
 }
 

--------------030304000704030601060503--
