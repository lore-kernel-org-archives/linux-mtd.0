Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnV-0006Ib-Pi
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:33 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 03/35] fs: super: cleanup: make the comment of each
 function aligned
Date: Thu, 30 Jul 2015 13:47:59 +0800
Message-ID: <1438235311-23788-4-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Originally, some of the comments start with "*\t" but some of them
start with "* ". This commit make them all start with "* "

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/super.c | 180 ++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 90 insertions(+), 90 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index b48077b..fadb677 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -136,10 +136,10 @@ static unsigned long super_cache_count(struct shrinker *shrink,
 }
 
 /**
- *	destroy_super	-	frees a superblock
- *	@s: superblock to free
+ * destroy_super	-	frees a superblock
+ * @s: superblock to free
  *
- *	Frees a superblock.
+ * Frees a superblock.
  */
 static void destroy_super(struct super_block *s)
 {
@@ -156,12 +156,12 @@ static void destroy_super(struct super_block *s)
 }
 
 /**
- *	alloc_super	-	create new superblock
- *	@type:	filesystem type superblock should belong to
- *	@flags: the mount flags
+ * alloc_super	-	create new superblock
+ * @type:	filesystem type superblock should belong to
+ * @flags: the mount flags
  *
- *	Allocates and initializes a new &struct super_block.  alloc_super()
- *	returns a pointer new superblock or %NULL if allocation had failed.
+ * Allocates and initializes a new &struct super_block.  alloc_super()
+ * returns a pointer new superblock or %NULL if allocation had failed.
  */
 static struct super_block *alloc_super(struct file_system_type *type, int flags)
 {
@@ -252,11 +252,11 @@ static void __put_super(struct super_block *sb)
 }
 
 /**
- *	put_super	-	drop a temporary reference to superblock
- *	@sb: superblock in question
+ * put_super	-	drop a temporary reference to superblock
+ * @sb: superblock in question
  *
- *	Drops a temporary reference, frees superblock if there's no
- *	references left.
+ * Drops a temporary reference, frees superblock if there's no
+ * references left.
  */
 static void put_super(struct super_block *sb)
 {
@@ -267,15 +267,15 @@ static void put_super(struct super_block *sb)
 
 
 /**
- *	deactivate_locked_super	-	drop an active reference to superblock
- *	@s: superblock to deactivate
+ * deactivate_locked_super	-	drop an active reference to superblock
+ * @s: superblock to deactivate
  *
- *	Drops an active reference to superblock, converting it into a temprory
- *	one if there is no other active references left.  In that case we
- *	tell fs driver to shut it down and drop the temporary reference we
- *	had just acquired.
+ * Drops an active reference to superblock, converting it into a temprory
+ * one if there is no other active references left.  In that case we
+ * tell fs driver to shut it down and drop the temporary reference we
+ * had just acquired.
  *
- *	Caller holds exclusive lock on superblock; that lock is released.
+ * Caller holds exclusive lock on superblock; that lock is released.
  */
 void deactivate_locked_super(struct super_block *s)
 {
@@ -302,12 +302,12 @@ void deactivate_locked_super(struct super_block *s)
 EXPORT_SYMBOL(deactivate_locked_super);
 
 /**
- *	deactivate_super	-	drop an active reference to superblock
- *	@s: superblock to deactivate
+ * deactivate_super	-	drop an active reference to superblock
+ * @s: superblock to deactivate
  *
- *	Variant of deactivate_locked_super(), except that superblock is *not*
- *	locked by caller.  If we are going to drop the final active reference,
- *	lock will be acquired prior to that.
+ * Variant of deactivate_locked_super(), except that superblock is *not*
+ * locked by caller.  If we are going to drop the final active reference,
+ * lock will be acquired prior to that.
  */
 void deactivate_super(struct super_block *s)
 {
@@ -319,17 +319,17 @@ void deactivate_super(struct super_block *s)
 EXPORT_SYMBOL(deactivate_super);
 
 /**
- *	grab_super - acquire an active reference
- *	@s: reference we are trying to make active
+ * grab_super - acquire an active reference
+ * @s: reference we are trying to make active
  *
- *	Tries to acquire an active reference.  grab_super() is used when we
- * 	had just found a superblock in super_blocks or fs_type->fs_supers
- *	and want to turn it into a full-blown active reference.  grab_super()
- *	is called with sb_lock held and drops it.  Returns 1 in case of
- *	success, 0 if we had failed (superblock contents was already dead or
- *	dying when grab_super() had been called).  Note that this is only
- *	called for superblocks not in rundown mode (== ones still on ->fs_supers
- *	of their type), so increment of ->s_count is OK here.
+ * Tries to acquire an active reference.  grab_super() is used when we
+ * had just found a superblock in super_blocks or fs_type->fs_supers
+ * and want to turn it into a full-blown active reference.  grab_super()
+ * is called with sb_lock held and drops it.  Returns 1 in case of
+ * success, 0 if we had failed (superblock contents was already dead or
+ * dying when grab_super() had been called).  Note that this is only
+ * called for superblocks not in rundown mode (== ones still on ->fs_supers
+ * of their type), so increment of ->s_count is OK here.
  */
 static int grab_super(struct super_block *s) __releases(sb_lock)
 {
@@ -346,21 +346,21 @@ static int grab_super(struct super_block *s) __releases(sb_lock)
 }
 
 /*
- *	trylock_super - try to grab ->s_umount shared
- *	@sb: reference we are trying to grab
+ * trylock_super - try to grab ->s_umount shared
+ * @sb: reference we are trying to grab
  *
- *	Try to prevent fs shutdown.  This is used in places where we
- *	cannot take an active reference but we need to ensure that the
- *	filesystem is not shut down while we are working on it. It returns
- *	false if we cannot acquire s_umount or if we lose the race and
- *	filesystem already got into shutdown, and returns true with the s_umount
- *	lock held in read mode in case of success. On successful return,
- *	the caller must drop the s_umount lock when done.
+ * Try to prevent fs shutdown.  This is used in places where we
+ * cannot take an active reference but we need to ensure that the
+ * filesystem is not shut down while we are working on it. It returns
+ * false if we cannot acquire s_umount or if we lose the race and
+ * filesystem already got into shutdown, and returns true with the s_umount
+ * lock held in read mode in case of success. On successful return,
+ * the caller must drop the s_umount lock when done.
  *
- *	Note that unlike get_super() et.al. this one does *not* bump ->s_count.
- *	The reason why it's safe is that we are OK with doing trylock instead
- *	of down_read().  There's a couple of places that are OK with that, but
- *	it's very much not a general-purpose interface.
+ * Note that unlike get_super() et.al. this one does *not* bump ->s_count.
+ * The reason why it's safe is that we are OK with doing trylock instead
+ * of down_read().  There's a couple of places that are OK with that, but
+ * it's very much not a general-purpose interface.
  */
 bool trylock_super(struct super_block *sb)
 {
@@ -375,18 +375,18 @@ bool trylock_super(struct super_block *sb)
 }
 
 /**
- *	generic_shutdown_super	-	common helper for ->kill_sb()
- *	@sb: superblock to kill
+ * generic_shutdown_super	-	common helper for ->kill_sb()
+ * @sb: superblock to kill
  *
- *	generic_shutdown_super() does all fs-independent work on superblock
- *	shutdown.  Typical ->kill_sb() should pick all fs-specific objects
- *	that need destruction out of superblock, call generic_shutdown_super()
- *	and release aforementioned objects.  Note: dentries and inodes _are_
- *	taken care of and do not need specific handling.
+ * generic_shutdown_super() does all fs-independent work on superblock
+ * shutdown.  Typical ->kill_sb() should pick all fs-specific objects
+ * that need destruction out of superblock, call generic_shutdown_super()
+ * and release aforementioned objects.  Note: dentries and inodes _are_
+ * taken care of and do not need specific handling.
  *
- *	Upon calling this function, the filesystem may no longer alter or
- *	rearrange the set of dentries belonging to this super_block, nor may it
- *	change the attachments of dentries to inodes.
+ * Upon calling this function, the filesystem may no longer alter or
+ * rearrange the set of dentries belonging to this super_block, nor may it
+ * change the attachments of dentries to inodes.
  */
 void generic_shutdown_super(struct super_block *sb)
 {
@@ -424,12 +424,12 @@ void generic_shutdown_super(struct super_block *sb)
 EXPORT_SYMBOL(generic_shutdown_super);
 
 /**
- *	sget	-	find or create a superblock
- *	@type:	filesystem type superblock should belong to
- *	@test:	comparison callback
- *	@set:	setup callback
- *	@flags:	mount flags
- *	@data:	argument to each of them
+ * sget	-	find or create a superblock
+ * @type:	filesystem type superblock should belong to
+ * @test:	comparison callback
+ * @set:	setup callback
+ * @flags:	mount flags
+ * @data:	argument to each of them
  */
 struct super_block *sget(struct file_system_type *type,
 			int (*test)(struct super_block *,void *),
@@ -491,12 +491,12 @@ void drop_super(struct super_block *sb)
 EXPORT_SYMBOL(drop_super);
 
 /**
- *	iterate_supers - call function for all active superblocks
- *	@f: function to call
- *	@arg: argument to pass to it
+ * iterate_supers - call function for all active superblocks
+ * @f: function to call
+ * @arg: argument to pass to it
  *
- *	Scans the superblock list and calls given function, passing it
- *	locked superblock and given argument.
+ * Scans the superblock list and calls given function, passing it
+ * locked superblock and given argument.
  */
 void iterate_supers(void (*f)(struct super_block *, void *), void *arg)
 {
@@ -525,13 +525,13 @@ void iterate_supers(void (*f)(struct super_block *, void *), void *arg)
 }
 
 /**
- *	iterate_supers_type - call function for superblocks of given type
- *	@type: fs type
- *	@f: function to call
- *	@arg: argument to pass to it
+ * iterate_supers_type - call function for superblocks of given type
+ * @type: fs type
+ * @f: function to call
+ * @arg: argument to pass to it
  *
- *	Scans the superblock list and calls given function, passing it
- *	locked superblock and given argument.
+ * Scans the superblock list and calls given function, passing it
+ * locked superblock and given argument.
  */
 void iterate_supers_type(struct file_system_type *type,
 	void (*f)(struct super_block *, void *), void *arg)
@@ -560,11 +560,11 @@ void iterate_supers_type(struct file_system_type *type,
 EXPORT_SYMBOL(iterate_supers_type);
 
 /**
- *	get_super - get the superblock of a device
- *	@bdev: device to get the superblock for
- *	
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device given. %NULL is returned if no match is found.
+ * get_super - get the superblock of a device
+ * @bdev: device to get the superblock for
+ * 
+ * Scans the superblock list and finds the superblock of the file system
+ * mounted on the device given. %NULL is returned if no match is found.
  */
 
 struct super_block *get_super(struct block_device *bdev)
@@ -599,13 +599,13 @@ rescan:
 EXPORT_SYMBOL(get_super);
 
 /**
- *	get_super_thawed - get thawed superblock of a device
- *	@bdev: device to get the superblock for
+ * get_super_thawed - get thawed superblock of a device
+ * @bdev: device to get the superblock for
  *
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device. The superblock is returned once it is thawed
- *	(or immediately if it was not frozen). %NULL is returned if no match
- *	is found.
+ * Scans the superblock list and finds the superblock of the file system
+ * mounted on the device. The superblock is returned once it is thawed
+ * (or immediately if it was not frozen). %NULL is returned if no match
+ * is found.
  */
 struct super_block *get_super_thawed(struct block_device *bdev)
 {
@@ -680,13 +680,13 @@ rescan:
 }
 
 /**
- *	do_remount_sb - asks filesystem to change mount options.
- *	@sb:	superblock in question
- *	@flags:	numeric part of options
- *	@data:	the rest of options
+ * do_remount_sb - asks filesystem to change mount options.
+ * @sb:	superblock in question
+ * @flags:	numeric part of options
+ * @data:	the rest of options
  *      @force: whether or not to force the change
  *
- *	Alters the mount options of a mounted file system.
+ * Alters the mount options of a mounted file system.
  */
 int do_remount_sb(struct super_block *sb, int flags, void *data, int force)
 {
-- 
1.8.4.2
