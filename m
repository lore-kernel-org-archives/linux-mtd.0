Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12TTHi-0005z5-00
	for mtd-list@infradead.org; Fri, 10 Mar 2000 17:33:10 +0000
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12TTHg-0005yz-00
	for mtd@infradead.org; Fri, 10 Mar 2000 17:33:08 +0000
Received: from zentropix.com ([195.166.67.91])
	by colo.asti-usa.com (8.9.3/8.9.3) with ESMTP id MAA20014
	for <mtd@infradead.org>; Fri, 10 Mar 2000 12:38:07 -0500
Message-ID: <38C93233.A1AC0566@zentropix.com>
Date: Fri, 10 Mar 2000 17:34:43 +0000
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: Reviving DiskOnChip
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Err, anybody know the spells and incantations required to bring a
DiskOnChip back to life?

According to M-Systems there are ways to do this (eg: dformat /win:xxx
/unformat) but they don't seem to work for me, (wrong kind of pointy hat
I guess).

docpmap /e appears to frag the thing completely, full stop, goodnight
vienna.
I include an excerpt from an email that opens the lid (very slightly) on
some of their secret squirrel stuff in case it's of use/information to
anyone.

If anyone has the full monty on the M-Systems utilities, ie: what the
commands really do, what their commandline parameters really are and
which sub-sets actually work, I'd be externally grateful.

Alternatively, has anyone got some other utilities to achieve, stable,
working, reliable and robust DOCs?

Have I been stupid? (don't answer that!) or just unlucky?

Thanks in advance and desperation,

Trev.

<<Snip>>
dformat /win:e400 /log:<filename> - this will save the bad block table
in
the file <filename> just to be on the safe side. I still owe you this
answer
from a previous email if I remember correctly. you can later use dformat
/win:e400 /uselog:<filename> - if you accidentally used docpmap /e.

then 

dformat /win:e400 /unformat - this will return the DOC to it's original
condition where the flash is totally erased and bad blocks are marked.

dformat /win:e400 /s:doc122.exb - this will return the firmware to the
doc
and format it ready for the file system

There is a manual in the physical pack but unfortunately all the secrets
such as these undocumented options are not documented there and in the
help
message when you write dformat with no parameters, sorry :-)

<</Snip>>
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
