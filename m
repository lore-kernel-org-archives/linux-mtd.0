Received: from casablanca.magic.fr ([195.154.101.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159oTp-00011g-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 14:45:14 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by casablanca.magic.fr (8.9.3/8.9.3) with ESMTP id PAA03427
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 15:50:38 +0200 (CEST)
Message-ID: <3B261F73.BF7325E1@inventel.fr>
Date: Tue, 12 Jun 2001 15:56:03 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: unable to mount jffs2
References: <3B260CB7.E1513BBD@inventel.fr>  <3B25FEB8.A00FCE03@inventel.fr> <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> <3161.992348379@redhat.com> <5586.992349315@redhat.com>
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

David Woodhouse wrote:
> 
> xde@inventel.fr said:
> >  yes, no '-e' option since I want to use the default 64KiB as
> > indicated in the help ; is it optional or not ? if not, I will notify
> > it in the future.
> 
> It's optional. You don't _need_ to specify it if your erase size is larger
> than 64KiB. Yours appears to be 128KiB.

Oooops... Sorry, of course, I have two flash in parallel so 2 sectors of
64kbytes means 128kbytes.

for the ftp point of view, I was using ncftp which seems to not work properly on
my system...
netkit-ftp is ok and I can mount the jffs2 now.

Xavier

> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
