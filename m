Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bn6o-0005yn-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 18:29:22 +0000
Date: Fri, 15 Feb 2002 19:40:33 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Robert Kaiser <rob@sysgo.de>, linux-mtd@lists.infradead.org
Subject: Re: MTD concat layer
Message-ID: <20020215194033.B10201@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.21.0202151806180.9629-100000@dagobert.svc.sysgo.de> <30752.1013796129@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30752.1013796129@redhat.com>; from dwmw2@infradead.org on Fri, Feb 15, 2002 at 06:02:09PM +0000
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

> >  Hmm, I agreed with you about this before I actually attempted coding
> > it this way, but the code turned out to be a mess. IMHO, it is _much_
> > cleaner as a seperate layer. What would be the advantage of merging it
> > into the partition code ?
> 
> Fewer wrapper layers to go through. Look at the part_read() call I 
> implemented - is that really so bad for the case where people don't have 
> multiple 'sections' in each partition?

Are fewer wrapper layers really an advantage? They don't improve
maintainability or correctness, nor do they give new features.
An additional wrapper only needs one additional function call, so
execution time should not degrade much. But it will actually improve,
whenever you don't need the additional layer.

> > - significant effort, specifically since the current partitioning
> >   code is scheduled for replacement by Jörn's code, so I'd have to
> >   do it twice. 
> 
> Jörn's code needs to provide this functionality to be merged - making sure 
> there's no regression is part of the work necessary for merging the new 
> stuff, and wouldn't necessarily fall to you.

Ack.
Apart from that, it is often quite a good idea to write the same code
twice. First implementations usually suck, especially mine.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
