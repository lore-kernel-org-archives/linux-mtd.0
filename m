Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AZxs-0001Un-00
	for mtd-list@infradead.org; Fri, 07 Jul 2000 16:22:52 +0100
Received: from royal2.eicnet.de ([62.144.196.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13AZxr-0001Uh-00
	for mtd@infradead.org; Fri, 07 Jul 2000 16:22:51 +0100
Received: from iserv.compu.lan (root@ppp-21.regio.net [192.135.7.149])
	by royal2.eicnet.de (8.9.3/8.9.3) with ESMTP id RAA24843
	for <mtd@infradead.org>; Fri, 7 Jul 2000 17:22:45 +0200
Received: from compulan.de ([192.168.1.210])
	by iserv.compu.lan (8.8.8/8.8.8) with ESMTP id RAA13005
	for <mtd@infradead.org>; Fri, 7 Jul 2000 17:23:37 +0200
Message-ID: <3965F5BB.195CE244@compulan.de>
Date: Fri, 07 Jul 2000 17:22:35 +0200
From: Michael Renzmann <mrenzmann@compulan.de>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: DOC socket misuseable?
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all.

I know that my question is not ontopic, but maybe some of the hardware-
and programming wizards could at least give some tips.

My problem is that I have to connect a lcd (liquid crystal display) to
two different types of PC. Up to now I did this by connecting them with
an appropriate cable to the parallel port which normally is used as
printer port. A scheme of the cable and the needed "drivers" for the
lcd=B4s for linux can easily be found (I=B4ll tell the link if someone wa=
nts
it). It worked fine by now.

The solution of connecting the displays to the parport can no longer be
used, due to different problems. Now I am looking for another way to
connect the lcd to the pc=B4s. I know that the driver for the lcd has to
be rewritten after that, but thats the lesser problem. The bigger
problem is to find an interface that provides at least 10 outout lines
(8 for data transmission and 2 or 3 for toggling different states,
depending on the display type). As both pc types are so called thin
clients, they both feature a doc socket. So I wonder if it was possible
to "misuse" this socket to connect the lcd to it. As the DOCs have to
send and/or receive data as well there should be a way to use this
socket in my opinion. But I don=B4t know how this could be done, maybe on=
e
of the wizards in here could help with that...?

If this is not the right way (i.e. the socket can not be used for this
purpose), does anyone have another idea how to connect the lcd to the
pc? As said before, I need 10 or 11 output lines, no input needed. Any
help appreciated and sorry for this (mostly) offtopic mail.

Bye, Mike


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
