Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApC1g-0008Dj-BZ
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2004 19:52:32 +0000
To: Gary Thomas <gary@mlbassoc.com>
References: <40239C69.5040803@siemens.com> <1076076229.27984.182.camel@hermes>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 06 Feb 2004 12:55:48 -0700
In-Reply-To: <1076076229.27984.182.camel@hermes>
Message-ID: <m3znbwugmz.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: Steffen Rumler <Steffen.Rumler@siemens.com>
cc: linux-mtd@lists.infradead.org
cc: linuxppc embedded <linuxppc-embedded@lists.linuxppc.org>
Subject: Re: BUG in mtd/chips/cfi_cmdset_0002.c for 64bit width flashes
	(linuxppc_2_4_devel)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gary Thomas <gary@mlbassoc.com> writes:

> On Fri, 2004-02-06 at 06:53, Steffen Rumler wrote:
> > Hi,
> > 
> > We have found the following bug in mtd/chips/cfi_cmdset_0002.c
> > for 64bit bus width.
> > 
> > The routine do_write_oneword() uses the DQ6 algorithm in order
> > to detect the end of programming phase (see bitkeeper: linuxppc_2_4_devel)
> > 
> > 
> > oldstatus = cfi_read(map, adr);
> > status = cfi_read(map, adr);
> > 
> > while( (status & dq6) != (oldstatus & dq6) &&
> >          (status & dq5) != dq5 &&
> >          !time_after(jiffies, timeo) ) {
> > 
> >      if (need_resched()) {
> >          cfi_spin_unlock(chip->mutex);
> >          yield();
> >          cfi_spin_lock(chip->mutex);
> >      } else
> >          udelay(1);
> > 
> >      oldstatus = cfi_read( map, adr );
> >      status = cfi_read( map, adr );
> > }
> > 
> > There are two contiguous calls of cfi_read() to check for the DQ6 toggling.
> > 
> > But for 64bit one cfi_read() results in two flash accesses, one for
> > the upper 32bit and the other for lower 32bit. 

Possibly there are 2 accesses on the bus but not to a single
flash chip.  If there is a problem it is with your map
driver, not generating 64bit bus transactions. 

My dimm memory says you need to use the FPU to generate a 64bit
access on PPC.

> > In this way the DQ6 bits toggle
> > for the two accesses related to one cfi_read(). The first access will be
> > compared with the third and the second with the fourth.
> > The end detection is broken, the body of the while loop will never be
> executed.
> 
> > 
> > I suggest to switch to the alternative DQ7 algorithm.

I suggest you use an uptodate version of cfi_cmdset_0002 before
complaining.  The logic that looks at dq5 in that loop was removed a
long time ago.  Of course the last merge with 2.4.x may have
happened even longer ago.

Eric
