Return-path: <David.Woodhouse@mvhi.com>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xKxx-0001dh-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 02:11:57 +0000
Received: from geisha.cendio.se ([193.180.23.107] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xKxv-0001db-00
	for mtd@infradead.org; Mon, 13 Dec 1999 02:11:56 +0000
Date: Mon, 13 Dec 1999 03:14:04 +0100
Message-Id: <199912130214.DAA24071@godzilla.cendio.se>
From: Christer Weinigel <wingel@cendio.se>
To: Adi Linden <adi@adis.on.ca>
Cc: mtd@infradead.org
Subject: DOC2000 and 2.2.12 kernel
In-Reply-To: <Pine.LNX.4.10.9912121928210.1131-100000@localhost.localdomain>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

> I am new to using the DOC2000 devices. I successfully patched the
> 2.2.12 kernel with the M-Systems provided binary driver. But I can't 
> get plilo to compile. I understand distributing the kernel patched
> with a binary driver will violate the GPL license.

I actually got the M-systems driver working as a module a couple of
weeks ago, and have been using it with an initrd.  I still dislike
using a binary only module, but I was under a lot of time pressure and
didn't have the time to try to find the bugs in the mtd-implementation
(or rather the mismatch between what David Woodhouse's mtd code writes
to the flash and what the M-systems BIOS expects).

> Now I am looking at mtd. I am lost in its documentation. Now I have
> a bunch of questions:

> 1. Is mtd a kernel patch? if so, how to I apply it to the kernel?

MTD as it looks right now is a set of modules that should be compiled
and placed on an initrd if you need to use the flash as your root
device.  I have modified the mtd-files so that they can be compiled
into the kernel to avoid the initrd, but haven't had the time nor
energy to clean up my changes.  But if anyone is interested in it and
pesters me enough, I'll probably do it sometime this year :-)  The
same goes for the M-systems driver too, if anyone wants a modularized
version of that driver to avoid the copyright problems, please get in
touch with me.

> 3. Does mtd require the doc2000 firmaware which conflicts with lilo?

Yes, you still have to patch LILO.  Unfortunately, when I last looked
at the mtd-implementation at the beginning of november, there was some
kind of incompatibility between it and the M-systems BIOS, so after a
while it would not be possible to boot from flash anymore.  This might
have changed lately.

  /Christer

-- 
Christer Weinigel		Cendio Systems AB
Email:	wingel@cendio.se	Teknikringen 8
Phone:	+46-13-21 46 00		583 30  Linköping
Fax:	+46-13-21 47 00		Sweden
[please note that Signum Support has changed its name to Cendio Systems]


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
