Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BvABf-0004py-Fa
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2004 03:39:48 -0400
To: linux-mtd@lists.infradead.org,  David Woodhouse <dwmw2@infradead.org>,
	tharbaugh@lnxi.com
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com> <1089729938.8696.115.camel@tubarao>
	<m3acy4j6dn.fsf@maxwell.lnxi.com> <1089732108.8696.127.camel@tubarao>
	<m3y8lndhho.fsf@maxwell.lnxi.com> <m3658rcfcm.fsf@maxwell.lnxi.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Aug 2004 01:39:44 -0600
In-Reply-To: <m3658rcfcm.fsf@maxwell.lnxi.com>
Message-ID: <m3vffo4xfj.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: 
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ebiederman@lnxi.com (Eric W. Biederman) writes:

> ebiederman@lnxi.com (Eric W. Biederman) writes:
> 
> > Looking at where we are Dave has just reworked the code for handling multiple
> > word sizes for reads and writes, and things are just starting to settle out.
> > And since he is going to be gone he will be sending these changes to Linus
> > later this week.

Ok I am making a little headway every time I have to go into and touch
the mtd code.  Eventually things may look much cleaner.
 
> Ok. Where I am at.  
> 

> It still special cases Intel firmware hubs but that is disabled
> when it is not dealing with them.  Both cases have been tested
> both in 32bit and 64bit mode.

ichxrom now no longer special cases firmware hub parts,
and the firmware hub lock/unlock routines now test to make
certain you are not going to underflow your map driver, before
they run.

> However it is still on my TODO list so I will push it forward in a
> little bit.

Looking into the code I found a cfi_fixup routine in cfi_util.
I modified it to take a mtd_info pointer instead of map_info
and I have placed all of the command set generic mtd method
so they are initialized in cfi_fixup.

So for the short term it looks like simply improving the cfi_fixup
functions allows all of the special cases I know about to be
handled cleanup.

Beyond that I have synchronized the 2 generic map drivers I
maintain ichxrom and amd76xrom.   And their code is now almost
identical.  I now almost have a generic x86-rom-probe function.
I clearly have a case of the possible and awkward archived in
those to map drivers.  

My gut feel is that there is a lot of ways the code can be made
clear, simpler, possibly smaller and more reliable.  

But I don't quite have a handle on so I will let what I see sit and
take it's time.   Between my awkward cases and the suggesting of
moving more functions into cfi_util I can almost see starting places
but things get slippery when I look at the details so I have
found enough for now.

My checking comments are attached at the bottom since I felt
like I was about to repeat them.


- Move support firmware hub style lock and unlock into fhw_lock.h (from cfi_cmdset_0002)
- Move cfi_varsize_frob into cfi_util from cfi_cmdset_0001.c and cfi_cmdset_0002.c
- reduce gen_probe probe failuers to a debug level message
- Modify cfi_fixup to take a struct mtd_info instead of a struct map_info
  So that the fixup routines can modify the mtd functions.
- Modify cfi_cmdset_0001() to allocate and initialize the mtd structure
  before calling cfi_fixup.
- Modify cfi_cmdset_0002() to allocate and initialize the mtd structure
  before calling cfi_fixup.
- Refactor the hard coded fixups in cfi_cmdset_0001 and cfi_cmdset_0002
  so the improved cfi_fixup infrastructure.
- Rewrote amd76xrom and ichxrom.
  They now report their starting physical address in their name.
  They now both handle multiple bankwidth configurations
  They both can create multipe mtd devices.
  They both now assume the rom windows are properly opened by the BIOS
   or whatever runs previous to them.
  Their code is now synchromized so it is almost identical,
     and could be a starting point for a x86_rom_probe.


Good Night,
Eric
