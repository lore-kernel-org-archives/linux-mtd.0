Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQcMc-0000Ne-GS
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 07:23:53 +0000
Subject: RE: UBIFS Question
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Laurent ." <sid6582@msn.com>
In-Reply-To: <SNT121-W599BA236D8F485CFD021DB2230@phx.gbl>
References: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
	<1247324158.20721.629.camel@localhost.localdomain>
	<SNT121-W599BA236D8F485CFD021DB2230@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Jul 2009 10:22:24 +0300
Message-Id: <1247556144.3828.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-07-13 at 23:11 -0700, Laurent . wrote: 
> For now, I am only going to use my flasher in factory, when the flash is blank,
> so I don't have to deal with erase counters.
> However, your article will be useful when I will have to code
> a firmware upgrader :-)

Ok.

> Related to the BBT and MTD in general, do I have to reserve a few blocks
> outside the partitions, in case of one of the mirrored bbt goes bad ?
> What does MTD do if it sees it could not update one of the two blocks ?
> Does it grab a fresh block outside the partitions ? or can it pick a
> block from anywhere (since that block won't be mark as 'good' anymore
> anyways, it should not mess up with the partition) ?

I'm not sure. You need to dig MTD code for this. I personally never used
BBT. My guess is that if BBT is corrupted, MTD would fall-back to the
scanning scheme. But this is just a guess.

So if you explored the sources and then provided us a good FAQ entry,
this would nice.

> However, I can assume that when the file system is going to be written to,
> it is very unlikely that the user will power off the unit right away.
> Then, I presume that I should be fine since I am going to use a
> rather short (5 sec) dirty timeout ?

It does not really matter. UBIFS has the journal. The data is written
to the journal first, and when the journal is full, the it is committed.
It is also committed when you unmount cleanly.

When mounting, UBIFS has to replay the journal, which means it has to
scan it, and may be do some recovery. It takes time.

Committed journal does not need to be scanned, because it is empty.

The dirty data in the memory caches does not matter. When you have
power cut you just loose it forever. It does not matter that you do
not cut power just after writing.

Let me put things other way. Consider what happens to the data when you
write.

1. You write to file foo with 'write()'.
2. The date is put to the page cache and 'write()' returns. If you cut
   power at this point, you will simply loose all your cahnges.
3. Timeout. The dirty data from the page cache is written to UBIFS.
   UBIFS puts the data to the journal. Some of it, though, still sits in
   the write-buffer. If you cut power now you loose the write-buffer
   contents.
4. Timeout. Data from the write-buffer is flushed to the journal.
5. And so on, the journal becomes full, commit operation commits it and
   the journal becomes empty.
6. And so on.

If you cut power at steps 1-4, next time you mount UBIFS replays the
journal, which makes mount time longer. If you cut power after it is
committed (step 5), then when you mount next time, UBIFS does not have
much to scan, because the journal is empty.

IOW, the mount time depends on how full is the journal. And BTW, you may
make it smaller to lessen the maximum mount time. There are mkfs.ubifs
options for this.

> From what you wrote about the sync, I should be able to write my code so
> that I will greatly minimize the risk of power-off while the file system 
> s still "dirty" and there are still stuff to commit.
> So, just to be sure, if the file system is dirty, and the time out occur and
> all data are commited, it is safe to power off the unit and
> next mount will be fast, correct ?

The data is written back by timeout. It is written to the journal. But
it does not mean the journal is committed. If you want to make sure
the journal is committed, you may call 'sync()'. It writes back
everything plus commits the journal.

> > Hmm, which version of mkfs.ubifs you use? I though the latest version
> > would create an image with a reserve for the root. Try
> > "mkfs.ubifs --version" please.
> 
> Version 1.3

Hmm, I'll look at this.

> > Depends of the system. I'd recommend something like 5 seconds
> > for embedded systems.
> 
> OK. I presume that if there is nothing new "to commit",
> there is only very small overhead introduced every 5 seconds, correct ?

s/commit/write-back/. These are different things. Write-back is about
writing dirty data from RAM to storage. It is a generic Linux thing.
It works the same way for ext3 + disks, and ubifs + flash.

The commit and the journal are UBIFS implementation details. In UBIFS
everything goes first to the journal, than a mechanism called commit
empties the journal. The journal has to be scanned. The committed
stuff - not.

So, if you have no dirty data, then every 5 sec. the background thread
will wake up, find there is nothing to do, and go sleep. The only
side effect of this is that it'll eat your battery power :-)

But you may also teach UBIFS background thread to start commit in
background by timeout, if nothing is happening for some time. Might
be a good idea. It is about adding a timer.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
