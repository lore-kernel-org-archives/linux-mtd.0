In-Reply-To: <2015111020502373692025@top-vision.cn>
References: <2015102618531107256082@top-vision.cn>,
 <OF29DE4023.3FDE364E-ONC1257EF8.004B3067-C1257EF8.00613BF0@rohde-schwarz.com>
 <2015111020502373692025@top-vision.cn>
To: wangzaiwei <wangzaiwei@top-vision.cn>
Cc: Deng Chao <deng.chao1@zte.com.cn>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 'Li Jiaxin' <lijiaxin@top-vision.cn>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Ming Liu <liu.ming50@gmail.com>, lizhenwei <lizhenwei@top-vision.cn>
MIME-Version: 1.0
Subject: Re: Another JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF69D506BE.C7212435-ONC1257EFA.002F1880-C1257EFA.0043D703@rohde-schwarz.com>
Date: Wed, 11 Nov 2015 13:20:57 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello wangzaiwei:

> > Deng Chao has created a patch which a) removes the deadlock I wanted 
to 
> > get rid of originally, without b) introducing the new deadlocks; see 
> > http://lists.infradead.org/pipermail/linux-mtd/2013-August/048352.html
. 
> > However, his patch modifies mm/filemap.c, and we were hoping to find a 

> > more light-weight solution -- which never came to be.
> 
> > I do use his patch here around, though, and so far, it has worked 
fine. I 
> > will try to run your test scripts on one of our devices, and see if it 

> > holds up.

I have run your scripts on my device (with Deng Chao's patch) for three 
hours. None of the scripts got into state 'D', and the system is still 
alive (2 CPUs, so if a deadlock had occurred, the system would have 
stopped dead).

> Though I didn't know about that Deng Chao and Ming Liu had reported the 
issue,
> I have had the same patch thinking.
> 
> Yes,these deadlock issues which we have found always occured between
> gc thread(may 
> actived by sync system call) and other user tasks
> 
> gc thread just like :
> > for [sync_supers]
> > jffs2_garbage_collect_live
> >     mutex_lock(&f->sem)                         (A)
> >     jffs2_garbage_collect_dnode
> >         jffs2_gc_fetch_page
> >             read_cache_page_async
> >                 do_read_cache_page
> >                     lock_page(page)             (B)
> 
> 
> if we change lock_page(page) above to lock_page_try(page),deadlock 
> will go away.
> 
> But i worry about this workaround. jffs2_garbage_collect_live action
> will changed.
> and jffs2_garbage_collect_live is called not only by gc thread.
> Is it ok to return an error rather than blocking . 
> Can syscall 'sync' still reach its goal ?

I think that Deng Chao has discussed this in his patch. We have been using 
the patch for almost two years now, and I didn't see any bad effects yet.

Best regards,
Thomas Betker
