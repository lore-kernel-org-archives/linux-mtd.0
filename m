Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161okr-0003I0-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 12:58:01 +0000
Date: Thu, 8 Nov 2001 14:06:54 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: journaling
Message-ID: <20011108140654.B7695@wohnheim.fh-wedel.de>
References: <20011107133747.A5963@wohnheim.fh-wedel.de> <Pine.LNX.4.21.0111080259580.29588-100000@godzilla.axis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.21.0111080259580.29588-100000@godzilla.axis.se>; from bjorn.wesen@axis.com on Thu, Nov 08, 2001 at 03:12:26AM +0100
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

Hi!

> On the other hand, a "normal" filesystem does not optimize the read speed
> in any other way either. I don't see how you can optimize in another way
> than putting data which belong together logically together
> physically.. the LFS can do this even better than traditional systems
> because data is moved naturally during the GC process and can be
> reorganized.

Traditionally, read and write optimization means seek minimization, as
traditional FSs are based on hard drives.
Thus read optimization means putting data that will be read together -
large files or all the files in a directory - in one or few spots.
Without GC-optimizations or a defragmentation tool of some sort, LFSs
are very bad at this. And these optimizations are much more
complicated than the  ones for blocklist-filesystems, like ext and
friends.
Making an FS like ext journaling is done simply to get rid of the
fscks on boot time and should only reduce write and mount performance
to a small degree. 

> The main problem with logstructured filesystems is that it's difficult to
> scalably _locate_ the data you want to read. That's why JFFS1,2 have long
> mount-times. Checkpointing the in-core representation would help a bit,
> but it would still not scale well with filesystem size.

Definitely true and to some degree independent of the background
medium. The only optimizations I can think of eat up either RAM or
disk/flash. Not using optimizations eats up cpu an io time. Tough
choice.

> Some sort of hierarchical checkpointing could perhaps work.. I haven't
> read very much about that yet but it's a natural issue for JFFS3 :)

Sounds interesting. Can you quickly describe this one?

> The second problem with LFS is the GC process. After some time, you
> reach a state where the log _is_ full and every write has to force a part
> of the GC. There is a lot of tweaking which can be done in that area. As
> you note below it solves fragmentation as a byproduct, but getting good
> performance and low latency is difficult.

Getting low latency should be nearly impossible in the jffs case. The
write will always have to wait until a complete delete block is
finished. This can take several seconds, depending on your flash.
Performance is achieved by lazyness, usually. Do the least necessary,
maybe a little more for future optimization, but not much. This links
the issue to the location performance issue, as you have to figure out
what data to collect as garbage and what to keep.

Jörn

-- 
Live a good, honorable life. Then when you
get older and think back, you'll be able to enjoy
it a second time.
