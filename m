Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159qxL-0001KE-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 17:23:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B26429A.5686E897@inventel.fr> 
References: <3B26429A.5686E897@inventel.fr>  <3B2635B4.63D6D647@colubris.com> <3B260CB7.E1513BBD@inventel.fr> <3B25FEB8.A00FCE03@inventel.fr> <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> <3161.992348379@redhat.com> <5586.992349315@redhat.com> <3B261F73.BF7325E1@inventel.fr> <3B2632EA.B38B039C@inventel.fr> <1776.992360814@redhat.com> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: Martin Gadbois <martin.gadbois@colubris.com>,
    linux-mtd@lists.infradead.org
Subject: Re: unable to modify jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 17:29:15 +0100
Message-ID: <7905.992363355@redhat.com>
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

xde@inventel.fr said:
>  jffs2_reserve_space(): Requested 0x2c bytes
>  jffs2_reserve_space(): alloc sem got 
> Short on space, but total dirty size 0x0000002c < sector size 0x00020000, so -ENOSPC 

Looks like your filesystem is too full. You need at least 5 erase blocks 
free. How big was the jffs2 image you put on it?

--
dwmw2
