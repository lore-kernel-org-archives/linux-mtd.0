Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AHsG-0003mI-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 22:08:24 +0100
Date: Wed, 13 Jun 2001 17:12:41 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B27D3EE.34F3C984@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131703070.23397-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 13 Jun 2001, Vipin Malik wrote:

> > Just committed a patch to allow mounting JFFS2 on entirely empty (erased)
> > flash.  It should speed up the mount of partially erased partitions as well
> > since the empty blocks aren't erased unnecessarily anymore.
> >
>
> I hope you have accounted for "flipping bits" (TM Vipin Malik) sectors.
> That's why the start of erase-sector signature was introduced in the first
> place.

If a sector is empty, it is simply put in the queue for signature stamping.

> If a sector does not have the signature it *must be erased* even if you read
> 0xff from
> all locations in the sector. Just writing the signature is not enough.

What do you mean by that?

> And of course, this signature must be invalidated before going in to erase the
> sector so that
> if power fails in the middle of the erase, the sector ends up being erased on
> the next mount.

If that's really necessary to re-erase them even if they are already erased
then it's just a matter of replacing "erase_complete_list" by
"erase_pending_list"  on line 97 of fs/jffs2/scan.c.

> If you don't do this, "flipping bits" will come up behind you and nip you in
> the bud :)

Please could you enlighten me on the matter?


Nicolas
