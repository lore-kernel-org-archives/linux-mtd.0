From: orjan.friberg@axis.com (Orjan Friberg)
Date: Mon, 10 Mar 2003 17:00:21 +0100
Subject: [PATCH] Oops on umount/mount (JFFS 1)
Message-ID: <3E6CB695.CF72E9BC@axis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

(This message was originally sent to jffs-dev.  Apologies for the dupe.)

The patch below takes care of a umount/mount-related oops I had.  It happens when a JFFS 1 file
system is mounted for the second time if CONFIG_JFFS_PROC_FS is on, due to jffs_proc_root being
freed on a umount, but only being allocated once (at init).  The patch below allocates
jffs_proc_root each time the proc entry is registered.  (In my case, besides corrupting a node, the
bug also manifested itself by /proc/fs/jffs not showing up after the second mount.)


Index: inode-v23.c
===================================================================
RCS file: /usr/local/cvs/linux/os/linux/fs/jffs/inode-v23.c,v
retrieving revision 1.15
diff -u -p -r1.15 inode-v23.c
--- inode-v23.c 18 Oct 2001 15:28:09 -0000      1.15
+++ inode-v23.c 9 Mar 2003 17:57:31 -0000
@@ -1742,9 +1742,6 @@ init_jffs_fs(void)
        printk(KERN_INFO "JFFS version " JFFS_VERSION_STRING
                ", (C) 1999, 2000  Axis Communications AB\n");
 
-#ifdef CONFIG_JFFS_PROC_FS
-       jffs_proc_root = proc_mkdir("jffs", proc_root_fs);
-#endif
        fm_cache = kmem_cache_create("jffs_fm", sizeof(struct jffs_fm),
                                     0, SLAB_HWCACHE_ALIGN, NULL, NULL);
        node_cache = kmem_cache_create("jffs_node",sizeof(struct jffs_node),
Index: jffs_proc.c
===================================================================
RCS file: /usr/local/cvs/linux/os/linux/fs/jffs/jffs_proc.c,v
retrieving revision 1.1.1.1
diff -u -p -r1.1.1.1 jffs_proc.c
--- jffs_proc.c 10 Oct 2001 15:16:00 -0000      1.1.1.1
+++ jffs_proc.c 9 Mar 2003 17:57:31 -0000
@@ -72,6 +72,9 @@ int jffs_register_jffs_proc_dir(kdev_t d
        struct proc_dir_entry *part_layout = 0;
        struct proc_dir_entry *part_root = 0;
 
+        /* Needs to be allocated at each register since it's freed on unregister. */
+       jffs_proc_root = proc_mkdir("jffs", proc_root_fs);
+
        /* Allocate structure for local JFFS partition table */
        if (!(part_dir = (struct jffs_partition_dir *)
                kmalloc (sizeof (struct jffs_partition_dir), GFP_KERNEL))) {

-- 
Orjan Friberg
Axis Communications AB
