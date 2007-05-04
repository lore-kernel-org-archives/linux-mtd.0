Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjyNa-0004PE-NU
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 10:03:27 -0400
Subject: Re: RO jffs2 implementation for bootloader
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <200705041353.43372.sr@denx.de>
References: <loom.20070503T102421-36@post.gmane.org>
	<1178186163.7539.62.camel@sauron> <463B02F5.6060503@parrot.com>
	<200705041353.43372.sr@denx.de>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 04 May 2007 16:03:21 +0200
Message-Id: <1178287401.5753.4.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-05-04 at 13:53 +0200, Stefan Roese wrote:
> Hi Matthieu,
> 
> On Friday 04 May 2007 11:55, Matthieu CASTET wrote:
> > > On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
> > >> I need to mount a jffs2 partition in a bootloader. I tried u-boot that
> > >> support jffs2, but it is very slow (2 minutes for mounting a 64MB
> > >> partition). Do you know if there are other (fast) implemenation of jffs2
> > >> suitable for a bootloader ?
> > >
> > > Not sure about any existing "fast" implementation, but mounting a JFFS2
> > > partition is about scanning whole partition. You may optimize some
> > > thing, but you have to scan anyway.
> >
> > Well u-boot implementation is very slow. For 64MB partition : 2 minutes
> > for u-boot
> 
> This really is slow. 64MB isn't that big and shouldn't take that long to 
> mount.
> 
> > and 11 s for linux (3s with summary). 
> 
> So it can be done better.
> 
> Did you think about improving the performance in U-Boot? If so, please let's 
> move this discussion to the u-boot-users mailing list.

Someone sent a patch a while ago to this list(I think) which had
significant improvemets to JFFS2 load time.

 jocke
