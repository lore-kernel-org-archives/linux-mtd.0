Received: from ip68-6-32-25.sb.sd.cox.net ([68.6.32.25] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cppU-0007CR-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 15:35:48 +0000
From: "Brian J. Fox" <bfox@ua.com>
To: rob@sysgo.de
CC: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	joern@wohnheim.fh-wedel.de
In-reply-to: <Pine.LNX.4.21.0202180915200.5439-100000@dagobert.svc.sysgo.de>
	(message from Robert Kaiser on Mon, 18 Feb 2002 09:48:51 +0100 (MET))
Subject: Re: MTD concat layer
Message-Id: <E16cq07-0004Hc-00@speedy.datawave.net>
Date: Mon, 18 Feb 2002 07:46:47 -0800
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

   Date: Mon, 18 Feb 2002 09:48:51 +0100 (MET)
   From: Robert Kaiser <rob@sysgo.de>

   > In order to achieve predictable behavior, and fewer bugs in the driver
   > overall, functions should simply refuse to operate on parameters that
   > fall out-of-bounds, and should return an error which specifies why
   > nothing happened.

   Now, here comes the problem. In the context of an erase function,
   what does "predictable behavior" mean ? If it returns EINVAL, the caller
   can see that they passed a faulty parameter, so does it make any
   difference wether some of the specified flash range have been erased in
   the process?

Sure.  Erasing the blocks *changes* the state of the world from a
predictable one to an unpredictable one.

   By specifying a certain area of flash to be erased, the user has by
   definition given up any hope of seeing the data in that area again.

If the arguments are invalid, the code that calculated them is
probably invalid.  Erasing the blocks is simply mean, and irreversible.

   I think one can compare this to a read() function: if read() returns
   an error, would you expect that the buffer that you passed to it
   still contains all of its previous data ?

It wouldn't matter if the buffer contained partial data, or no data,
or the previous data.  You haven't done something that is user visibly
irreversible!

   > Hab' ich meine Gedanken gut eklaren?
   > 

   Ja. Ich meine auch ?

Ja, aber "read" ist nicht "delete"!

MBD,

Brian
== The Difference Between Cultures: ==
    Einigkeit und Recht und Freiheit
    Liberte', E'galite', Fraternite'
    Sex, drugs and rock'n'roll
