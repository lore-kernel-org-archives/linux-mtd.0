Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnU-0006If-NL
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:29 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 02/35] fs: cleanup: remove the blank line before
 EXPORT_SYMBOL
Date: Thu, 30 Jul 2015 13:47:58 +0800
Message-ID: <1438235311-23788-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/super.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 928c20f..b48077b 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -299,7 +299,6 @@ void deactivate_locked_super(struct super_block *s)
 		up_write(&s->s_umount);
 	}
 }
-
 EXPORT_SYMBOL(deactivate_locked_super);
 
 /**
@@ -317,7 +316,6 @@ void deactivate_super(struct super_block *s)
 		deactivate_locked_super(s);
 	}
 }
-
 EXPORT_SYMBOL(deactivate_super);
 
 /**
@@ -423,7 +421,6 @@ void generic_shutdown_super(struct super_block *sb)
 	spin_unlock(&sb_lock);
 	up_write(&sb->s_umount);
 }
-
 EXPORT_SYMBOL(generic_shutdown_super);
 
 /**
@@ -484,7 +481,6 @@ retry:
 	register_shrinker(&s->s_shrink);
 	return s;
 }
-
 EXPORT_SYMBOL(sget);
 
 void drop_super(struct super_block *sb)
@@ -492,7 +488,6 @@ void drop_super(struct super_block *sb)
 	up_read(&sb->s_umount);
 	put_super(sb);
 }
-
 EXPORT_SYMBOL(drop_super);
 
 /**
@@ -562,7 +557,6 @@ void iterate_supers_type(struct file_system_type *type,
 		__put_super(p);
 	spin_unlock(&sb_lock);
 }
-
 EXPORT_SYMBOL(iterate_supers_type);
 
 /**
@@ -602,7 +596,6 @@ rescan:
 	spin_unlock(&sb_lock);
 	return NULL;
 }
-
 EXPORT_SYMBOL(get_super);
 
 /**
@@ -870,7 +863,6 @@ int set_anon_super(struct super_block *s, void *data)
 {
 	return get_anon_bdev(&s->s_dev);
 }
-
 EXPORT_SYMBOL(set_anon_super);
 
 void kill_anon_super(struct super_block *sb)
@@ -879,7 +871,6 @@ void kill_anon_super(struct super_block *sb)
 	generic_shutdown_super(sb);
 	free_anon_bdev(dev);
 }
-
 EXPORT_SYMBOL(kill_anon_super);
 
 void kill_litter_super(struct super_block *sb)
@@ -888,7 +879,6 @@ void kill_litter_super(struct super_block *sb)
 		d_genocide(sb->s_root);
 	kill_anon_super(sb);
 }
-
 EXPORT_SYMBOL(kill_litter_super);
 
 static int ns_test_super(struct super_block *sb, void *data)
@@ -924,7 +914,6 @@ struct dentry *mount_ns(struct file_system_type *fs_type, int flags,
 
 	return dget(sb->s_root);
 }
-
 EXPORT_SYMBOL(mount_ns);
 
 #ifdef CONFIG_BLOCK
@@ -1034,7 +1023,6 @@ void kill_block_super(struct super_block *sb)
 	WARN_ON_ONCE(!(mode & FMODE_EXCL));
 	blkdev_put(bdev, mode | FMODE_EXCL);
 }
-
 EXPORT_SYMBOL(kill_block_super);
 #endif
 
-- 
1.8.4.2
