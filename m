Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c2JM-0004uC-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 11:11:05 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:( 
Date: Wed, 29 Aug 2001 12:15:33 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEENJEOAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <25302.999077097@redhat.com>
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

> krom@dgt-lab.com.pl said:
> > > The erase of unclean sectors is done in the background after the mount
> > > has finished. One day we'll get round to fixing the drivers so that we
> > > don't busy-wait for erases to complete either.
>
> > Please anonuce it on the list.
>
> It won't make your mount any faster. You have a sane CPU which can handle
> having both a cached and uncached mapping of a physical region -
> try doing
> that in your map driver (see ocelot.c for inspiration) and see if
> it helps.

Is this(both a cached and uncached mapping)possible on an MPC860?
