Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eEJd-0005j6-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 11:56:42 +0000
From: Simon Evans <spse@secret.org.uk>
To: Michael Michael <memmel2@yahoo.com>
cc: David Woodhouse <dwmw2@infradead.org>,
    Gad Hayisraeli <gad@syete.co.il>, linux-mtd@lists.infradead.org
Subject: Re: Slow jffs2 startup on DOM 
In-Reply-To: Message from Michael Michael <memmel2@yahoo.com>
   of "Thu, 21 Feb 2002 03:34:11 PST." <20020221113411.51847.qmail@web14706.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Feb 2002 12:05:02 +0000
Message-Id: <E16eERi-0005zM-00@spoinky.secret.org.uk>
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

Hi,

Sorry for not replying earlier :)

When I originally wrote blkmtd it did do synchronous writes and
there was no write thread. However this made the device *really*
slow. Obviously, If you are doing a small amount of writing compared
to reading then you could remove all the thread stuff and the outgoing
write queue and just do a brw_kiovec in blkmtd_write.

The reason the writeout stuff is so complex is because the writes
go out in the order they are done and we also have to maintain multiple
copies of pages we haven't written out. So if we write to Page 1,
then Page 2 then Page 1 again the outgoing queue has 

copy of first page 1
copy of page 2
copy of new page 1

and then the readpage has to look at this queue to find the newest
version. The reason you cant discard the first page 1 is because if you
dropped the copy of the first page 1 & made you queue look like:

copy of page 2
copy of new page 1

and the power went off just after it had written out the page 2, the
device would be inconsistent.

NOTE - we are ignoring the cache on the IDE device and assuming
it does the correct thing even if it practice it does not.

Basically, blkmtd is trying to maintain a consistent device however it 
does use a lot of memory in doing so.

If you wanted to make the code really simple you could just do synchronous 
writes. I should really do a version that does this and benchmark it as
it was a long time ago when I first had it like this.

If you wanted a faster version but werent worried about the order writes
occured, you could just mark the pages dirty and then use vm pressure
in writepage() to do write outs. You'll still have to walk the dirty
list on sync() to make sure everything is written out however.

Another thing to bear in mind is that blkmtd reads and writes in whole
pages. If you just change one byte, it has to read the page that it is
in and write it out again - not good.

Anyway, hope some of this info helps

cheers
si

>Umm I'm thinking about this a bit more
>
>the problem is I think in 
>linux/drivers/mtd/devices/blkmtd.c
>
>I think that it is using the buffered device through
>the io buf. Thus even when you unmount you havent
>flushed the io buf of the underlying block device.
>Its my understanding the the linux block devices are
>not raw but read and right through the io buf.
>
>in blkmtd.c blkmtd_readpage and  write_queue_task it
>does a
> brw_kiovec which is in buffer.c at this point I'm
>getting a bit lost but it looks like the io is
>definatly buffered  with the writes occurring through
>a io buffer in a thread. The point is there not
>"direct"
>and not garunteed to occur until write_queue_task
>runs.
>
>
>I think blkmtd needs to use the new raw device api not
>the linux block devices i.e...
>
>block_dev_directIO in fs/block_dev.c umm Nope dangit
>that calls evenutually brw_kiovec.  So its got to be
>the write thread which should be synchronous on writes
>???
>I'm pretty sure thats the root of the problem a quick
>look showed the other mtd device writing directly so
>this is the "big difference" why is this in a thread ?
>
>
>I'm sure the Gad Hayisraeli is right about umount/sync
>working the question is why. 
>Answer  blkmtd writes in a thread and umount/sync
>wakes it up correctly. I don't think it should do
>that.
>
>Did I win a star : )
>
