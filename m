Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14l9dW-0004ON-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 14:17:18 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14l9dV-0004OH-00
	for mtd@infradead.org; Thu, 05 Apr 2001 14:17:17 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14l9dT-0007yv-00
	for mtd@infradead.org; Thu, 05 Apr 2001 14:17:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Code submission to 2.4.x-ac
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Apr 2001 14:17:15 +0100
Message-ID: <30684.986476635@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Some time in the next week or few, I'm going to be trying to flush the
latest code to Alan for inclusion in his -ac kernel tree. This usually means
I get quite involved in trying to clean up bits of code which have been
annoying me for a while, and bits which I suddenly notice are ugly when I
start looking in detail at the patches I'm generating. 

So... please avoid breaking it for a little while, or doing stuff which I'm 
going to have difficulty justifying to Alan or Linus. I'm going to start by 
cleaning up the inter_module_register cruft, and trying to reacquaint 
myself with the CFI probe logic and convince myself it's still sensible. 

I'll probably also submit the pending JFFS changes from the CVS trunk, and 
maybe even JFFS2 if people stop managing to break it.

I'd still like to reorganise the CFI/JEDEC flash code so we have the
{word,buffer}_write and chip_erase functions etc. in chip-specific code, but
the wrappers which repeatedly call the inner functions and deal with stuff 
like multiple erase sizes are shared. But we should probably leave that for
2.5.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
