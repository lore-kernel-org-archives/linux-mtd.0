Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQi4q-0003q8-4d
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 13:29:54 +0000
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 677FA4C8155
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 15:29:43 +0200 (CEST)
Received: from [192.168.0.10] (bdy93-1-82-67-223-79.fbx.proxad.net
	[82.67.223.79])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 1025A4C8150
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 15:29:41 +0200 (CEST)
Message-ID: <4A5C8844.1000002@gcasse.net>
Date: Tue, 14 Jul 2009 15:29:40 +0200
From: Gilles Casse <list@gcasse.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Corruption of JFFS2 node read from DMA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We have an issue with jffs2 read buffers filled by dma. Fixing the issue
in the lower driver (atmel_spi) is not possible as shown by Russel King:
http://lists.arm.linux.org.uk/lurker/message/20090713.104213.b545177d.en.html

Another preliminary solution is proposed below, thank you for your comments.

On our board similar to rm9200ek, flashes are driven by dma (atmel_spi
driver,  AT45DB642D flash).
After the dma, the last bytes of the read buffer are  sometimes
corrupted (not updated).

This issue leads to a warning in jffs2_read_dnode() :
Node CRC 3ee0089a != calculated CRC 325651a3 for node at 004c5d88
followed by a crash of the garbage collector thread or an oops in
jffs2/file.c line 251.

It is a relatively rare issue (more frequent if the spi clock is lower
(6Mhz instead of 10Mhz) or if the temperature is lower (e.g. 0° C)). No
issue observed if the garbage collector thread has been stopped.

We suspect that another jffs2 thread works on a contiguous buffer (B2)
whereas dma is filling the read buffer (B1). When the first bytes of B2
are read, the last bytes of B1 would be then stored in the line cache.

This issue occurs using a 68 bytes read buffer allocated from the "jffs2
raw inode" slab (jffs2/malloc.c).

The issue vanishes if SLAB_HWCACHE_ALIGN is supplied to the
kmem_cache_create calls. Please find below the patch that we are testing.

Best regards,
Gilles


diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index 9eff2bd..0490b6d 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -33,56 +33,56 @@ int __init jffs2_create_slab_caches(void)
 {
     full_dnode_slab = kmem_cache_create("jffs2_full_dnode",
                         sizeof(struct jffs2_full_dnode),
-                        0, 0, NULL);
+                        0, SLAB_HWCACHE_ALIGN, NULL);
     if (!full_dnode_slab)
         goto err;
 
     raw_dirent_slab = kmem_cache_create("jffs2_raw_dirent",
                         sizeof(struct jffs2_raw_dirent),
-                        0, 0, NULL);
+                        0, SLAB_HWCACHE_ALIGN, NULL);
     if (!raw_dirent_slab)
         goto err;
 
     raw_inode_slab = kmem_cache_create("jffs2_raw_inode",
                        sizeof(struct jffs2_raw_inode),
-                       0, 0, NULL);
+                       0, SLAB_HWCACHE_ALIGN, NULL);
     if (!raw_inode_slab)
         goto err;
 
     tmp_dnode_info_slab = kmem_cache_create("jffs2_tmp_dnode",
                         sizeof(struct jffs2_tmp_dnode_info),
-                        0, 0, NULL);
+                        0, SLAB_HWCACHE_ALIGN, NULL);
     if (!tmp_dnode_info_slab)
         goto err;
 
     raw_node_ref_slab = kmem_cache_create("jffs2_refblock",
                           sizeof(struct jffs2_raw_node_ref) *
(REFS_PER_BLOCK + 1),
-                          0, 0, NULL);
+                          0, SLAB_HWCACHE_ALIGN, NULL);
     if (!raw_node_ref_slab)
         goto err;
 
     node_frag_slab = kmem_cache_create("jffs2_node_frag",
                        sizeof(struct jffs2_node_frag),
-                       0, 0, NULL);
+                       0, SLAB_HWCACHE_ALIGN, NULL);
     if (!node_frag_slab)
         goto err;
 
     inode_cache_slab = kmem_cache_create("jffs2_inode_cache",
                          sizeof(struct jffs2_inode_cache),
-                         0, 0, NULL);
+                         0, SLAB_HWCACHE_ALIGN, NULL);
     if (!inode_cache_slab)
         goto err;
 
 #ifdef CONFIG_JFFS2_FS_XATTR
     xattr_datum_cache = kmem_cache_create("jffs2_xattr_datum",
                          sizeof(struct jffs2_xattr_datum),
-                         0, 0, NULL);
+                         0, SLAB_HWCACHE_ALIGN, NULL);
     if (!xattr_datum_cache)
         goto err;
 
     xattr_ref_cache = kmem_cache_create("jffs2_xattr_ref",
                        sizeof(struct jffs2_xattr_ref),
-                       0, 0, NULL);
+                       0, SLAB_HWCACHE_ALIGN, NULL);
     if (!xattr_ref_cache)
         goto err;
 #endif
