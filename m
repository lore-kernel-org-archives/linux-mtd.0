Received: from eppat.qlogic.com ([63.170.40.2] helo=EPEXCH01.qlogic.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2BJA-0001sA-JL
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:48:49 -0500
Received: from swahl-linux.qlogic.org (localhost.localdomain [127.0.0.1])
	by swahl-linux.qlogic.org (8.12.8/8.12.8) with ESMTP id j1IGml6m016731
	for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2005 10:48:47 -0600
Received: (from swahl@localhost)
	by swahl-linux.qlogic.org (8.12.8/8.12.5/Submit) id j1IGmlBZ016730
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 10:48:47 -0600
Date: Fri, 18 Feb 2005 10:48:23 -0600
From: Steve Wahl <steve.wahl@qlogic.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050218164823.GE2119@qlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: jedec_probe.c bug: AMD AM29LV800 in byte mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, list.

I'm newly returning to this list; I used to be on it, went through a
change in employment, and now, surprise, I'm doing some related work
again.

I emailed David (dwmw2) directly to ask how I should aproach this, but
he either didn't get it or correctly blew me off :-).  I'm assuming
the former, but hold nothing against him if it's the latter.

I did see one other post in the archives that refered to the *400, not
*800 version of this chip, but I didn't see any real solution.

The meat of the problem is: when this chip is in byte mode, the id
should be read from location 2, and when the chip is in word mode, the
id should be read from location 1.  The jedec_read_id() code does the
exact opposite.

I'd be more than willing to develop and offer a patch, but I don't
have a clue as to the range of chips this code applies to, and how to
know which ones need to change.  The best I can suggest at the moment
is reading both locations and indicating in the jedec_table[] which
location should be compared with. (Does anybody think that's the right
way to go?  I'll see if I can work such a patch up if so...)

I have a current patch which just changes the location where ID is
read from.  It makes this chip work, but of course breaks all the
others.  

Background:

    System is based on a PPC chip, is currently running Linux 2.4 with
    the old amd_flash.c driver (with a similar patch).  I'm porting
    Linux 2.6 to this system.  Previous 2.4 port person just did the
    patch on his own for this company and as far as I can tell didn't
    inform the world that a change had to be made.  I'd rather get the
    mainline MTD code working so that (A) future ports (Linux 2.8?)
    won't run into the problem, and (B) I have a set of code that will
    still work when my hardware guys decide to change to a flash chip
    that my current kludge breaks.

    If anyone cares, we're not running a filesystem on this chip, just
    need to re-write the boot code with it.  We have another chip
    that's NAND, on which we're using YAFFS.

Thanks for listening,

--> Steve Wahl, Qlogic Corporation.
