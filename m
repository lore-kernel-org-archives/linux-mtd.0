Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j53r-00017p-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 20:59:55 +0100
Received: from nwcst289.netaddress.usa.net ([204.68.23.34])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14j53l-000175-00
	for mtd@infradead.org; Fri, 30 Mar 2001 20:59:53 +0100
Message-ID: <20010330195933.15459.qmail@nwcst289.netaddress.usa.net>
Date: 30 Mar 2001 11:59:33 PST
From: Eric <ebrower@usa.net>
To: Tim Bowman <tbowman@emware.com>, mtd mailing list <mtd@infradead.org>
Subject: Re: [RPX Classic/Lite and byte ordering]
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

You might want to take a look at .../include/mtd/cfi_endian.h and
be sure you are using __raw_writeb and friends. =


E

Tim Bowman <tbowman@emware.com> wrote:
I am having trouble with an Embeddded Planet RPX board.  The mtd layer
seems to be reversing the data by double words.  If I write (then cat)
some text, every double word is reversed.  I can use a cramfs file
system, but I have to reverse the dwords myself before writing it to
flash, then everything works fine.  JFFS and other file systems
obviously don't work, since the data is written by mtd in the wrong
order.  I am doing everything on big-endian machines (PowerPC).

If someone can point me to the right code I would be glad to work on
this.

-TDB


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
