Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ACVW-0003CM-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:24:34 +0100
Message-ID: <3B278787.2CD486C3@daniel.com>
Date: Wed, 13 Jun 2001 10:32:23 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: Xavier DEBREUIL <xde@inventel.fr>,
 	linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <Pine.LNX.4.33.0106131120100.23397-100000@xanadu.home>
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

> > This also means that if you accidentally mount a JFFS2 fs on a device that
> > has an existing JFFS fs on it
> > it will format the entire device- without warning!
>
> This behavior was modified recently.  If JFFS2 finds dirty blocks without a
> single valid JFFS2 node on the flash it won't erase it and refuse to mount.
>

Does this mean that you can no longer mount JFFS2 on an erased (blank) flash mtd
device and
hand populate the blank fs ?

If so, then I lodge my official protest!

Vipin
