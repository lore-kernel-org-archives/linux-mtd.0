In-Reply-To: <2015102618531107256082@top-vision.cn>
References: <2015102618531107256082@top-vision.cn>
To: wangzaiwei <wangzaiwei@top-vision.cn>
Cc: 'Li Jiaxin' <lijiaxin@top-vision.cn>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-mtd" <linux-mtd-bounces@lists.infradead.org>,
 lizhenwei <lizhenwei@top-vision.cn>, "Deng Chao" <deng.chao1@zte.com.cn>,
 "Ming Liu" <liu.ming50@gmail.com>,
 "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
MIME-Version: 1.0
Subject: Re: Another JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF29DE4023.3FDE364E-ONC1257EF8.004B3067-C1257EF8.00613BF0@rohde-schwarz.com>
Date: Mon, 9 Nov 2015 18:42:01 +0100
Content-Type: text/plain; charset="ISO-2022-JP"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello wangzaiwei:

> So we patched our kernel refer to 
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> SHA-1: 5ffd3412ae5536a4c57469cb8ea31887121dcb2e
> * jffs2: Fix lock acquisition order bug in jffs2_write_begin
> 
> But these days, we encountered another deadlock . 
> our process stucked at system call 'unlink()' when we delete a file.
> 
> Enclosed scripts can be used to reproduce this new issue.

[snip]

> about 10 minutes later, these test scripts will be blocked in state 'D'
> 
> We parsed this issue again. 
> for [sync_supers]
> jffs2_garbage_collect_live
>     mutex_lock(&f->sem)                         (A)
>     jffs2_garbage_collect_dnode
>         jffs2_gc_fetch_page
>             read_cache_page_async
>                 do_read_cache_page
>                     lock_page(page)             (B)
> For other tasks
>    generic_file_aio_read 
>       do_generic_file_read 
>          lock_page_killable(page);                (B)
>          mapping->a_ops->readpage  （jffs2_readpage ） 
>             mutex_lock(&f->sem)                  (A)
> 
> We noticed that jffs2_readpage always be called with lock_page(page) 
hold,
> but most of other functions in jffs2 module call mutex_lock(&f->sem) 
first,
> lock_page(page) second. It is the same in latest kernel:
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> Is this logical? Or is it just my understanding wrong?

This looks suspiciously like a deadlock reported by Ming Liu 
(22-Aug-2013). This deadlock, and another one reported by Deng Chao 
(23-Jul-2013), were introduced by my patch, "jffs2: Fix lock acquisition 
order bug in jffs2_write_begin".

Deng Chao has created a patch which a) removes the deadlock I wanted to 
get rid of originally, without b) introducing the new deadlocks; see 
http://lists.infradead.org/pipermail/linux-mtd/2013-August/048352.html. 
However, his patch modifies mm/filemap.c, and we were hoping to find a 
more light-weight solution -- which never came to be.

I do use his patch here around, though, and so far, it has worked fine. I 
will try to run your test scripts on one of our devices, and see if it 
holds up.

Anyway, I think I should revert my patch (and should have done so a long 
time ago) even if this means that my original deadlock will come back. 
This is neccessary in any case to clear the way for Deng Chao's patch, or 
perhaps for some other solution. Joakim, what's your take on this?

Best regards,
Thomas Betker
