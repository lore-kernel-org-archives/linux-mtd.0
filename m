Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8rPH-0006EU-Ul
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 08:21:29 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4AFADE3B.3050406@aimvalley.nl>
References: <4ACF3478.1060503@aimvalley.nl>
	<1255269148.16942.95.camel@localhost> <4AD30069.8060101@aimvalley.nl>
	<1255510600.32489.130.camel@localhost> <4AFADE3B.3050406@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2009 10:20:55 +0200
Message-Id: <1258100455.21596.1187.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2009-11-11 at 16:54 +0100, Norbert van Bolhuis wrote:
> >> ok, will do that. I'll track commit_sem, io_mutex and ubifs_garbage_collect().
> >> I'll report back.
> >>
> >> Btw. stackdump is the same (2 out of 2 times).
> > 
> > OK. I really do not have any idea off the top of my head now, sorry.
> > Try to investigate this a beet deeper.
> > 
> 
> 
> I investigated this. It turn out it's some kind of race condition between the pdflush
> deamon and other tasks (e.g. events). It has everything to do the the commit_sem
> and io_mutex. It's not related to my preprogrammed UBIFS image (i've seen it also after
> a big file was written to UBIFS and a sync was done "simultaneously") nor is it related
> to ubifs_garbage_collect().
> 
> Here's what I did and how I conclude the above.
> 
> I logged (in memory) all commit_sem, io_mutex and ubifs_garbage_collect actions
> and parse the results to human readable text afterwards.
> "Req" means mutex/semaphore requested. If there's no "Req" the operation
> has been done.
> 
> 
> The race condition occurs for the below UBIFS pseaudo code (which is done by many
> UBIFS functions):
> 
> 
>   err = make_reservation () {
>    down_read(&c->commit_sem)				/*** commit_sem, make_reservation, DOWN 1 ***/
>    err = reserve_space(c, jhead, len) {
>     ...
>   again:
>     mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);	/*** io_mutex, reserve_space, LOCK 1 ***/
>     ...
>     avail = c->leb_size - wbuf->offs - wbuf->used;
>     if (wbuf->lnum != -1 && avail >= len)
>      return 0;
>    }
>    if (!err)
>   	return 0;
>   }
>   /* the journal head stays locked and later has to be unlocked using release_head() */
>   if (err)
>    goto out_free;
>   ...
>   err = write_head(c, BASEHD, dent, len, &lnum, &dent_offs, sync);
>   if (err)
>    goto out_release;
>   ...
>   release_head(c, BASEHD) {
>    mutex_unlock(&c->jheads[jhead].wbuf.io_mutex);	/*** io_mutex, release_head, UNLOCK ***/
>   }
>   ...
>   finish_reservation(c) {
>    up_read(&c->commit_sem);				/*** commit_sem, finish_reservation, UP ***/
>   }
> 
> 
> 
> 
> Normally (for one "update" I guess) the logs shows:
> 
> TIME=0000.000, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
> TIME=0000.000, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
> TIME=0000.000, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
> TIME=0000.000, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
> TIME=0000.480, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
> TIME=0000.480, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
> TIME=0000.480, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
> TIME=0000.480, M(t=0,xy=88)=commit_sem, finish_reservation, UP

What are M(t= ,xy= ) ?
Would be very useful to save process ID (current()->pid) as well.

> 
> 
> 
> when "another task" is also updating the log shows:
> 
> TIME=0304.252, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
> TIME=0304.252, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
> TIME=0304.252, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
> TIME=0304.252, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
> TIME=0304.292, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
> TIME=0304.292, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1	<- 2nd DOWN !?

Right, this is RW semaphore, and in journal reservation we lock it for
reading (down_read()), and there may be many readers at a time.

The only place this semaphore is locked for writing is the commit code,
where we prohibit all journal accesses for the first phase of commit.
May be there is some interference with down_write(commit_sem) ?

> TIME=0304.292, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
> TIME=0304.736, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
> TIME=0304.736, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
> TIME=0304.736, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
> TIME=0304.736, M(t=0,xy=88)=commit_sem, finish_reservation, UP
> TIME=0304.736, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
> TIME=0304.736, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
> TIME=0304.736, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
> TIME=0304.736, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
> TIME=0304.736, M(t=0,xy=88)=commit_sem, finish_reservation, UP
> 
> I really don't understand the commit_sem here. Is there a 2nd copy of commit_sem ?

See above.

> the very first time pdflush interfers the pdflush error report shows
> (for which there's also a log entry):
> 
> TIME=0021.644, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
> TIME=0021.644, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
> TIME=0021.644, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
> TIME=0021.644, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
> TIME=0034.316, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
> TIME=0034.316, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1	<- 2nd DOWN !?
> TIME=0034.316, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1		<- pdflush blocks here
> TIME=0168.868, M(t=3,xy=00)=pdflush error report
> TIME=0302.012, M(t=3,xy=00)=pdflush error report

Please, save PIDs as well, it is very useful. So now we need to figure
out why it cannot take the mutex fro so long time. You should look
deeper to the first task, which took the mutex and blocks pdflush. What
that task is doing. For sure it writes something to the flash, which
goes down to UBI, then to MTD, then to your flash driver. And probably
somewhere there the task is blocked for long time?

> TIME=0303.280, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
> TIME=0303.280, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK		<- pdflush can continue
> TIME=0303.280, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
> TIME=0303.280, M(t=0,xy=88)=commit_sem, finish_reservation, UP
> TIME=0303.284, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1		<- pdflush continues here
> TIME=0303.284, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
> TIME=0303.284, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
> TIME=0303.284, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
> TIME=0303.284, M(t=0,xy=88)=commit_sem, finish_reservation, UP
> 
> 
> 
> I must admit I dont't see the root cause. I don't understand why the commit_sem
> doesn't seem to work.

Because it is R/W semaphore. In your investigations you looked at we
locks: the commit_sem (which is an R/W sem.) and io_mutex (which is a
normal mutex). Let's discuss what they protect.

1. commit_sem serializes all FS writers vs. the commit process. While
UBIFS has space in journals, tasks can just write. But once the journal
is full, we have to commit. When we commit, we need to stop all writers
for a short period of time (not for whole commit time). Thus, what we do
is that all journal writers take the commit_sem for reading, and the
commit function takes it for writing.

2. In UBIFS wa have several journal heads. We put different data to
different heads. And the io_mutex is per-head mutex. 2 tasks are allowed
to write at the same time to different heads. But if they want to write
to the same head, they are serialized by the io_mutex.

>  Nor do I understand why the "other task" needs to hold the
> io_mutex for more than 280 seconds.

You need to look deeper to that task. See where it goes next, and how it
spends some that time.

It might happen to be that by the time the other task releases io_mutex,
there is a third task which takes it, and by the time the third task
releases the mutex, there is a fourth task which takes it. So pdflush
waits very long. IOW, I think mutexes are not very fair.

However, I think that most likely the other task is just blocked for
long time somewhere in UBI or MTD level, for some reasons.

> If you see the reason or have any idea please let me know, otherwise I'll
> investigate this more thorough.

Try to see deeper at what the other task is doing, and store process ids
as well.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
