Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IrWW-0007kt-00
	for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2001 13:49:24 +0100
Message-Id: <5.1.0.14.0.20010707075247.00a67798@mail.spewey.com>
Date: Sat, 07 Jul 2001 08:06:40 -0500
To: Bjorn Wesen <bjorn.wesen@axis.com>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: On the "safe filesystem" and write() topic
Cc: jffs-dev@axis.com,MTD for Linux <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.21.0107071113490.18935-100000@godzilla.axis.se>
References: <5.1.0.14.0.20010706081855.00a676b0@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 11:25 AM 7/7/2001 +0200, Bjorn Wesen wrote:

> > HeHe, well, maybe the fs can (will or may?) block, but in all realistic
> > situations it's unacceptable for a real world embedded app to block for
> > multiple seconds while the fs is "busy". Where does the app store any data
>
>You might not like it but you cannot have it any other way :)
>
>Fact: flash chip sectors takes long to erase (1-2 seconds)
>
>Fact: you need to erase to make room for new data
>
>Hence, if you need the app to do synchronous writing, it will need to
>wait.
>
>
> > time a task updating variables on the FS will block. The question is: How
> > long a block is acceptable? IMHO, anything more than a few hundred ms will
> > be unacceptable to a reasonable percentage of embedded applications. I 
> know
>
>Then you can't use flash chips in your embedded application :)
>
> > > > caching layer that will allow the transaction log to be put on 
> *another*
> > > > non-volatile medium if such is available in your system. The big 
> advantage
> > >
> > >Why would this be necessary ?
> >
> > To provide for 0 latency writes for tasks updating data values, when the
> > underlying fs is blocked and cannot accept any more writes for another
> > "few" (at the moment >40) seconds.
>
>So what happens when that gets full and need to be erased ? All you'd do
>is interleave the writes and postpone the problem a bit. If you mean that
>the transactional log will "never" get full and require erasing, then yes,
>that would work but I doubt the "never" constraint :)

That's why if 0 latency writes are important to a design, they must put 
this cache on a 0-erase-latency non-volatile medium like a battery backed 
RAM or FRAM.
Then a simple equation will help one size it for one's particular need, namely:

C_KB = size_of_nonvolatile_cache_device_required;
t1 = max_block_time_of_flash_FS_sec;
t2 = time_to_xfer_C_KB_to_flash_FS_sec;
NEW_KB_PER_SEC = max_new_data_generating_rate_KB_per_sec;


C_KB = (t1+t2) * NEW_KB_PER_SEC;

That's what the 0 latency write, transaction protected, embedded database 
project on the dev list is for.

Vipin
