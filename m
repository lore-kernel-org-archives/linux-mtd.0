Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ADJr-0003LD-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:16:35 +0100
Message-ID: <3B2793B8.6DF379DF@daniel.com>
Date: Wed, 13 Jun 2001 11:24:24 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Nicolas Pitre <nico@cam.org>, Xavier DEBREUIL <xde@inventel.fr>,
 	linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <Pine.LNX.4.33.0106131207230.23397-100000@xanadu.home> <1933.992448679@redhat.com>
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

What about a "jffs2erase" routine that not only erases the flash sectors but
also writes out this
"signature" at the start of every erase block. This way one can mount an
empty JFFS2 fs on
a MTD partition erased by jffs2erase?

Vipin




David Woodhouse wrote:

> nico@cam.org said:
> >  That was my belief.  It seemed logical.  I was aparently wrong.  I
> > too consider it a bug if it isn't that way.
>
> Agreed. But the alternative bug - erasing the whole device if we tried to
> mount as jffs2 by mistake - was worse.
>
> --
> dwmw2
