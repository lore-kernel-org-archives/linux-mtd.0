Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OqJl-0005Db-00
	for mtd-list@infradead.org; Sat, 03 Feb 2001 00:12:41 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14OqJk-0005CV-00
	for mtd@infradead.org; Sat, 03 Feb 2001 00:12:41 +0000
Date: Sat, 3 Feb 2001 00:12:35 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202231525.19299.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102030012090.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> Should I have to have the DEBUG_ECC off? 

Doesn't matter.

> Looks like in find_boot_record() at the top of that file is another
> MTD_READECC...should I change that to MTD_READ? 

Try it.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
