Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYTvS-0006BQ-25
 for linux-mtd@lists.infradead.org; Sun, 16 Dec 2018 10:45:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id f81so9733480wmd.4
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2018 02:45:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1524823321.git.h.grohne@intenta.de>
 <d36fa783db66ec430565a065245ebcacfea39e13.1524823321.git.h.grohne@intenta.de>
 <1524833695.18504.36.camel@infradead.org>
 <20180430103126.w44pr4u3pyjbatbp@laureti-dev>
In-Reply-To: <20180430103126.w44pr4u3pyjbatbp@laureti-dev>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 16 Dec 2018 11:45:10 +0100
Message-ID: <CAFLxGvyESZtLJ7bU8nYq=nzB_edH3GP6eryPyEKaOa02b49Swg@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: put directories f->sem on a separate lockdep
 class
To: h.grohne@intenta.de
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 30, 2018 at 12:32 PM Helmut Grohne <h.grohne@intenta.de> wrote:
>
> We get a lockdep warning if we read a directory (e.g. ls) and fault a
> page on a regular file:
>
> [  181.206207] mmaptest/392 is trying to acquire lock:
> [  181.211066]  (&f->sem){+.+.}, at: [<c01ff7d8>] jffs2_readpage+0x30/0x5c
> [  181.217663]
> [  181.217663] but task is already holding lock:
> [  181.223477]  (&mm->mmap_sem){++++}, at: [<c04928e8>] do_page_fault+0xa8/0x454
> [  181.230596]
> [  181.230596] which lock already depends on the new lock.
> [  181.230596]
> [  181.238755]
> [  181.238755] the existing dependency chain (in reverse order) is:
> [  181.246219]
> [  181.246219] -> #1 (&mm->mmap_sem){++++}:
> [  181.251614]        __might_fault+0x90/0xc0
> [  181.255694]        filldir+0xa4/0x1f4
> [  181.259334]        jffs2_readdir+0xd8/0x1d4
> [  181.263499]        iterate_dir+0x78/0x128
> [  181.267490]        SyS_getdents+0x8c/0x12c
> [  181.271576]        ret_fast_syscall+0x0/0x28
> [  181.275818]
> [  181.275818] -> #0 (&f->sem){+.+.}:
> [  181.280690]        lock_acquire+0xfc/0x2b0
> [  181.284763]        __mutex_lock+0x8c/0xb0c
> [  181.288842]        mutex_lock_nested+0x2c/0x34
> [  181.293272]        jffs2_readpage+0x30/0x5c
> [  181.297438]        filemap_fault+0x600/0x73c
> [  181.301690]        __do_fault+0x28/0xb8
> [  181.305510]        handle_mm_fault+0x854/0xec0
> [  181.309937]        do_page_fault+0x384/0x454
> [  181.314188]        do_DataAbort+0x4c/0xc8
> [  181.318181]        __dabt_usr+0x44/0x60
> [  181.321999]        0xb6dffb02
>
> Like with inode->i_rwsem, we recognize that this can never result in a
> dead lock, because we cannot page fault directory inodes and we cannot
> call getdents on non-directories. Thus we need different lockdep classes
> depending on the mode. This mirrors what
> lockdep_annotate_inode_mutex_key does to inodes.
>
> Link: https://www.spinics.net/lists/linux-rt-users/msg07644.html
> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---
> I have reworked only this last patch of the series to avoid sending three
> extra mails. If you prefer the full series, I can resend it.
>
> Changing lock classes after using a lock is not a common thing to do, yet
> this patch does exactly that. Thus I opted for performing two extra tests
> to gain more confidence in the correctness of this approach:
>
>  * I tried adding a BUG_ON(!mutex_is_locked(&f->sem)) to before the lock
>    class change to validate that the mutex on the I_NEW inode cannot be
>    held. This call did not error out in my tests.
>
>  * I tried adding a mutex_clear(&f->sem) to jffs2_do_clear_inode and
>    reinitialized it before setting the mutex class to validate that it
>    really isn't used in the relevant time frame. This did not cause
>    lockdep to complain in my tests.
>
> Changes in v2:
>  - Initialize the lock class on every inode initialization rather than just the
>    initial one in jffs2_i_init_once. (Thanks to David Woodhouse for pointing at
>    this issue.)
>  - Properly wrap the commit message to make checkpatch.pl fully happy.
>
> ---
>  fs/jffs2/fs.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index 89a10b398d00..9bc3cd204732 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -26,6 +26,9 @@
>  #include <linux/crc32.h>
>  #include "nodelist.h"
>
> +static struct lock_class_key jffs2_inode_info_sem_key,
> +        jffs2_inode_info_sem_dir_key;
> +
>  static int jffs2_flash_setup(struct jffs2_sb_info *c);
>
>  int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
> @@ -277,6 +280,11 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
>
>         inode->i_mode = jemode_to_cpu(latest_node.mode);
>
> +       /* Mirror lock class of inode->i_rwsem, see
> +        * lockdep_annotate_inode_mutex_key.
> +        */
> +       lockdep_set_class(&f->sem, S_ISDIR(inode->i_mode) ?
> +               &jffs2_inode_info_sem_dir_key : &jffs2_inode_info_sem_key);
>         mutex_lock(&f->sem);
>
>         i_uid_write(inode, je16_to_cpu(latest_node.uid));
> @@ -439,6 +447,11 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>
>         f = JFFS2_INODE_INFO(inode);
>         jffs2_init_inode_info(f);
> +       /* Mirror lock class of inode->i_rwsem, see
> +        * lockdep_annotate_inode_mutex_key.
> +        */
> +       lockdep_set_class(&f->sem, S_ISDIR(inode->i_mode) ?
> +               &jffs2_inode_info_sem_dir_key : &jffs2_inode_info_sem_key);
>         mutex_lock(&f->sem);
>
>         memset(ri, 0, sizeof(*ri));

I'm currently going through old jffs2 patches and found this one.
It looks correct and sane, therefore I plan to merge it via the MTD tree.

David, if you have objections, please let me know. :-)

-- 
Thanks,
//richard
