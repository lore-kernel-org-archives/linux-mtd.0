Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H0FD-0007Pv-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 09:39:19 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H0FB-0007Pl-00
	for mtd@infradead.org; Tue, 25 Jul 2000 09:39:19 +0100
Message-ID: <397D52D7.B0CC9270@arcom.co.uk>
Date: Tue, 25 Jul 2000 09:41:59 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Intel Extended Command set in 8x mode
References: <Pine.LNX.4.21.0007211711440.22633-100000@alpha1.cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> On Fri, 21 Jul 2000, David Vrabel wrote:
> >
> > I have a board with an Intel StrataFlash 28F640 on it.  Having written a
> > map driver the CFI probe code detects the chip.  However it appears that
> > the Intel Extended Command Set code is only for chips in 16x mode not 8x
> > mode which this chip is in.  Is this the case?  If so how can I get it
> > to work?  Do I need to write a whole new thing like cfi_cmdset_0001.c
> > for 8x mode?
> 
> You need to provide the 2_by_8 versions of the access functions. It
> doesn't really need to be a separate file.

2_by_8?  What is the first number supposed to mean?
 
David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
