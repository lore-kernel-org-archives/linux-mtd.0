Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ2NH-0008UM-Uz
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 08:56:54 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ2NB-0004yC-Ky
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 03:56:50 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3wtpu330l.fsf@maxwell.lnxi.com>
References: <1116226208.31694.26.camel@server11>
	<428899DA.3040507@netwinder.org> <1116293182.31694.47.camel@server11>
	<428BC09E.7070307@netwinder.org> <1116467146.18096.45.camel@server11>
	<428C7CCF.50606@netwinder.org> <1116556811.18096.90.camel@server11>
	<m31x8260z3.fsf@maxwell.lnxi.com> <1116560734.18096.108.camel@server11>
	<m3wtpu330l.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Date: Fri, 20 May 2005 15:56:39 +0800
Message-Id: <1116575799.18096.123.camel@server11>
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

which module in the kernel calls cfi_probe driver to get the chip
details.

when I do probe with a device with intel flash using

mtdptr = do_map_probe("cfi_probe", mapptr);



this is what I get

genprobe_new_chip called with unsupported buswidth 0
CFI: Found no <NULL> device at location zero
 

and mtdptr is returned NULL 

what does it signify?

?



On Thu, 2005-05-19 at 23:00 -0600, Eric W. Biederman wrote:
> Munira Ahmed <munira.ahmed@radixs.com> writes:
> 
> > Hang on
> > 
> > I am confused now
> > 
> > cfi_cmdset_0002.c implements CFI or a flash driver?
> 
> Breaking things down a little more, in the mtd stack there are 3 kinds of drivers.
> map drivers that describe how to talk to a given flash chip.
> probe drivers that identify what kind of chip you have.
> chip drivers that know how to speak a command set and let you flash your chip.
> 
> > What I understand from is that
> > 
> > there is one cfi command set just to find out which chip is being used
> > and what driver to use.
> 
> There is a probe driver.  Not a really a command set, but you have
> the idea.
> 
> There are two JEDEC standard probe methods the original
> which simply gives vendor/device id bytes.  And the CFI
> probe which gives you a little more and means you don't need
> a table of devices.
>  
> > The other one is the software command set to tell the flash what to
> > do.This command set would essentially constitute the driver.
> 
> Yes.
>  
> > earlier there used to be a JEDEC standard before CFI came in vogue. It
> > used to do the same thing which is now done by CFI albeit in some old
> > fashioned or may be in not so efficient way. there must be something
> > missing in there that's why it is getting out of use. jedec_probe.c 
> > if I am not wrong implements this standard which is almost obsolete.
> 
> The CFI standard seems to be a reaction to the observation that the largest
> part of a flash driver that supports multiple chips is the lookup table
> by vendor/device that reports the commands set and chip size.  After
> that everything tends to use either the intel (cfi_cmdset_0001) or the 
> amd (cfi_cmdset_0002) command set.
> 
> It really depends on which market segment you are in which probe methods
> are supported.  In addition most CFI chips also support the older style
> jedec probe as well.
> 
> > Now this S29WSxxxN is CFI compliant and uses a software command set
> > called JEDEC 42.4 standard to instruct the flash. So  CFI in the kernel
> > should be able to identify that which chip is used. 
> > 
> > No which file in the kernel implements CFI?
> 
> cfi_probe.
> 
> > how to tell this CFI to use a new driver?
> 
> cfi_probe should run on the chip find it and then complain that
> it can't find some property.  So as long as you have an appropriate
> map driver that calls cfi_probe you should be 90% of the way there
> and the error messages should be able to guide you in.
>  
> > which file if any in the kerenl implements JEDEC 42.2 command set to
> > instruct a flash?
> 
> JEDEC 42.2 is not a clear reference to me, but I do know that JEDEC has
> a standard command set that is very similar to what AMD uses.  CFI
> enumerates several known commands sets.  Which enumeration value does
> it describe your command set with.  My hunch is that the CFI probe
> data returns the value 0002.    Once you know which value the
> CFI probe data returns then we can talk about adding code.
> 
> Eric
> 
-- 
Munira Ahmed
Senior Embedded Specialist

Radixs Pte Ltd
Email:munira.ahmed@radixs.com


Main: +65 6335 8600
Fax: +65 6335 8601
URL: www.radixs.com 

1 Temasek Avenue, #21-01, Millenia Tower, Singapore 039192

Disclaimer Notice: This email, its content and any files transmitted
with it are intended solely for the addressee(s) and may be confidential
and privileged. Any unauthorised disclosure or use or dissemination of
the information contained herein, either whole or partial, is
prohibited. Radixs Pte Ltd (Radixs) cannot accept liability for any
statements made which are clearly the sender's own and not expressly
made on behalf of Radixs or one of its agents. If you have received this
message in error, please notify the sender immediately, and delete this
email from your computer system. Radixs has taken reasonable precaution
to ensure no viruses are present in this email, however Radixs does not
accept responsibility for any loss or damage arising from the use of
this email or attachments.

Co. Reg. 200104892Z
