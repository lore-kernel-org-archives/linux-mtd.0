Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fef8-0004J5-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 16:24:30 +0100
Date: Fri, 21 Jul 2000 17:15:29 +0100 (BST)
From: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
To: David Vrabel <dvrabel@arcom.co.uk>
cc: mtd@infradead.org
Subject: Re: Intel Extended Command set in 8x mode
In-Reply-To: <39785017.1C127BAC@arcom.co.uk>
Message-ID: <Pine.LNX.4.21.0007211711440.22633-100000@alpha1.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 21 Jul 2000, David Vrabel wrote:

> Hi,
> 
> I have a board with an Intel StrataFlash 28F640 on it.  Having written a
> map driver the CFI probe code detects the chip.  However it appears that
> the Intel Extended Command Set code is only for chips in 16x mode not 8x
> mode which this chip is in.  Is this the case?  If so how can I get it
> to work?  Do I need to write a whole new thing like cfi_cmdset_0001.c
> for 8x mode?

You need to provide the 2_by_8 versions of the access functions. It
doesn't really need to be a separate file.

> Also,  JFFS won't compile.  I'm using kernel 2.2.16 and the
> put-module-symbol patch has been applied and I'm building it outside the
> kernel tree.

-ENOTENOUGHINFO

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
