Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Oo5o-0003li-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:50:08 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Oo5l-0003lZ-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:50:06 +0000
Message-ID: <20010202214956.18450.qmail@scrye.com>
Date: Fri, 2 Feb 2001 14:49:56 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102022145040.8902-100000@imladris.demon.co.uk>
References: <20010202214438.18382.qmail@scrye.com>
	<Pine.LNX.4.30.0102022145040.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> On Fri, 2 Feb 2001, Kevin Fenzi wrote:
>> I can do that...

David> Don't bother, if DOCPROBE_HIGH was on - just turn it off.

ok. Doing that now. ;) 

David> CONFIG_MTD_DOCPROBE_HIGH turned _off_ too, don't you? Another
David> option which wants hiding.
>>  nope. I think I have it on. Would this be causing it to not detect
>> it?

David> Yep. It probes at different addresses (0xfffc8000-0xfffee000
David> instead of 0xc8000-0xee000). Another LinuxBIOS thing.

Is there a way to eliminate this option, just probe the normal
addresses first and then the High addresses? or does that cause a
problem? 

David> -- dwmw2

kevin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
