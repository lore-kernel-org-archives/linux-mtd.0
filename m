Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBZBP-0003Ft-35
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 14:03:03 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Steven Scholz <steven.scholz@imc-berlin.de>
Date: Thu, 8 Apr 2004 14:58:56 +0200
References: <407547DF.1020404@imc-berlin.de> <40754B83.3020000@imc-berlin.de>
In-Reply-To: <40754B83.3020000@imc-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404081458.56018.tglx@linutronix.de>
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Changing the number of JFFS2 erasblocks?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 08 April 2004 14:54, Steven Scholz wrote:
> Steven Scholz wrote:
> > Hi there,
> >
> > I have 320KB of unused flash in our embedded systems. Now I want to make
> > use of them using an read/write filesystem by updating the kernel.
> >
> > Since it's flash I need some fs that's aware of the flash wearing
> > problem. So I guess that leaves only JFFS2.
> >
> > My problem is that the 5 erase blocks set by default will eat up the
> > whole 320KB and leaves no free space. And IIRC there's no way to pass
> > the number of eraseblocks during mount.
> >
> > Could I hardcode the number of eraseblocks to 1 in my new (but still old
> > 2.4.20) kernel? Where is it defined?
> > And what happens to my root fs which is JFFS2 when I change that?
>
> Is it enough and ok to just change the
>
> /* Number of free blocks there must be before we... */
> #define JFFS2_RESERVED_BLOCKS_BASE 3

You can do this, but it will break and it will break your root jffs2 too, as 
there is no way to have this per partition. This all is related to garbage 
collection and the neccecarity to have spare blocks for writing / deleting 
/modifying files. In a read only fs this would not hurt.

320K is not really useful for a filesystem IMHO. 
What do you want to do with it ?

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
