Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 151lo2-0007cY-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 10:16:50 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id LAA15791
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 11:20:59 +0200 (CEST)
Message-ID: <3B08DDC7.EEF7CDF0@inventel.fr>
Date: Mon, 21 May 2001 11:20:07 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: Amit D Chaudhary <amitc@brocade.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: how to make
References: <3B01495C.A7CC459A@inventel.fr> <3B058523.2060107@brocade.com>
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

It works perfectly on the kernel 2.4.2... and somehow, to use jffs2,
people need to move on later kernel than 2.4.0-test6 since many headers
in the kernel have changed. So, I'm moving toward that new kernel.

Amit D Chaudhary a écrit :
> 
> You sure you have MTD* enabled in your .config?
> Please send more information next time including .config, make output, etc.
> 
> Amit
> 
> Xavier DEBREUIL wrote:
> 
> > I got the 20010306 version working on my board and now I would like to use jffs2
> > ; so, I got the last source version from the cvs access from yesterday and copy
> > necessary files in my kernel tree ; then make clean, xconfig, and Image but it
> > does not compile mtdchar or mtdblock and nothing in fact. I am using the
> > 2.4.0-test6 kernel. Did I miss something obvious ?
> > Do I have to modify Makefiles by hand ?
> >
> > Xavier
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
