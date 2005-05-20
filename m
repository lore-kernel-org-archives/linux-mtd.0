Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYySL-0007gy-Ln
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 04:45:50 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYySG-0002X3-Oo
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 23:45:47 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31x8260z3.fsf@maxwell.lnxi.com>
References: <1116226208.31694.26.camel@server11>
	<428899DA.3040507@netwinder.org> <1116293182.31694.47.camel@server11>
	<428BC09E.7070307@netwinder.org> <1116467146.18096.45.camel@server11>
	<428C7CCF.50606@netwinder.org> <1116556811.18096.90.camel@server11>
	<m31x8260z3.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Date: Fri, 20 May 2005 11:45:34 +0800
Message-Id: <1116560734.18096.108.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hang on

I am confused now

cfi_cmdset_0002.c implements CFI or a flash driver?

What I understand from is that

there is one cfi command set just to find out which chip is being used
and what driver to use.

The other one is the software command set to tell the flash what to
do.This command set would essentially constitute the driver.

earlier there used to be a JEDEC standard before CFI came in vogue. It
used to do the same thing which is now done by CFI albeit in some old
fashioned or may be in not so efficient way. there must be something
missing in there that's why it is getting out of use. jedec_probe.c 
if I am not wrong implements this standard which is almost obsolete.

Now this S29WSxxxN is CFI compliant and uses a software command set
called JEDEC 42.4 standard to instruct the flash. So  CFI in the kernel
should be able to identify that which chip is used. 

No which file in the kernel implements CFI?

how to tell this CFI to use a new driver?

which file if any in the kerenl implements JEDEC 42.2 command set to
instruct a flash?



Please clearify



On Thu, 2005-05-19 at 21:16 -0600, Eric W. Biederman wrote:
> Munira Ahmed <munira.ahmed@radixs.com> writes:
> 
> > Hi Ralph
> > 
> > The datasheet you are referring to is the right one and S29WSxxxN is
> > using JEDEC 42.4 command set standard.
> > 
> > I am not sure which JEDEC standard is impelmented by jedec_prob.c.
> > 
> > Further if a separate driver is provided on AMD's website it must
> > significantly be different otherwise they could simply have mentioned
> > about the one in jedec_probe.c
> 
> jedec_probe is not a ``driver'' it is a method of identify the kind
> of device you have.  Like a pci bus scan just a little less reliable.
> Unless something is very strange it is almost certain either jedec_probe
> or cfi_probe will be able to recognize the id on your part, and direct
> the mtd code to the appropriate driver.  Which is almost certainly
> cfi_cmdset_0002.c.  If the command set really is different or provides
> significant new features writing a new chip driver may be in order.
> 
> > I believe that S29WSxxxN's MirrirBit technology provides many more
> > security features as yet not available in other flash technologies.
> 
> Possibly.  Although I don't quite see how more silicon to audit translates
> into more security.  In any event audit the code I have mentioned and see
> if it appears to be doing the correct thing for your chip.  
> 
> Eric
> 
-- 
Munira Ahmed
