Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cweid-00005f-I8
 for linux-mtd@lists.infradead.org; Sat, 08 Apr 2017 00:59:13 +0000
Received: by mail-pg0-x243.google.com with SMTP id o123so18679808pga.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2017 17:58:53 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: tglx@linutronix.de, viro@zeniv.linux.org.uk, gregkh@linuxfoundation.org,
 andreas.dilger@intel.com, arnd@arndb.de, bfields@fieldses.org, clm@fb.com,
 davem@davemloft.net, dsterba@suse.com, dushistov@mail.ru,
 eparis@redhat.com, jaegeuk@kernel.org, jbacik@fb.com,
 jlayton@poochiereds.net, john.stultz@linaro.org, jsimmons@infradead.org,
 mingo@redhat.com, oleg.drokin@intel.com, paul@paul-moore.com,
 rostedt@goodmis.org, yuchao0@huawei.com, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-audit@redhat.com,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-security-module@vger.kernel.org,
 lustre-devel@lists.lustre.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, y2038@lists.linaro.org
Subject: [PATCH 12/12] time: Delete current_fs_time() function
Date: Fri,  7 Apr 2017 17:57:10 -0700
Message-Id: <1491613030-11599-13-git-send-email-deepa.kernel@gmail.com>
In-Reply-To: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
References: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All uses of the current_fs_time() function have been
replaced by other time interfaces.

And, its use cases can be fulfilled by current_time()
or ktime_get_* variants.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/fs.h |  1 -
 kernel/time/time.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index f1d7347..cce6c57 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1430,7 +1430,6 @@ static inline void i_gid_write(struct inode *inode, gid_t gid)
 	inode->i_gid = make_kgid(inode->i_sb->s_user_ns, gid);
 }
 
-extern struct timespec current_fs_time(struct super_block *sb);
 extern struct timespec current_time(struct inode *inode);
 
 /*
diff --git a/kernel/time/time.c b/kernel/time/time.c
index 25bdd25..cf69cca 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -230,20 +230,6 @@ SYSCALL_DEFINE1(adjtimex, struct timex __user *, txc_p)
 	return copy_to_user(txc_p, &txc, sizeof(struct timex)) ? -EFAULT : ret;
 }
 
-/**
- * current_fs_time - Return FS time
- * @sb: Superblock.
- *
- * Return the current time truncated to the time granularity supported by
- * the fs.
- */
-struct timespec current_fs_time(struct super_block *sb)
-{
-	struct timespec now = current_kernel_time();
-	return timespec_trunc(now, sb->s_time_gran);
-}
-EXPORT_SYMBOL(current_fs_time);
-
 /*
  * Convert jiffies to milliseconds and back.
  *
-- 
2.7.4
