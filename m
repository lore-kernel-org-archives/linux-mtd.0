Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1759bu-0004wo-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 19:22:50 +0100
Received: from diva.localdomain (host213-122-14-234.in-addr.btopenworld.com [213.122.14.234])
	by sparta.scl.co.uk (8.9.3/8.9.3) with ESMTP id TAA17579
	for <linux-mtd@lists.infradead.org>; Tue, 7 May 2002 19:22:50 +0100
Received: from diva.localdomain (IDENT:root@diva.localdomain [192.168.1.1])
	by diva.localdomain (8.12.2/8.12.2) with SMTP id g47INWHI021018
	for <linux-mtd@lists.infradead.org>; Tue, 7 May 2002 19:23:32 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: patches to 2.4.18
Date: Tue, 7 May 2002 19:10:28 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <02050719233200.21005@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
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

David Woodhouse dwmw2@infradead.org wrote:
> jim@musenki.com said:
> >  Also, I (like so many others lately), had to comment out the call to
> > invalidate_device() in mtdblock.c::mtdblock_release() in order to get
> > my root filesystem (jffs2 on mtdblock on Intel Strataflash) to mount.
>
> > I note that the call is still there in the CVS vsion:
>
> Eep. That was removed from CVS long ago, but was added back again. I've
> now  removed it again.
>
> >  and we are getting crashes on halt/reboot if we've modified the
> > filesystem.=20
>
> More details please.
>
> >  Similar questions about jffs2 have been asked:
> >       http://mhonarc.axis.se/jffs-dev/msg01297.html
> > With no apparent answer.
> > anyone with clue to offer?=20
>
> For the MTD drivers, the code in 2.4.19-pre is probably the best option=
=20
> unless you need the new features I held back for 2.4.20-pre. For JFFS2,
> you  should be using the code from the jffs2-2_4-branch in CVS. I _thin=
k_
> that's  all been sent to Marcelo for 2.4.19 though.=20

I'm a newbie with CVS... but the paragraph above makes it sound like ther=
e
are a number of different branches, and that the one I need is called
2.4.19-pre.  So I tried:

cvs -d:pserver:anoncvs@cvs.infradead.org:/home/cvs co -r 2.4.19-pre mtd

but got back:

cvs [server aborted]: Numeric tag 2.4.19-pre contains characters other th=
an digits and '.'

So I tried:

cvs -d:pserver:anoncvs@cvs.infradead.org:/home/cvs co -r 2.4.19 mtd

and that seemed to work i.e. it said the right things about "Updating mtd=
"
etc but actually it downloaded nothing ;-(

Help much appreciated!

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
