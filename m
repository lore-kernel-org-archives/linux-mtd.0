Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSd1E-0001mP-Al
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 10:07:22 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 5153822886
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 18:06:48 +0300 (MSK)
Message-ID: <4194D188.9050200@oktetlabs.ru>
Date: Fri, 12 Nov 2004 18:06:48 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Garbage collect pristine nodes
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, looking to the jffs2_garbage_collect_pristine() function 
(gc.c:489) I've mentioned:

----------------------
/* Ask for a small amount of space (or the totlen if smaller) because we
    don't want to force wastage of the end of a block if splitting would
    work. */
ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct 
jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, rawlen), &phys_ofs, &alloclen);

if (ret)
      return ret;

if (alloclen < rawlen) {
     /* Doesn't fit untouched. We'll go the old route and split it */
     return -EBADFD;
}
-----------------------

We allocate sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN which is 
   only 68 + 128 bytes. But the maximum size of direntry is more than 
245 bytes. So, if few bytes were allocated (alloclen < rawlen) and this 
is just direntry with long name, we Garbage Collect it using long path 
(which is unneeded).

Thus, I offer to allocate at least sizeof(struct jffs2_raw_dirent) + 254 
bytes.

How about the following patch:



diff -auNr mtd-pristine/fs/jffs2/gc.c mtd-gc-modification/fs/jffs2/gc.c
--- mtd-pristine/fs/jffs2/gc.c  2004-07-20 17:44:55.000000000 +0400
+++ mtd-gc-modification/fs/jffs2/gc.c   2004-11-12 17:57:16.141712270 +0300
@@ -505,8 +505,7 @@
         /* Ask for a small amount of space (or the totlen if smaller) 
because we
            don't want to force wastage of the end of a block if 
splitting would
            work. */
-       ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct 
jffs2_raw_inode) + JFFS2_MIN_DATA_LEN,
-                                             rawlen), &phys_ofs, 
&alloclen);
+       ret = jffs2_reserve_space_gc(c, min_t(uint32_t, 
JFFS2_DIRENT_NODE_MAXSIZE, rawlen), &phys_ofs, &alloclen);
         if (ret)
                 return ret;

diff -auNr mtd-pristine/include/linux/jffs2.h 
mtd-gc-modification/include/linux/jffs2.h
--- mtd-pristine/include/linux/jffs2.h  2004-05-25 15:31:55.000000000 +0400
+++ mtd-gc-modification/include/linux/jffs2.h   2004-11-12 
17:58:50.502488814 +0300
@@ -29,10 +29,12 @@
  #define JFFS2_DIRTY_BITMASK 0x0000

  /* We only allow a single char for length, and 0xFF is empty flash so
-   we don't want it confused with a real length. Hence max 254.
-*/
+   we don't want it confused with a real length. Hence max 254. */
  #define JFFS2_MAX_NAME_LEN 254

+/* The maximum possible size of the direntry node */
+#define JFFS2_DIRENT_NODE_MAXSIZE (sizeof(struct jffs2_raw_dirent) + 255)
+
  /* How small can we sensibly write nodes? */
  #define JFFS2_MIN_DATA_LEN 128



Comments?


-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
