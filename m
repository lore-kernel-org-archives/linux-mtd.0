Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AY8A-0004fa-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Jun 2001 15:29:55 +0100
Message-ID: <3B28CC3C.7753E8C3@daniel.com>
Date: Thu, 14 Jun 2001 09:37:48 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: David Woodhouse <dwmw2@infradead.org>,
 	Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <Pine.LNX.4.33.0106131902120.23397-100000@xanadu.home>
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

Nicolas Pitre wrote:

> OK. Remember that discussion.  I just never caught the very reason why in
> the first place.
>
> So I reverted the queueing of empty blocks for erasing, while still counting
> them.  If the whole flash is empty then mounting JFFS2 is still allowed and
> the whole flash will be re-erased to be on the safe side.
>

Great.

I think we should put warning notes in the appropriate place in the code
regarding this (if not already there now), as this is one feature that at first blush
seems appropriate
for optimizing by an unsuspecting programmer, in the future.

The last thing we want is this "feature" to creep back in a few years from now when
none of us are vigilant about this.

Vipin
