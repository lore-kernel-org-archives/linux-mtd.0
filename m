Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkRqV-0005j4-V8
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 14:17:41 -0400
Date: Tue, 13 Jul 2004 14:17:16 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Dan Post <djp.mtd@onemyth.net>
In-Reply-To: <20040713173359.M64485@onemyth.net>
Message-ID: <Pine.LNX.4.44.0407131344370.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, "Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jul 2004, Dan Post wrote:

> On Tue, 13 Jul 2004 12:52:13 -0400 (EDT), Nicolas Pitre wrote
> > On Tue, 13 Jul 2004, Dan Post wrote:
> > > [L18 / hardware partitions]
> > 
> > I committed support for that a while ago already.  SMP and 
> > preemption safe too.  Anything you think might be missing (besides 
> > the crude probing code that certainly could benefit from more work)?
> 
> Ahhh, I thought you reversed that :)  Some must have slipped by.  David, if
> you're listening, I miss your lovely cvsweb interface... any word on when that
> will be back up?

I did reverse the first one:

|revision 1.142
|date: 2004/06/08 21:26:21;  author: nico;  state: Exp;  lines: +130 -25
|Support for the multi hw partitions of the Intel L18 flash chips.
|The non-partitioned cases should behave just like before.
|However I'd like for someone else to look at the added logic for the
|partitioned config in case I might have overlooked something.
|
|revision 1.143
|date: 2004/06/09 18:35:51;  author: nico;  state: Exp;  lines: +62 -195
|No, I'm nuts.  My curent approach for L18 support is getting more
|and more messy as I consider all the details that were still missing
|and needed extra mods here and there.  When I can't stand my own code
|anymore that's a sign that the whole thing should be scrapped.  And
|this commit is exactly that.  Stay tuned for an alternate approach.

And eventually:

|revision 1.145
|date: 2004/06/10 20:54:55;  author: nico;  state: Exp;  lines: +161 -2
|Second attempt at supporting the multipartition L18 Intel flash chips.
|Again, the non-partitioned case should not have its logic altered so this
|is not supposed to break existing users.  The partition support code could
|benefit from extra review though.

... plus a few subsequent revisions fixing  a couple glitches here
and there.


Nicolas
