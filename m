Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10hb11-00010a-00
	for mtd@imladris.demon.co.uk; Wed, 12 May 1999 16:33:47 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 12 May 1999 16:33:47 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 926523163:20:20972:9; Wed, 12 May 99 15:32:43 GMT
To: David Hinds <dhinds@zen.stanford.edu>
Cc: mtd@imladris.demon.co.uk
Subject: FTL patent.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 May 1999 16:32:08 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10hazQ-0001dy-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


dhinds@zen.stanford.edu said:
>  I've recently learned that there is a fairly annoying encumberance
> associated with FTL: while it is now part of the PCMCIA standard, it
> is patented and M-Systems grants a royalty free license for its use
> *only* for PCMCIA devices.  So technically, it appears that any use of
> FTL for non-PCMCIA devices is a patent infringement.

> The patent claims are broad enough that I don't see any straighforward
> way of writing a free non-FTL translation layer.  But I'm not a patent
> lawyer, and don't really know what can and can't be gotten away with. 


alex@signum.se said:
>  Note that there *might* be patent problems using this code in the US.

Is this _just_ a US problem, or are the patents applicable world-wide?

Could we get away with inserting a check so that the FTL code is only allowed to 
be used with PCMCIA devices, (which can conveniently be disabled with a 
single-line patch)



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
