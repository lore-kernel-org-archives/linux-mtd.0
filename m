Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AHb0-0003kV-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 21:50:34 +0100
Message-ID: <3B27D3EE.34F3C984@daniel.com>
Date: Wed, 13 Jun 2001 15:58:22 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: David Woodhouse <dwmw2@infradead.org>,
 	Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <Pine.LNX.4.33.0106131645450.23397-100000@xanadu.home>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

> Just committed a patch to allow mounting JFFS2 on entirely empty (erased)
> flash.  It should speed up the mount of partially erased partitions as well
> since the empty blocks aren't erased unnecessarily anymore.
>

I hope you have accounted for "flipping bits" (TM Vipin Malik) sectors.
That's why the start of erase-sector signature was introduced in the first
place.

If a sector does not have the signature it *must be erased* even if you read
0xff from
all locations in the sector. Just writing the signature is not enough.

And of course, this signature must be invalidated before going in to erase the
sector so that
if power fails in the middle of the erase, the sector ends up being erased on
the next mount.

If you don't do this, "flipping bits" will come up behind you and nip you in
the bud :)

Vipin
