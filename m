Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Oo0d-0003hX-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:44:47 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Oo0b-0003hP-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:44:46 +0000
Message-ID: <20010202214438.18382.qmail@scrye.com>
Date: Fri, 2 Feb 2001 14:44:38 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102022140480.8902-100000@imladris.demon.co.uk>
References: <20010202212916.18193.qmail@scrye.com>
	<Pine.LNX.4.30.0102022140480.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> On Fri, 2 Feb 2001, Kevin Fenzi wrote:
>> I left it at 0. How can I tell what address the DOC is at? from the
>> bios?
>> 
>> So it would print something here if it found the DOC?

David> Yep, should do. Make it print stuff anyway - litter the
David> 'doccheck' routine in docprobe.c with printks. You do have

I can do that...

David> CONFIG_MTD_DOCPROBE_HIGH turned _off_ too, don't you? Another
David> option which wants hiding.

nope. I think I have it on. Would this be causing it to not detect it?

Let me add some printk's and turn that option off...

David> -- dwmw2

kevin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
