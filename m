Received: from web14701.mail.yahoo.com ([216.136.224.118])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eGzI-0005yq-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 14:47:52 +0000
Message-ID: <20020222145908.83358.qmail@web14701.mail.yahoo.com>
Date: Fri, 22 Feb 2002 06:59:08 -0800 (PST)
From: Michael Michael <memmel2@yahoo.com>
Subject: Re: Slow jffs2 startup on DOM 
To: Simon Evans <spse@secret.org.uk>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <E16eERi-0005zM-00@spoinky.secret.org.uk>
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

--- Simon Evans <spse@secret.org.uk> wrote:

I'm glad you wrote. I was hesitant to change the code
because of the complexity. Do you think you can add
synchronus write vs the current system as a compile
time option for this driver.
Would it be possible for you to ifdef and move the
code around a bit so both options are avialable. 

Its easy for me just to wack out all the thread stuff
and do a direct write but I think its better if your
approach and the direct write approach are both
avialable as compile options. 

I gave some responses below since I honestly don't
think its needed and if it is should be somewhere else
not the driver.  But its easy to make it optional ...


>
> Hi,
> 
> Sorry for not replying earlier :)
> 
> When I originally wrote blkmtd it did do synchronous
> writes and
> there was no write thread. However this made the
> device *really*
> slow. 
I could agian be wrong here but doesn't the page cache
handle all this buffering of writes at a higher level
? I.E there are other buffer mechanisms for write.  So
unless there is a miss in the page cache everything is
cozy. It just looks to me like your repeating the
actions of the page cache.  If you have to cache at
the device level this means to me something is wrong
with the page cache which was designed to cache on top
of slow ide block devices. 

If you are really slow on writes then maybe MTD could
do the buffering. So this write buffer would be a MTD
option. It may even make a lot of sense there for
people since it would be and option for all devices. 
Most of the MTD devices are fairly slow for writes (
IMHO ) so it makes more sense there if its really
needed. So it should be and option to MTD not in the
device driver.


>Obviously, If you are doing a small amount of
> writing compared
> to reading then you could remove all the thread
> stuff and the outgoing
> write queue and just do a brw_kiovec in
> blkmtd_write.
> 
> The reason the writeout stuff is so complex is
> because the writes
> go out in the order they are done and we also have
> to maintain multiple
> copies of pages we haven't written out. So if we
> write to Page 1,
> then Page 2 then Page 1 again the outgoing queue has
> 
> 
> copy of first page 1
> copy of page 2
> copy of new page 1
> 
> and then the readpage has to look at this queue to
> find the newest
> version. The reason you cant discard the first page
> 1 is because if you
> dropped the copy of the first page 1 & made you
> queue look like:
> 
> copy of page 2
> copy of new page 1
> 
> and the power went off just after it had written out
> the page 2, the
> device would be inconsistent.
> 
> NOTE - we are ignoring the cache on the IDE device
> and assuming
> it does the correct thing even if it practice it
> does not.
> 
> Basically, blkmtd is trying to maintain a consistent
> device however it 
> does use a lot of memory in doing so.
> 
> If you wanted to make the code really simple you
> could just do synchronous 
> writes. I should really do a version that does this
> and benchmark it as
> it was a long time ago when I first had it like
> this.
> 
> If you wanted a faster version but werent worried
> about the order writes
> occured, you could just mark the pages dirty and
> then use vm pressure
> in writepage() to do write outs. You'll still have
> to walk the dirty
> list on sync() to make sure everything is written
> out however.
> 
> Another thing to bear in mind is that blkmtd reads
> and writes in whole
> pages. If you just change one byte, it has to read
> the page that it is
> in and write it out again - not good.

See above this would only happen if the page cache is
missing badly.
> 
> Anyway, hope some of this info helps
> 
> cheers
> si
> 
> >Umm I'm thinking about this a bit more
> >
> >the problem is I think in 
> >linux/drivers/mtd/devices/blkmtd.c
> >
> >I think that it is using the buffered device
> through
> >the io buf. Thus even when you unmount you havent
> >flushed the io buf of the underlying block device.
> >Its my understanding the the linux block devices
> are
> >not raw but read and right through the io buf.
> >
> >in blkmtd.c blkmtd_readpage and  write_queue_task
> it
> >does a
> > brw_kiovec which is in buffer.c at this point I'm
> >getting a bit lost but it looks like the io is
> >definatly buffered  with the writes occurring
> through
> >a io buffer in a thread. The point is there not
> >"direct"
> >and not garunteed to occur until write_queue_task
> >runs.
> >
> >
> >I think blkmtd needs to use the new raw device api
> not
> >the linux block devices i.e...
> >
> >block_dev_directIO in fs/block_dev.c umm Nope
> dangit
> >that calls evenutually brw_kiovec.  So its got to
> be
> >the write thread which should be synchronous on
> writes
> >???
> >I'm pretty sure thats the root of the problem a
> quick
> >look showed the other mtd device writing directly
> so
> >this is the "big difference" why is this in a
> thread ?
> >
> >
> >I'm sure the Gad Hayisraeli is right about
> umount/sync
> >working the question is why. 
> >Answer  blkmtd writes in a thread and umount/sync
> >wakes it up correctly. I don't think it should do
> >that.
> >
> >Did I win a star : )
> >
> 
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
