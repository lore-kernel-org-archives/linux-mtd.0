Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ACwe-0003F9-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:52:36 +0100
Date: Wed, 13 Jun 2001 11:56:59 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Vipin Malik <vipin.malik@daniel.com>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2 
In-Reply-To: <31256.992447116@redhat.com>
Message-ID: <Pine.LNX.4.33.0106131155261.23397-100000@xanadu.home>
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
> vipin.malik@daniel.com said:
> >  Does this mean that you can no longer mount JFFS2 on an erased
> > (blank) flash mtd device and hand populate the blank fs ?
>
> It refuses to mount if it would be erasing some blocks to start with and
> it's found no valid nodes. Thinks.... if the device is completely
> pre-erased then it'd be erasing every block 'to make sure', so it'd fail to
> mount.

That's not what I though...

> We could special-case this - if the device _was_ entirely empty beforehand
> - if it contained only 0xFF, then we can go ahead with the mount. Only if
> it actually had some data on should we fail.

Exactly.


Nicolas
