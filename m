Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kGpC-0003sf-00
	for mtd-list@infradead.org; Tue, 03 Apr 2001 03:45:42 +0100
Received: from nwcst285.netaddress.usa.net ([204.68.23.30])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14kGpB-0003sZ-00
	for mtd@infradead.org; Tue, 03 Apr 2001 03:45:41 +0100
Message-ID: <20010403024521.10444.qmail@nwcst285.netaddress.usa.net>
Date: 2 Apr 2001 19:45:21 PDT
From: Eric <ebrower@usa.net>
To: Tim Bowman <tbowman@emware.com>, mtd mailing list <mtd@infradead.org>
Subject: Re: [RPX Classic/Lite and byte ordering]
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Tim Bowman <tbowman@emware.com> wrote:

> The rpxlite layer seems to be using memcpy_fromio, writeb, writew, etc,=

> not __raw_writeb.  Should these be replaced with the raw versions?

Yes, in any case they should be using the __raw equivalents to force
untranslated byte ordering.  This allows the ENDIAN defines to work
appropriately.  I can't say if this is your problem, but you should
go 'raw' at the very least to be idiomatic with the other drivers.

E



____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
