Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ACOa-0003Be-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:17:24 +0100
Date: Wed, 13 Jun 2001 11:21:49 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: Xavier DEBREUIL <xde@inventel.fr>, <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B27809B.FA5183@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131120100.23397-100000@xanadu.home>
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

> I read the messages where you solved this problem, but let me add a side
> note just for future reference:
>
> JFFS can *NOT* be mounted on a device that has either 1. Not been erased OR
> 2. Not been initialized with
> a JFFS image (using the external tool).
>
> That is why it finds all those "dirty" sectors and no free space.
>
> On the other hand, JFFS2 *can* be mounted on a device that has not been
> initialized. It will detect the
> "dirty" sectors and just format them- resulting in a blank fs the first
> time you mount it.
>
> This also means that if you accidentally mount a JFFS2 fs on a device that
> has an existing JFFS fs on it
> it will format the entire device- without warning!

This behavior was modified recently.  If JFFS2 finds dirty blocks without a
single valid JFFS2 node on the flash it won't erase it and refuse to mount.


Nicolas
