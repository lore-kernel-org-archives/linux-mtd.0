Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FeKK-0004Dl-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 16:03:00 +0100
Date: Fri, 21 Jul 2000 16:53:53 +0100 (BST)
From: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
To: mark.langsdorf@amd.com
cc: mtd@infradead.org
Subject: Re: Jedec.c problems in mtd-20000704
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9EFEF@txexmta8.amd.com>
Message-ID: <Pine.LNX.4.21.0007211646360.22633-100000@alpha1.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 20 Jul 2000 mark.langsdorf@amd.com wrote:

> I'm sorry if this got patched in the latest CVS, but my
> employer's proxy does not seem to support CVS, or perhaps
> vice versa, so I have to use the latest tarball.

You really need to track the CVS. Can you at least get outgoing SSH? If
so, I can give you an account on infradead.org.

> 
> I've been having some problems with the 20000704 tarball in 
> regards to jedec.c 

 ... it doesn't compile and it can't be enabled. Those two aren't just
coincidence :) Jgg sent it to me and I dropped it in as-is, to prevent
duplication of effort.

Change bus_width to buswidth as necessary, and remove the bank_size
altogether, or make it an extra argument to the _probe() routines rather
than putting it in the struct mtd_info.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
