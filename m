Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zLDi-0006dE-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 17:29:19 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, ajlennon@arcom.co.uk
Subject: Re: CPU caching of flash regions.
References: <m38zk07wtz.fsf@DLT.linuxnetworx.com> <27217.989849725@redhat.com> <4987.989857065@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 14 May 2001 10:32:47 -0600
In-Reply-To: David Woodhouse's message of "Mon, 14 May 2001 17:17:45 +0100"
Message-ID: <m3vgn36gcw.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> ebiederman@lnxi.com said:
> >  What kind of scenario are we talking about?  Do the pages get read
> > multiple times?  Of is it just that that copy_from needs to be more
> > highly optimized like memcpy?  I suspect that before the whole
> > interface changes you should experiment and see what really needs to
> > be done.
> 
> This is during the initial mount of JFFS2. Nothing should be read twice - 
> but we should at least be able to fill cache lines and do burst reads from 
> the flash chips, shouldn't we?

Definentily.  To date I've only had a real hard look at the write
case.  So I can't answer off the top of my head what needs to happen.
 
> > But I really think you should be able to get it working faster simply
> > by optimizing the copy_from routine.
> 
> Most of the copy_from routines use memcpy_fromio(), which on i386 is just 
> a memcpy(). It ought to be fairly close to optimal.

O.k. So that shouldn't be an issue if the kernel is properly
optimized.

> Actually, the board used for the offending profile is a board with paged 
> access to the flash, so it's slightly slower than some others - but the 
> overhead shouldn't be too high. And the cache benefit would be more limited. 

First.  What kind of chip is being used?  What bus is it on? And how
        fast is it?
Second. What kind of processor, and what kind of chipset are being used?

Getting bandwidth numbers out of the memcpy would be a useful
debugging technique.  I really suspect the overhead is in the chip
itself.  Flash chips are not know for their speed. 

If the chip is out on the ISA bus unless you set up approriate
decoders for it, the chip PCI->ISA bridge will be doing subtractive 
decode which will slow you down.  

If we could start with some theoretical bandwidth numbers for
the chip, and compare that to what memcpy_fromio is giving we can see
how much room their is for optimization.

Eric
