Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159iti-0000Mi-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 08:47:35 +0100
Received: from jerusalem.magic.fr ([195.154.101.82])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 159UEF-0001lP-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 17:07:47 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id SAA22665
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 18:06:30 +0200 (CEST)
Message-ID: <3B24EC1B.7F920021@inventel.fr>
Date: Mon, 11 Jun 2001 18:04:43 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: problem with zlib.o
References: <991934470.27485.0.camel@timmy>  <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com>
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
I have some problems with linking the mtd stuff with a 2.4.2 kernel on
ARM.
I got many of the followings :

drivers/net/net.o: In function `deflate':
drivers/net/net.o(.text+0x8b38): multiple definition of `deflate'
fs/fs.o(.text+0x63db0):/home/xde/arm_linux/linux_2.4/linux-2.4.2/linux/fs/jffs2/zlib.c:
first defined here
drivers/net/net.o: In function `_tr_flush_block':
drivers/net/net.o(.text+0xba9c): multiple definition of
`_tr_flush_block'
fs/fs.o(.text+0x66d14):/home/xde/arm_linux/linux_2.4/linux-2.4.2/linux/fs/jffs2/zlib.c:
first defined here

what I did is removing from jffs2/Makefile zlib.o in COMPR_OBJS...
and linking is then ok...

Is it a good work around ?

Xavier
