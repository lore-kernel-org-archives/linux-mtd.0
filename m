Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from zen.stanford.edu ([171.65.16.116])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112H1m-0006IC-00
	for mtd@infradead.org; Thu, 8 Jul 1999 17:28:02 +0100
Message-ID: <19990708092758.40730@zen.stanford.edu>
Date: Thu, 8 Jul 1999 09:27:58 -0700
From: David Hinds <dhinds@zen.stanford.edu>
To: David Woodhouse <David.Woodhouse@mvhi.com>
Cc: mtd@infradead.org
Subject: Re: Disk-On-Chip progress.
References: <E112Fl7-0001R8-00@devel2.axiom.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E112Fl7-0001R8-00@devel2.axiom.internal>; from David Woodhouse on Thu, Jul 08, 1999 at 04:06:45PM +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Thu, Jul 08, 1999 at 04:06:45PM +0100, David Woodhouse wrote:
> 
> There's already a GPL'd implementation of FTL, their original flash
> filesystem.  They hold patents on it, and it's restricted for use
> only with PCMCIA devices.

Sure, but as you well know, the Linux FTL implementation is being
used on non-PCMCIA devices, in violation of their license... perhaps
not in commercial products, but I don't really know.

they could argue that keeping NFTL proprietary saves them from having
to police and enforce their IP rights by litigation.  I'm not saying I
think this is a great position for them to take, just that it isn't
completely irrational.

-- Dave


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
