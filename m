Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOa6R-000493-Mf
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 00:06:25 +0000
Received: by mail-pa0-x244.google.com with SMTP id yy13so1062988pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 16:06:02 -0800 (PST)
Date: Wed, 27 Jan 2016 16:05:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: "sztomi89@gmail.com" <sztomi89@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Thomas Betker <thomas.betker@freenet.de>,
 Ming Liu <liu.ming50@gmail.com>, Deng Chao <deng.chao1@zte.com.cn>,
 wangzaiwei <wangzaiwei@top-vision.cn>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: JFFS2 deadlock
Message-ID: <20160128000559.GA14270@google.com>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
 <1453910781.20662.35.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1453910781.20662.35.camel@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ David (maintainer), linux-fsdevel, and others

On Wed, Jan 27, 2016 at 04:05:35PM +0000, Joakim Tjernlund wrote:
> On Wed, 2016-01-27 at 16:36 +0100, Szabó Tamás wrote:
> > Hello all,
> > 
> > I work on an embedded system running Linux 3.10 and found a deadlock
> > situation between jffs2_readpage and jffs2_write.
> > The problem is present on the latest 4.4 kernel too and occurs when
> > two tasks want to access the same file, one reads and the other writes it.
> > 
> > The kernel stack traces for writer and reader in deadlock:
> > 
> > __switch_to+0x4c/0x98
> > sleep_on_page+0x10/0x24
> > __lock_page+0x8c/0x9c
> > find_lock_page+0x7c/0x94
> > grab_cache_page_write_begin+0x64/0xd8
> > jffs2_write_begin+0x6c/0x2ec
> > generic_file_buffered_write+0x188/0x258
> > __generic_file_aio_write+0x1e0/0x484
> > generic_file_aio_write+0x70/0xfc
> > do_sync_write+0x7c/0xd4
> > vfs_write+0xc8/0x1b0
> > SyS_write+0x4c/0xa8
> > ret_from_syscall+0x0/0x38
> > 
> > __switch_to+0x4c/0x98
> > jffs2_readpage+0x28/0x5c
> > generic_file_aio_read+0x22c/0x7a0
> > do_sync_read+0x7c/0xd4
> > vfs_read+0xb0/0x170
> > SyS_read+0x4c/0xa8
> > ret_from_syscall+0x0/0x38
> > 
> > The root cause here is the locking order of f->sem mutex and pagelock.
> > jffs2_readpage function gets the page in locked state and then locks
> > the f->sem mutex, while jffs2_write_begin does it in reverse order.
> > 
> > I found a commit that brought in this bug.
> > That was a fix for another deadlock issue:
> > https://github.com/torvalds/linux/commit/5ffd3412ae5536a4c57469cb8ea31887121dcb2e
> > 
> > According to this commit and my code inspections the lock orders may be
> > the following:
> > readpage: page lock, f->sem
> > writepage_begin: f->sem, page lock
> > writepage_end: page lock, f->sem
> > GC: f->sem, page lock
> 
> I am not sure if this is the first time I hear this or if someone else has reported
> a similar issue.

No, I'm pretty sure this is not the first report. I think there have
even been patches. The problem is that JFFS2 is effectively
unmaintained, despite what MAINTAINERS has to say about it.

Previous reports:

Subject: Another JFFS2 deadlock, kernel 3.4.11
http://thread.gmane.org/gmane.linux.drivers.mtd/62523

Subject: [JFFS2] Revision "jffs2: Fix lock acquisition order bug in
jffs2_write_begin" introduces another dead lock.
http://thread.gmane.org/gmane.linux.drivers.mtd/47986

There are other reports of deadlocks in jffs2_readpage, but in my
limited scanning, they look slightly different, so I won't include them
in this list.

For reference: outstanding patches, waiting for a maintainer (I've been
keeping patchwork up-to-date, mostly, but I'm not touching JFFS2 myself,
for the most part):
http://patchwork.ozlabs.org/project/linux-mtd/list/?q=jffs2

I'm tempted to resurrect this patch, to mark JFFS2 as Orphaned /
Obsolete:

http://patchwork.ozlabs.org/patch/422160/

David, can you please clarify your role here? Are you maintaining JFFS2
or not? Or perhaps someone else should be added? I don't really know any
interested parties.

Maybe the MAINTAINERS entry should be directed to linux-fsdevel too?

Brian
