Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IoEZ-0007YH-00
	for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2001 10:18:39 +0100
Date: Sat, 7 Jul 2001 11:25:41 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
cc: jffs-dev@axis.com, MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: On the "safe filesystem" and write() topic
In-Reply-To: <5.1.0.14.0.20010706081855.00a676b0@mail.spewey.com>
Message-ID: <Pine.LNX.4.21.0107071113490.18935-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 6 Jul 2001, Vipin Malik wrote:
> >latency; after all you cannot both have synchronous writes, compression
> >and expecting the application to not be blocked..
> 
> HeHe, well, maybe the fs can (will or may?) block, but in all realistic 
> situations it's unacceptable for a real world embedded app to block for 
> multiple seconds while the fs is "busy". Where does the app store any data 

You might not like it but you cannot have it any other way :) 

Fact: flash chip sectors takes long to erase (1-2 seconds)

Fact: you need to erase to make room for new data

Hence, if you need the app to do synchronous writing, it will need to
wait.

> Hmm, I was under the impression that lib fprintf, fread, fwrite etc. all 
> work with some delimiter, usually '\n' and specially in the case of 

No, but now that I think about it they are not synchronous either (since
they buffer and return).

> >problem. In a "run time" phase (flash is almost all dirty, space exist and
> >writes are coming in) there should never need to be more latency that what
> >it takes to GC the same amount of space as you want to write.
> 
> When the rubber meets the road, implementation problems and theoretical 
> problems are indistinguishable :)
> The reality is that JFFS2 can block for 10's of seconds on a reasonable 
> powerful processor (a 133MHz 486).

Yes but that might BE the time it takes to make room for the data you want
to write..

> time a task updating variables on the FS will block. The question is: How 
> long a block is acceptable? IMHO, anything more than a few hundred ms will 
> be unacceptable to a reasonable percentage of embedded applications. I know 

Then you can't use flash chips in your embedded application :)

> > > caching layer that will allow the transaction log to be put on *another*
> > > non-volatile medium if such is available in your system. The big advantage
> >
> >Why would this be necessary ?
> 
> To provide for 0 latency writes for tasks updating data values, when the 
> underlying fs is blocked and cannot accept any more writes for another 
> "few" (at the moment >40) seconds.

So what happens when that gets full and need to be erased ? All you'd do
is interleave the writes and postpone the problem a bit. If you mean that
the transactional log will "never" get full and require erasing, then yes,
that would work but I doubt the "never" constraint :) 

Some flash chip configurations might allow you to erase one sector while
writing to another; this is transiently good if you only write one sector
worth of information during the time it takes to erase the other
sector. As soon as you go over that you hit the latency again.

/BW
