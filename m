Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OoMs-00040v-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 22:07:46 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14OoMr-00040p-00
	for mtd@infradead.org; Fri, 02 Feb 2001 22:07:46 +0000
Date: Fri, 2 Feb 2001 22:07:39 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202214956.18450.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102022205540.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> David> CONFIG_MTD_DOCPROBE_HIGH turned _off_ too, don't you? Another
> David> option which wants hiding.
> >>  nope. I think I have it on. Would this be causing it to not detect
> >> it?
> 
> David> Yep. It probes at different addresses (0xfffc8000-0xfffee000
> David> instead of 0xc8000-0xee000). Another LinuxBIOS thing.
> 
> Is there a way to eliminate this option, just probe the normal
> addresses first and then the High addresses? or does that cause a
> problem? 

That should be OK. But LinuxBIOS needs all the other options too. I think 
it's best just to hide all three inside CONFIG_LINUXBIOS or something.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
