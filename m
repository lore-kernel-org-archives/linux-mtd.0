Received: from web14703.mail.yahoo.com ([216.136.224.120])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dsDl-0003br-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 12:21:09 +0000
Message-ID: <20020221123225.33436.qmail@web14703.mail.yahoo.com>
Date: Thu, 21 Feb 2002 04:32:25 -0800 (PST)
From: Michael Michael <memmel2@yahoo.com>
Subject: Re: Slow jffs2 startup on DOM 
To: Michael Michael <memmel2@yahoo.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Gad Hayisraeli <gad@syete.co.il>, linux-mtd@lists.infradead.org
In-Reply-To: <20020221113411.51847.qmail@web14706.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hack attack ...
Okay to test I added a call to  blockmtd_sync right at
the end of block_mtd  write
here's the monster diff
*** blkmtd.c	Thu Feb 21 05:28:39 2002
--- blkmtd.c.mike	Thu Feb 21 05:28:19 2002
***************
*** 843,852 ****
--- 843,853 ----
        SetPageUptodate(pages[pagecnt]);
        flush_dcache_page(pages[pagecnt]);
        page_cache_release(pages[pagecnt]);
      }
      kfree(pages);
+ 		blkmtd_sync(mtd);
      return 0;
    }

This fixed everything for me so I guess I was right.
But I really  this driver needs to be cleaned out to
just write direct try it with and without this change.

Mike



--- Michael Michael <memmel2@yahoo.com> wrote:
> Umm I'm thinking about this a bit more
> 
> the problem is I think in 
> linux/drivers/mtd/devices/blkmtd.c
> 
> I think that it is using the buffered device through
> the io buf. Thus even when you unmount you havent
> flushed the io buf of the underlying block device.
> Its my understanding the the linux block devices are
> not raw but read and right through the io buf.
> 
> in blkmtd.c blkmtd_readpage and  write_queue_task it
> does a
>  brw_kiovec which is in buffer.c at this point I'm
> getting a bit lost but it looks like the io is
> definatly buffered  with the writes occurring
> through
> a io buffer in a thread. The point is there not
> "direct"
> and not garunteed to occur until write_queue_task
> runs.
> 
> 
> I think blkmtd needs to use the new raw device api
> not
> the linux block devices i.e...
> 
> block_dev_directIO in fs/block_dev.c umm Nope dangit
> that calls evenutually brw_kiovec.  So its got to be
> the write thread which should be synchronous on
> writes
> ???
> I'm pretty sure thats the root of the problem a
> quick
> look showed the other mtd device writing directly so
> this is the "big difference" why is this in a thread
> ?
> 
> 
> I'm sure the Gad Hayisraeli is right about
> umount/sync
> working the question is why. 
> Answer  blkmtd writes in a thread and umount/sync
> wakes it up correctly. I don't think it should do
> that.
> 
> Did I win a star : )
> 
> --- David Woodhouse <dwmw2@infradead.org> wrote:
> > 
> > memmel2@yahoo.com said:
> > > I think in this case its caused by the
> underlying
> > block device
> > > cleaning things up. Not JFFS2. I think he's
> right.
> > 
> > 
> > I didn't think the DOM knew anything about when it
> > was opened/closed by the 
> > operating system, so it didn't get a chance to
> > behave differently on an 
> > unmount? It's just an IDE drive, isn't it?
> > 
> > --
> > dwmw2
> > 
> > 
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! Sports - Coverage of the 2002 Olympic Games
> http://sports.yahoo.com
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/


__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
