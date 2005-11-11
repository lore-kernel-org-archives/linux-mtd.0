Received: from smtp19.mail.bbt.yahoo.co.jp ([202.93.83.112])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eab3y-0004Ju-Qq
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 10:43:55 -0500
Message-ID: <000c01c5e6d6$abf22490$0b01a8c0@YANO>
From: "Keijiro Yano" <keijiro_yano@yahoo.co.jp>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 12 Nov 2005 00:43:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="Windows-1252";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: jffs2 mutex problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I find out the problem related to the mutex lock in JFFS2.
I always use Linux 2.6.10, but Linux 2.6.14 also has a same
problem, I think.

jffs2_create() calls jffs2_new_inode() that allocates new
"jffs2_inode_info" with jffs2_alloc_inode().
Generally, in this case, jffs2_i_init_once(), which is the
constructor for jffs2_inode_cachep, will be called and
initialize the mutex with lock state by the below code.

static void jffs2_i_init_once(void * foo, kmem_cache_t * cachep, unsigned 
long flags)
{
struct jffs2_inode_info *ei = (struct jffs2_inode_info *) foo;

if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
    SLAB_CTOR_CONSTRUCTOR) {
init_MUTEX_LOCKED(&ei->sem);

But, the constructor is called by kmem_cache_alloc()
only when no active objects are left in a cache.

Therefore, sometimes jffs2_i_init_once() will not be
called after jffs2_alloc_inode() is done.

So, jffs2_do_create(), which is called by jffs2_create(), will
do "up(&f->sem)" in unlocking state.

I try to fix this problem with the following patch. Please
review it and/or give me your comments.

--- fs/jffs2/os-linux.h 10 Feb 2005 10:15:41 -0000 1.1.1.1
+++ fs/jffs2/os-linux.h 9 Nov 2005 08:36:13 -0000
@@ -93,8 +93,8 @@
  f->usercompr = 0;
 #else
  memset(f, 0, sizeof(*f));
- init_MUTEX_LOCKED(&f->sem);
 #endif
+ init_MUTEX_LOCKED(&f->sem);
 }

 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)

--- fs/jffs2/super.c 10 Feb 2005 10:15:41 -0000 1.1.1.1
+++ fs/jffs2/super.c 9 Nov 2005 08:36:13 -0000
@@ -51,7 +51,7 @@

  if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
      SLAB_CTOR_CONSTRUCTOR) {
- init_MUTEX_LOCKED(&ei->sem);
  inode_init_once(&ei->vfs_inode);
  }
 }

Thanks,
Keijiro Yano

--------------------------------------
Know more about Breast Cancer
http://pr.mail.yahoo.co.jp/pinkribbon/
