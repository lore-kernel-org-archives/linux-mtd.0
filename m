Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EavB2-0005Da-FP
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2005 08:12:28 -0500
Message-ID: <4375EA0D.2060704@yandex.ru>
Date: Sat, 12 Nov 2005 16:11:41 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Keijiro Yano <keijiro_yano@yahoo.co.jp>
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO>
In-Reply-To: <000c01c5e6d6$abf22490$0b01a8c0@YANO>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 mutex problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Keijiro Yano wrote:
> Hello,
> 
> I find out the problem related to the mutex lock in JFFS2.
> I always use Linux 2.6.10, but Linux 2.6.14 also has a same
> problem, I think.
> 
> jffs2_create() calls jffs2_new_inode() that allocates new
> "jffs2_inode_info" with jffs2_alloc_inode().
> Generally, in this case, jffs2_i_init_once(), which is the
> constructor for jffs2_inode_cachep, will be called and
> initialize the mutex with lock state by the below code.
> 
> static void jffs2_i_init_once(void * foo, kmem_cache_t * cachep, 
> unsigned long flags)
> {
> struct jffs2_inode_info *ei = (struct jffs2_inode_info *) foo;
> 
> if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
>    SLAB_CTOR_CONSTRUCTOR) {
> init_MUTEX_LOCKED(&ei->sem);
> 
> But, the constructor is called by kmem_cache_alloc()
> only when no active objects are left in a cache.
> 
> Therefore, sometimes jffs2_i_init_once() will not be
> called after jffs2_alloc_inode() is done.
> 
> So, jffs2_do_create(), which is called by jffs2_create(), will
> do "up(&f->sem)" in unlocking state.
Hmm, really. IMO it is a bug to initialize the mutex as locked in the 
constructor while the mutex is left unlocked when it is being freed.

> I try to fix this problem with the following patch. Please
> review it and/or give me your comments.
> 
> --- fs/jffs2/os-linux.h 10 Feb 2005 10:15:41 -0000 1.1.1.1
> +++ fs/jffs2/os-linux.h 9 Nov 2005 08:36:13 -0000
> @@ -93,8 +93,8 @@
>  f->usercompr = 0;
> #else
>  memset(f, 0, sizeof(*f));
> - init_MUTEX_LOCKED(&f->sem);
> #endif
> + init_MUTEX_LOCKED(&f->sem);
> }
> 
> #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
> 
> --- fs/jffs2/super.c 10 Feb 2005 10:15:41 -0000 1.1.1.1
> +++ fs/jffs2/super.c 9 Nov 2005 08:36:13 -0000
> @@ -51,7 +51,7 @@
> 
>  if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
>      SLAB_CTOR_CONSTRUCTOR) {
> - init_MUTEX_LOCKED(&ei->sem);
>  inode_init_once(&ei->vfs_inode);
>  }
> }

Well, the patch is not against the latest MTD CVS snapshot which is bad.

The right solution, IMO, would be:

1. use init_MUTEX() in the slab constructor for jffs2_inode_info() objects.
2. add explicit down(&f->sem) everywhere after jffs2_new_inode().

This is right because the "constructed" state of the inode is when the 
mutex is initialized and unlocked. FYI, here is a good article where you 
can read about the idea of constructors in the slab cache: 
http://srl.cs.jhu.edu/courses/600.418/SlabAllocator.pdf


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
