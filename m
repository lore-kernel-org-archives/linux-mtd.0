Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ADhL-0003Se-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:40:51 +0100
Date: Wed, 13 Jun 2001 12:45:15 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Vipin Malik <vipin.malik@daniel.com>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2 
In-Reply-To: <4676.992450013@redhat.com>
Message-ID: <Pine.LNX.4.33.0106131238060.23397-100000@xanadu.home>
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


On Wed, 13 Jun 2001, David Woodhouse wrote:

>
> nico@cam.org said:
> >  On Wed, 13 Jun 2001, Vipin Malik wrote:
> > > What about a "jffs2erase" routine that not only erases the flash sectors
> > > but also writes out this "signature" at the start of every erase block.
> > > This way one can mount an empty JFFS2 fs on a MTD partition erased by
> > > jffs2erase?
>
> > This is IMHO not the real solution.
>
> Why? No other filesystem can be mounted on empty media without some form of
> mkfs.

JFFS2 is far from being a conventional filesystem, no?

It is really elegant to just erase the flash partition and mount right away.
Not yet another special tool please.

> In fact you wouldn't need to do every block. All you'd have to do is put
> the 12-byte cleanmarker node at the beginning of the first block and it'd
> be sufficient.

This is ugly.

> You could do this with a suitable 'echo' command.

This is ridiculous, especially when the fix is probably about a one or two
line change in JFFS2 code.  I'm currently looking at it.  Expect the diff
soon.

Let's avoid the hassle of requiring people to need yet another tool.


Nicolas
