Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AClB-0003Dn-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:40:45 +0100
Date: Wed, 13 Jun 2001 11:45:11 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: Xavier DEBREUIL <xde@inventel.fr>, <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B278787.2CD486C3@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131144260.23397-100000@xanadu.home>
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

> > > This also means that if you accidentally mount a JFFS2 fs on a device that
> > > has an existing JFFS fs on it
> > > it will format the entire device- without warning!
> >
> > This behavior was modified recently.  If JFFS2 finds dirty blocks without a
> > single valid JFFS2 node on the flash it won't erase it and refuse to mount.
> >
>
> Does this mean that you can no longer mount JFFS2 on an erased (blank) flash mtd
> device and
> hand populate the blank fs ?

A blank flash isn't considered dirty.


Nicolas
