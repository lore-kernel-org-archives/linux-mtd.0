In-Reply-To: <000301ce8741$b96b15f0$1c214a0a@ztedengchao>
References: <000301ce8741$b96b15f0$1c214a0a@ztedengchao>
To: "Deng Chao" <deng.chao1@zte.com.cn>
MIME-Version: 1.0
Subject: Re: [JFFS2]The patch "jffs2: Fix lock acquisition order bug in
 jffs2_write_begin" introduces another dead lock bug.
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFABB2B31E.4049B701-ONC1257BB7.0037E246-C1257BB7.0039FCB5@rohde-schwarz.com>
Date: Mon, 29 Jul 2013 12:33:16 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, wang.bo116@zte.com.cn,
 linux-mtd@lists.infradead.org, Thomas Betker <thomas.betker@freenet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Chao:

> The full header of the patch is below:
> author Thomas Betker <thomas.betker@freenet.de> 2012-10-17 20:59:30 
(GMT)
> committer Artem Bityutskiy <artem.bityutskiy@linux.intel.com> 
> 2012-11-09 15:02:50 (GMT)
> commit 5ffd3412ae5536a4c57469cb8ea31887121dcb2e?(patch)
> tree 33c9d89eabf70c49e683a36be800be3b4582a358?/fs/jffs2
> parent 0131950ebd146b5e31508233352d6f4625af25b1?(diff)
> 
> jffs2: Fix lock acquisition order bug in jffs2_write_begin.
> 
> jffs2_write_begin first acquires the c->alloc_sem, then the page 
> lock. This causes an ABBA dead lock with jffs2_write_end, which 
> already have hold the page lock, then the c->alloc_sem:
> THREAD ONE:
> jffs2_write_begin
>  jffs2_reserve_space
>   mutex_lock(&c->alloc_sem) A
>  grab_cache_page_write_begin 
>   find_lock_page
>    lock_page(page) B
> THERAD TWO:
> jffs2_write_end  B(already has taken the page lock because the 
> preceding jffs2_write_begin)
>  jffs2_write_inode_range
>   jffs2_reserve_space
>    mutex_lock(&c->alloc_sem) A

I looked at the code, and you are right: When swapping 
jffs2_reserve_space() and grab_cache_page_write_begin() in my patch, this 
changed the lock acquisition order from lock_page / c->alloc_sem / f->sem 
to c->alloc_sem / f->sem / lock_page. [The intention was to acquire f->sem 
before lock_page, but c->alloc_sem must be acquired before f->sem 
according to README.Locking.]

However, I am surprised that jffs2_write_end() may run, for the same page, 
in parallel with jffs2_write_begin(); I would expect that it cannot be 
called before jffs2_write_begin() returns. Did your kernel actually panic 
on this? Do you have any further information about it?

Best regards,
Thomas
