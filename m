Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159vOH-0001kU-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 22:07:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B264F9D.9321AAE5@inventel.fr> 
References: <3B264F9D.9321AAE5@inventel.fr>  <3B26459F.1F275CB1@inventel.fr> <3B26429A.5686E897@inventel.fr> <3B2635B4.63D6D647@colubris.com> <3B260CB7.E1513BBD@inventel.fr> <3B25FEB8.A00FCE03@inventel.fr> <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> <3161.992348379@redhat.com> <5586.992349315@redhat.com> <3B261F73.BF7325E1@inventel.fr> <3B2632EA.B38B039C@inventel.fr> <1776.992360814@redhat.com> <7905.992363355@redhat.com> <9954.992364198@redhat.com> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: Martin Gadbois <martin.gadbois@colubris.com>,
    linux-mtd@lists.infradead.org
Subject: Re: unable to modify jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 22:10:16 +0100
Message-ID: <11419.992380216@redhat.com>
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
>  So, is it possible to define the size of a block inferior to the size
> of the erase block ? For example, erase size is 128KB and block size
> is 64KB. 

Absolutely not possible. You cannot erase only a 64KiB region - you _must_ 
erase 128KiB at a time.

Cutting down JFFS2's requirements is possible. It's just a matter of time. 
I'm happy to give you pointers, or it's on my TODO list for attention in 
my Copious Spare Time (tm).

Or talk to my pimp.

--
dwmw2
