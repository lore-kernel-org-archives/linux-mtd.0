Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AHV1-0003jt-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 21:44:23 +0100
Date: Wed, 13 Jun 2001 16:48:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Vipin Malik <vipin.malik@daniel.com>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2 
In-Reply-To: <1933.992448679@redhat.com>
Message-ID: <Pine.LNX.4.33.0106131645450.23397-100000@xanadu.home>
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
> >  That was my belief.  It seemed logical.  I was aparently wrong.  I
> > too consider it a bug if it isn't that way.
>
> Agreed. But the alternative bug - erasing the whole device if we tried to
> mount as jffs2 by mistake - was worse.

Just committed a patch to allow mounting JFFS2 on entirely empty (erased)
flash.  It should speed up the mount of partially erased partitions as well
since the empty blocks aren't erased unnecessarily anymore.


Nicolas
