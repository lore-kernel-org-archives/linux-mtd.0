Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OqVW-0005N4-00
	for mtd-list@infradead.org; Sat, 03 Feb 2001 00:24:50 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14OqVT-0005Mx-00
	for mtd@infradead.org; Sat, 03 Feb 2001 00:24:49 +0000
Message-ID: <20010203002436.20169.qmail@scrye.com>
Date: Fri, 2 Feb 2001 17:24:36 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102030012090.8902-100000@imladris.demon.co.uk>
References: <20010202231525.19299.qmail@scrye.com>
	<Pine.LNX.4.30.0102030012090.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> On Fri, 2 Feb 2001, Kevin Fenzi wrote:
>> Should I have to have the DEBUG_ECC off?

David> Doesn't matter.

>> Looks like in find_boot_record() at the top of that file is another
>> MTD_READECC...should I change that to MTD_READ?

David> Try it.

no dice. The ecc errors stopped, but it still doesn't seem to want to
read the DOC. ;( 

anything else I can try? 

David> -- dwmw2

kevin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
