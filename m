Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159kH9-0000Wq-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 10:15:51 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id LAA08076
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 11:21:08 +0200 (CEST)
Message-ID: <3B25DE97.D2041C9@inventel.fr>
Date: Tue, 12 Jun 2001 11:19:19 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: problem with util
References: <3B24EC1B.7F920021@inventel.fr>  <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com>
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

Hello,
I compiled util for ARM and my computer(INTEL) ;

Is zlib-1.1.3 the right version to link with (ARM) ?
I was compelled to replace every memset calls by loops since __memzero
is not recognized in my system (ARM and INTEL) !!! Known problem ? Any
work around ?

And for my system (INTEL), I add a path to 2.4.2 headers since my system
is 2.2.18...

Xavier
