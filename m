Received: from smtp-vbr3.xs4all.nl ([194.109.24.23])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8FX1-0000kK-A5
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 15:54:55 +0000
Message-ID: <4AFADE3B.3050406@aimvalley.nl>
Date: Wed, 11 Nov 2009 16:54:35 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
References: <4ACF3478.1060503@aimvalley.nl>	
	<1255269148.16942.95.camel@localhost>
	<4AD30069.8060101@aimvalley.nl>
	<1255510600.32489.130.camel@localhost>
In-Reply-To: <1255510600.32489.130.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> ok, will do that. I'll track commit_sem, io_mutex and ubifs_garbage_collect().
>> I'll report back.
>>
>> Btw. stackdump is the same (2 out of 2 times).
> 
> OK. I really do not have any idea off the top of my head now, sorry.
> Try to investigate this a beet deeper.
> 


I investigated this. It turn out it's some kind of race condition between the pdflush
deamon and other tasks (e.g. events). It has everything to do the the commit_sem
and io_mutex. It's not related to my preprogrammed UBIFS image (i've seen it also after
a big file was written to UBIFS and a sync was done "simultaneously") nor is it related
to ubifs_garbage_collect().

Here's what I did and how I conclude the above.

I logged (in memory) all commit_sem, io_mutex and ubifs_garbage_collect actions
and parse the results to human readable text afterwards.
"Req" means mutex/semaphore requested. If there's no "Req" the operation
has been done.


The race condition occurs for the below UBIFS pseaudo code (which is done by many
UBIFS functions):


  err = make_reservation () {
   down_read(&c->commit_sem)				/*** commit_sem, make_reservation, DOWN 1 ***/
   err = reserve_space(c, jhead, len) {
    ...
  again:
    mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);	/*** io_mutex, reserve_space, LOCK 1 ***/
    ...
    avail = c->leb_size - wbuf->offs - wbuf->used;
    if (wbuf->lnum != -1 && avail >= len)
     return 0;
   }
   if (!err)
  	return 0;
  }
  /* the journal head stays locked and later has to be unlocked using release_head() */
  if (err)
   goto out_free;
  ...
  err = write_head(c, BASEHD, dent, len, &lnum, &dent_offs, sync);
  if (err)
   goto out_release;
  ...
  release_head(c, BASEHD) {
   mutex_unlock(&c->jheads[jhead].wbuf.io_mutex);	/*** io_mutex, release_head, UNLOCK ***/
  }
  ...
  finish_reservation(c) {
   up_read(&c->commit_sem);				/*** commit_sem, finish_reservation, UP ***/
  }




Normally (for one "update" I guess) the logs shows:

TIME=0000.000, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
TIME=0000.000, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
TIME=0000.000, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
TIME=0000.000, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
TIME=0000.480, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
TIME=0000.480, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
TIME=0000.480, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
TIME=0000.480, M(t=0,xy=88)=commit_sem, finish_reservation, UP



when "another task" is also updating the log shows:

TIME=0304.252, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
TIME=0304.252, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
TIME=0304.252, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
TIME=0304.252, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
TIME=0304.292, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
TIME=0304.292, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1	<- 2nd DOWN !?
TIME=0304.292, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
TIME=0304.736, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
TIME=0304.736, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
TIME=0304.736, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
TIME=0304.736, M(t=0,xy=88)=commit_sem, finish_reservation, UP
TIME=0304.736, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
TIME=0304.736, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
TIME=0304.736, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
TIME=0304.736, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
TIME=0304.736, M(t=0,xy=88)=commit_sem, finish_reservation, UP

I really don't understand the commit_sem here. Is there a 2nd copy of commit_sem ?



the very first time pdflush interfers the pdflush error report shows
(for which there's also a log entry):

TIME=0021.644, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
TIME=0021.644, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1
TIME=0021.644, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1
TIME=0021.644, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1
TIME=0034.316, M(t=8,xy=06)=commit_sem, make_reservation, Req DOWN 1
TIME=0034.316, M(t=0,xy=06)=commit_sem, make_reservation, DOWN 1	<- 2nd DOWN !?
TIME=0034.316, M(t=9,xy=07)=io_mutex, reserve_space, Req LOCK 1		<- pdflush blocks here
TIME=0168.868, M(t=3,xy=00)=pdflush error report
TIME=0302.012, M(t=3,xy=00)=pdflush error report
TIME=0303.280, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
TIME=0303.280, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK		<- pdflush can continue
TIME=0303.280, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
TIME=0303.280, M(t=0,xy=88)=commit_sem, finish_reservation, UP
TIME=0303.284, M(t=1,xy=07)=io_mutex, reserve_space, LOCK 1		<- pdflush continues here
TIME=0303.284, M(t=9,xy=8a)=io_mutex, release_head, Req UNLOCK
TIME=0303.284, M(t=1,xy=8a)=io_mutex, release_head, UNLOCK
TIME=0303.284, M(t=8,xy=88)=commit_sem, finish_reservation, Req UP
TIME=0303.284, M(t=0,xy=88)=commit_sem, finish_reservation, UP



I must admit I dont't see the root cause. I don't understand why the commit_sem
doesn't seem to work. Nor do I understand why the "other task" needs to hold the
io_mutex for more than 280 seconds.

If you see the reason or have any idea please let me know, otherwise I'll
investigate this more thorough.

thanks,
Norbert.
