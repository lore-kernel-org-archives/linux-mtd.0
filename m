Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AIHG-0003nw-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 22:34:14 +0100
Message-ID: <3B27DE2B.8F003793@daniel.com>
Date: Wed, 13 Jun 2001 16:42:03 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: David Woodhouse <dwmw2@infradead.org>,
 	Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <Pine.LNX.4.33.0106131703070.23397-100000@xanadu.home>
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

> If a sector is empty, it is simply put in the queue for signature stamping.

How do you know it's empty? Just because you read 0xff from it? It could be
partially erased!

>
> > If you don't do this, "flipping bits" will come up behind you and nip you in
> > the bud :)
>
> Please could you enlighten me on the matter?

The story of flipping bits goes as follows:

Once upon a time in a land far far away (ok just a few offices down :), I was
testing the JFFS file system for power down
reliability.

Occasionally the system would run out of kernel memory, even though there was no
logical way for that
to happen in the mount logic. Basically it turned out that if power failed just at
the right time during the erase
of a sector, the next time you read the sector, the data read back would not be
consistent across multiple reads!

In other words, there would be bits in that sector that would "flip" from 1 to 0 or
from 0 to 1. There is no way to detect
these by reading the sector.

Sometimes you can read the sector 2 times and read 0xff all the way through. Then
on the 3rd read a few bits may come back as "0"!

The only reliable solution is an algorithmic one. I first saw it suggested by Alan
Cox. It goes as follows:

<Inspect sector>
<verify magic sector signature>
<erase sector if no signature *regardless of state of data in it*>
<write signature>
<manupliate data in sector>
...
<more manuplitations of data in sector. Magic signature remains in place.>
...
/* Now you (GC) want to erase the sector */
<Invalidate the signature by overwriting it>  <-If pwr fails at this point, the
sector will be erased on next mount => as desired
<erase the sector>    <- If pwr fails here and we get flipping bits, magic sig will
be missing => sector reerased.
<sector erase successful? => rewrite sig at head> <- if pwr fails here, no issue.
If sig good=> accept sector. If sig bad=>reerase sector.
<back to top and logic loop repeats>


In the above, nowhere do we depend on reading the sector for 0xff to determine if
it needs to be erased. That was the weak spot
and has been eliminated. The only weak link is if the gods align against you and
your flipping bits flip in such a way that
they present your magic signature back to you. Very very unlikely!

This is something important to note vs JFFS. JFFS cannot support this functionality
as it does not manage erase sectors. The only way
to detect flipping bits is to read the sector multiple times and *hope* that you
detect a change in bits in the N times you are going to
re-read it. If N is large your chances of detection is high but so is your mount
time. At the moment I've coded N to be 4 as I found that
under that there was a real chance of missing flipping bits sectors.

Vipin

P.S. Why do flipping bits happen? My theory is, as FLASH devices work by
capturing/releasing charge in a floating gate, a partially
erased sector may just have enough charge to be in the threshold region of the
sense amps. These bits may be read back as 1 or 0,
depending on the alignment of the stars and the flapping of butterfly wings in a
country across the globe.

This is an astable state and the only way to get the device back is to reerase the
sector.

P.P.S I believe that David independently discovered this problem around the same
time.
