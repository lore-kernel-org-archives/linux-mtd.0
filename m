Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Oo29-0003iU-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:46:21 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14Oo27-0003iN-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:46:20 +0000
Date: Fri, 2 Feb 2001 21:46:16 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202214438.18382.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102022145040.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> I can do that...

Don't bother, if DOCPROBE_HIGH was on - just turn it off.

> David> CONFIG_MTD_DOCPROBE_HIGH turned _off_ too, don't you? Another
> David> option which wants hiding.
> 
> nope. I think I have it on. Would this be causing it to not detect it?

Yep. It probes at different addresses (0xfffc8000-0xfffee000 instead of 
0xc8000-0xee000). Another LinuxBIOS thing.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
