Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AJgJ-0003tC-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Jun 2001 00:04:11 +0100
Date: Wed, 13 Jun 2001 19:08:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B27DE2B.8F003793@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131902120.23397-100000@xanadu.home>
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

> In other words, there would be bits in that sector that would "flip" from 1 to 0 or
> from 0 to 1. There is no way to detect
> these by reading the sector.
>
> Sometimes you can read the sector 2 times and read 0xff all the way through. Then
> on the 3rd read a few bits may come back as "0"!
>
> The only reliable solution is an algorithmic one. I first saw it suggested by Alan
> Cox. It goes as follows:

[...]

OK. Remember that discussion.  I just never caught the very reason why in
the first place.

So I reverted the queueing of empty blocks for erasing, while still counting
them.  If the whole flash is empty then mounting JFFS2 is still allowed and
the whole flash will be re-erased to be on the safe side.


Nicolas
