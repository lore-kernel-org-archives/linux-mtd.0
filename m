Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184M8x-0000mY-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 15:05:55 +0100
Date: Wed, 23 Oct 2002 16:35:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: rkaiser@sysgo.de
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023143547.GA2979@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <20021023102709.GA28181@jupiter> <20021023120734.GB31696@wohnheim.fh-wedel.de> <200210231355.g9NDt6s03055@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200210231355.g9NDt6s03055@dagobert.svc.sysgo.de>
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

Hello Robert,

we agree on most issues. I have only kept what might be worth a
discussion.

On Wed, 23 October 2002 16:01:35 +0200, Robert Kaiser wrote:
> >   to rewrite all the mapping drivers in <20 lines of code.
> 
> Agreed 98%

> > - Some drivers need to cut out a small range from the middle for the
> >   bootloader. They then concatenate the range before and after the
> >   bootloader into one virtual partition. Find a clean solution for
> >   this.
> 
> Hmm, I would have thought that mtdconcat.c does this nicely already? (Maybe 
> I'm biased since I'm the author of that module, but I'm open to discussion)

I would have to actually take a look, but that should do it. (1)

> > When physmap.c or any variant is generic enough to do all this, it
> > needs two or three interfaces:
> > - Command line, a lot of people should need that.
> 
> why not use what is there already (cmdline.c) ?

Again, see (1)
We have two seperate issues: Creating devices and partitioning those
devices. This is interchangeable in most cases, but not in all.
That was the whole point about my partitioning rewrite.

If I got you right, cmdline.c cares about partitioning a device. But I
worked on hardware that needed to create three devices on flash and
partition two of those. Would that still work easily?

> > - A c api for the "got a d-box, hit this options" type files.
> 
> Not sure what you mean by "c api", but generally, MTD is already a nightmare 
> to configure for a non-guru, unless there is a specific mapping driver for 
> your hardware that you can just click. So this ability to just tickbox your 
> platform should definitely stay (or even be extended) when a new concept gets 
> introduced.

I mean the infrastructure to rewrite 98% of the mapping drivers in <20
lines.

The user should browse through the configuration, see d-box or
whatever, say yes *once* and be happy. That is the best interface next
to autosensing, no doubt.

(1)
About a year ago, I forked David's tree and rewrote the partitioning.
The changes were quite intrusive, but the result looked good to me.
Since then, I wanted to merge the changes back into David's tree. It
never happened, blame goes to both of us.
Sad result is that I continued developing my tree, you all continued
developing David's tree and neither has looked at the other.
Currently, two or three independent groups use my tree, most use
David's tree and noone cares about the situation.
Again, blame everyone. David never looked at my code. I never put it
into nice sizeable pieces for him. And everyone else either dumped
David's tree or ignored mine.

So the result is that I am pretty unaware about current cvs head.
And by now, I don't even care anymore. David is a good developer, but
his problems and my problems don't give a very cooperative mixture.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
