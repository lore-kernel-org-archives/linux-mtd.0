Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 120Nu0-0006wP-00
	for mtd-list@infradead.org; Tue, 21 Dec 1999 11:56:28 +0000
Received: from mb04.swip.net ([193.12.122.208])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 120NtV-0006wJ-00
	for mtd@imladris.mvhi.com; Tue, 21 Dec 1999 11:56:26 +0000
Message-ID: <01BF4BB3.38321A20.mdeans@algonet.se>
From: Bjorn Eriksson <mdeans@algonet.se>
To: "'Kira Brown'" <kira@linuxgrrls.org>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: RE: Data Reliability
Date: Tue, 21 Dec 1999 12:59:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


>We've already done it.  Since we have not a lot running on the system, =
a
>shutdown -h takes less than a third of a second on a 99MHz AMD Elan =
SC410
>driving an 8Mbyte DoC2000.  We didn't write any special code other than =
a
>little thingy (technical term) that watches one of the processor GPIO =
pins
>for a falling edge and executes a shutdown if it sees one.  One of =
those
>funky 1F memory retention caps provides the power to do this.  (Do =
those
>things scare anyone else or is it just me?)

 Uhm, do you let your SC410 keep cruising at 99MHz? ISTR that these =
"funky=20
memory retention caps" (FMRC:) holds up kinda bad under heavy load. I've =

got myself a seriously funky MRC that's either 3F or 700uF depending on =
how=20
heavy a load I've got at the point of power failure.

P.s Do you know any venues for SC4xx designs/info/refs? Considering how=20
many people are designing with this beast there preciously little noise =
on=20
the Web. Right now I'm fighting GPCSA who stubbornly asserts his right =
to=20
drive *ALL* the GPIO_CS's :-) D.s


//Bj=F6rn Eriksson



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
