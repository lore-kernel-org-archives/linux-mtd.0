Received: from casablanca.magic.fr ([195.154.101.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159rnc-0001Rt-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 18:17:52 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by casablanca.magic.fr (8.9.3/8.9.3) with ESMTP id TAA13822
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 19:23:22 +0200 (CEST)
Message-ID: <3B264F9D.9321AAE5@inventel.fr>
Date: Tue, 12 Jun 2001 19:21:33 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Martin Gadbois <martin.gadbois@colubris.com>,
        linux-mtd@lists.infradead.org
Subject: Re: unable to modify jffs2
References: <3B26459F.1F275CB1@inventel.fr>  <3B26429A.5686E897@inventel.fr> <3B2635B4.63D6D647@colubris.com> <3B260CB7.E1513BBD@inventel.fr> <3B25FEB8.A00FCE03@inventel.fr> <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> <3161.992348379@redhat.com> <5586.992349315@redhat.com> <3B261F73.BF7325E1@inventel.fr> <3B2632EA.B38B039C@inventel.fr> <1776.992360814@redhat.com> <7905.992363355@redhat.com> <9954.992364198@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

David Woodhouse a écrit :
> 
> xde@inventel.fr said:
> > the file I have written on my 2Meg partition was only 1.5Meg
> 
> Sorry, I missed that. Too big.
> 
> > So if you say that it needs at least 5 free blocks, it means that I
> > need 5 blocks of 128KB, so at least 650KB free!!! Is it necessary ?
> 
> > In fact if this is true, a 2MB partition is to short...
> 
> At the moment, yes. JFFS2 requires a _lot_ of slack space. Actually it's
> probably safe to cut that down to three. Nobody's yet proved that though -
> YMMV. Eventually I intend to cut it down to one or two and prove that it's
> safe.
> 
> --
> dwmw2

It seems to work with a 4MB partition.

So, is it possible to define the size of a block inferior to the size of
the erase block ?
For example, erase size is 128KB and block size is 64KB.

Xavier
