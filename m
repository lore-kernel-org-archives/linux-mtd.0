Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cjmN-0008KV-00
	for mtd-list@infradead.org; Tue, 13 Mar 2001 08:03:39 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14cjmM-0008KP-00
	for mtd@infradead.org; Tue, 13 Mar 2001 08:03:39 +0000
Date: Tue, 13 Mar 2001 08:03:33 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
cc: <mtd@infradead.org>
Subject: Re: erase.c
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E3108AFC2@kolkrabbi.flaga.is>
Message-ID: <Pine.LNX.4.30.0103130802440.6091-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 12 Mar 2001, [iso-8859-1] K=E1ri Dav=ED=F0sson wrote:

> Maybe it is ambigous to do force unlocking of sectors like this.
> Should we maybe have a separate utility to lock/unlock sectors?

Use a separate utility. Locking isn't very useful if the code
automatically unlocks the chip for you if you try to overwrite it :)

--=20
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
