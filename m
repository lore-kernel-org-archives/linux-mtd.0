Received: from ip68-6-32-25.sb.sd.cox.net ([68.6.32.25] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cWTK-0001xu-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 18:55:38 +0000
From: "Brian J. Fox" <bfox@ua.com>
To: rob@sysgo.de
CC: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	joern@wohnheim.fh-wedel.de
In-reply-to: <Pine.LNX.4.21.0202171132030.24980-100000@dagobert.svc.sysgo.de>
	(message from Robert Kaiser on Sun, 17 Feb 2002 11:36:30 +0100 (MET))
Subject: Re: MTD concat layer
Message-Id: <E16cWdG-0003jL-00@speedy.datawave.net>
Date: Sun, 17 Feb 2002 11:05:54 -0800
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

   Date: Sun, 17 Feb 2002 11:36:30 +0100 (MET)
   From: Robert Kaiser <rob@sysgo.de>
   X-Sender: rob@dagobert.svc.sysgo.de
   cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
      joern@wohnheim.fh-wedel.de

   On Sat, 16 Feb 2002, Brian J. Fox wrote:

   > 
   >    From: Robert Kaiser <rob@sysgo.de>
   >    Date: Sat, 16 Feb 2002 12:03:27 +0100 (MET)
   > 
   >    On Sat, 16 Feb 2002, David Woodhouse wrote:
   > 
   >    > 
   >    > rob@sysgo.de said:
   >    > > OK, just to be clear about this: If my erase function is asked to
   >    > > erase -say-  1.5 blocks, what should it do: 
   >    > 
   >    > -EINVAL.
   > 
   >    OK, but is the function allowed to erase blocks up to the point
   >    where it hits the partial block request ? That would make it simpler,
   >    especially in the presence of variable block sizes.
   > 
   > *No*, you should *not* erase some blocks and return an error.
   > 

   Hmm, would you care to elaborate why ?

Just to be clear, the words that are important to me in my above
statement are the combination of "erase" and "and error" -- i.e., a
better printing of my above statement is:

   *No*, you should *not* erase some blocks *and* return an error.

For each function that you call (or write) in your program, there are
a myriad of possibilities for how bad inputs are handled.  Three of
these are common.  One may ignore bad inputs, and just keep chugging,
*perhaps* causing a crash.  One may massage the bad inputs into "good"
inputs, and pretend that the caller supplied those inputs.  Or, one
may refuse to operate utilizing the bad inputs.

Of the three options that I gave above, only one of them results in
predictable behavior -- the last one.

In order to achieve predictable behavior, and fewer bugs in the driver
overall, functions should simply refuse to operate on parameters that
fall out-of-bounds, and should return an error which specifies why
nothing happened.

If the erase function could only be called from within the driver code
proper (i.e., the only way bad inputs could be generated would be
purely from other bugs in the driver code), it would be acceptable to
*deliberately* crash at the point that the bad input was seen, so as
to speed the debugging of the driver code.

Low-level system software should never try to DWIM -- it is guaranteed
to fail.

Hab' ich meine Gedanken gut eklaren?

Brian
== The Difference Between Cultures: ==
    Einigkeit und Recht und Freiheit
    Liberte', E'galite', Fraternite'
    Sex, drugs and rock'n'roll
