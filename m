Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ADTm-0003Nz-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:26:50 +0100
Date: Wed, 13 Jun 2001 12:31:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B2793B8.6DF379DF@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131230490.23397-100000@xanadu.home>
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

> What about a "jffs2erase" routine that not only erases the flash sectors but
> also writes out this
> "signature" at the start of every erase block. This way one can mount an
> empty JFFS2 fs on
> a MTD partition erased by jffs2erase?

This is IMHO not the real solution.


Nicolas
