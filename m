Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYy05-0007cX-O2
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 04:16:39 +0100
Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYy03-0002BX-57
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 23:16:36 -0400
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1116226208.31694.26.camel@server11>
	<428899DA.3040507@netwinder.org> <1116293182.31694.47.camel@server11>
	<428BC09E.7070307@netwinder.org> <1116467146.18096.45.camel@server11>
	<428C7CCF.50606@netwinder.org> <1116556811.18096.90.camel@server11>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 19 May 2005 21:16:32 -0600
In-Reply-To: <1116556811.18096.90.camel@server11>
Message-ID: <m31x8260z3.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
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

Munira Ahmed <munira.ahmed@radixs.com> writes:

> Hi Ralph
> 
> The datasheet you are referring to is the right one and S29WSxxxN is
> using JEDEC 42.4 command set standard.
> 
> I am not sure which JEDEC standard is impelmented by jedec_prob.c.
> 
> Further if a separate driver is provided on AMD's website it must
> significantly be different otherwise they could simply have mentioned
> about the one in jedec_probe.c

jedec_probe is not a ``driver'' it is a method of identify the kind
of device you have.  Like a pci bus scan just a little less reliable.
Unless something is very strange it is almost certain either jedec_probe
or cfi_probe will be able to recognize the id on your part, and direct
the mtd code to the appropriate driver.  Which is almost certainly
cfi_cmdset_0002.c.  If the command set really is different or provides
significant new features writing a new chip driver may be in order.

> I believe that S29WSxxxN's MirrirBit technology provides many more
> security features as yet not available in other flash technologies.

Possibly.  Although I don't quite see how more silicon to audit translates
into more security.  In any event audit the code I have mentioned and see
if it appears to be doing the correct thing for your chip.  

Eric
