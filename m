Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EA2jB-0004mF-A6
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 05:48:28 -0400
Message-ID: <43142B62.6040909@inf.u-szeged.hu>
Date: Tue, 30 Aug 2005 11:48:18 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>	<1125087149.26481.12.camel@windu.rchland.ibm.com>	<20050829100722.GB17088@wohnheim.fh-wedel.de>	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
In-Reply-To: <20050829185042.GA28514@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="------------040506010001080605040503"
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040506010001080605040503
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hi J=F6rn,

>>I'd rather we switch to using vmalloc instead for now.  It's not an end
>>solution, but at least it doesn't prevent larger devices from being
>>used.
>>   =20
>>
>Can you explain this in diff -u format?
>
>So far, my patch is the only one in existence.  It is not perfect, no
>doubt about that.  And I will drop it as soon as I see something
>better.  But so far, nothing has shown up. ;)
> =20
>
What do you think about this patch?

Ferenc


--------------040506010001080605040503
Content-Type: text/x-patch;
 name="jffs2-novirtblocks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2-novirtblocks.patch"

diff -Narup mtd2/fs/jffs2/build.c mtd/fs/jffs2/build.c
--- mtd2/fs/jffs2/build.c	2005-07-30 17:29:27.000000000 +0200
+++ mtd/fs/jffs2/build.c	2005-08-30 11:34:22.000000000 +0200
@@ -318,7 +318,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 	c->free_size = c->flash_size;
 	c->nr_blocks = c->flash_size / c->sector_size;
 #ifndef __ECOS
- 	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
+	if (JFFS2_BLOCKS_USE_VMALLOC(c))
 		c->blocks = vmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks);
 	else
 #endif
@@ -356,7 +356,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 		jffs2_free_ino_caches(c);
 		jffs2_free_raw_node_refs(c);
 #ifndef __ECOS
-		if (c->mtd->flags & MTD_NO_VIRTBLOCKS) 
+		if (JFFS2_BLOCKS_USE_VMALLOC(c))
                     vfree(c->blocks);
 		else 
 #endif
diff -Narup mtd2/fs/jffs2/fs.c mtd/fs/jffs2/fs.c
--- mtd2/fs/jffs2/fs.c	2005-08-06 06:51:30.000000000 +0200
+++ mtd/fs/jffs2/fs.c	2005-08-30 11:42:18.000000000 +0200
@@ -457,19 +457,8 @@ int jffs2_do_fill_super(struct super_blo
 #endif
 
 	c->flash_size = c->mtd->size;
-
-	/* 
-	 * Check, if we have to concatenate physical blocks to larger virtual blocks
-	 * to reduce the memorysize for c->blocks. (kmalloc allows max. 128K allocation)
-	 */
 	c->sector_size = c->mtd->erasesize; 
 	blocks = c->flash_size / c->sector_size;
-	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS)) {
-		while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
-			blocks >>= 1;
-			c->sector_size <<= 1;
-		}	
-	}
 
 	/*
 	 * Size alignment check
diff -Narup mtd2/fs/jffs2/os-linux.h mtd/fs/jffs2/os-linux.h
--- mtd2/fs/jffs2/os-linux.h	2005-08-06 06:51:30.000000000 +0200
+++ mtd/fs/jffs2/os-linux.h	2005-08-30 11:32:31.000000000 +0200
@@ -41,6 +41,8 @@ struct kvec;
 #define JFFS2_F_I_MTIME(f) (OFNI_EDONI_2SFFJ(f)->i_mtime.tv_sec)
 #define JFFS2_F_I_ATIME(f) (OFNI_EDONI_2SFFJ(f)->i_atime.tv_sec)
 
+#define JFFS2_BLOCKS_USE_VMALLOC(c) ((c->flash_size / c->sector_size * sizeof (struct jffs2_eraseblock)) > (128 * 1024))
+
 #define sleep_on_spinunlock(wq, s)				\
 	do {							\
 		DECLARE_WAITQUEUE(__wait, current);		\
diff -Narup mtd2/fs/jffs2/super.c mtd/fs/jffs2/super.c
--- mtd2/fs/jffs2/super.c	2005-07-12 18:37:08.000000000 +0200
+++ mtd/fs/jffs2/super.c	2005-08-30 11:34:01.000000000 +0200
@@ -284,7 +284,7 @@ static void jffs2_put_super (struct supe
 	up(&c->alloc_sem);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
+	if (JFFS2_BLOCKS_USE_VMALLOC(c))
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);
diff -Narup mtd2/fs/jffs2/super-v24.c mtd/fs/jffs2/super-v24.c
--- mtd2/fs/jffs2/super-v24.c	2005-07-20 16:21:40.000000000 +0200
+++ mtd/fs/jffs2/super-v24.c	2005-08-30 11:34:06.000000000 +0200
@@ -99,7 +99,7 @@ static void jffs2_put_super (struct supe
 	up(&c->alloc_sem);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
+	if (JFFS2_BLOCKS_USE_VMALLOC(c))
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);

--------------040506010001080605040503--
