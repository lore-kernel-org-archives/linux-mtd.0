Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aq720-0001ix-Qk
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 08:44:40 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HST002186XV3S@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 09:44:20 +0100 (MET)
Date: Mon, 09 Feb 2004 09:42:27 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <402742B0.9030400@elsoft.ch>
To: "David =?iso-8859-1?q?M=FCller?= (ELSOFT AG)" <d.mueller@elsoft.ch>,
 linux-mtd@lists.infradead.org
Message-id: <200402090942.27210.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-disposition: inline
References: <200402081722.19858.joshua@joshuawise.com>
 <200402090807.49862.tglx@linutronix.de> <402742B0.9030400@elsoft.ch>
Subject: 
	Re: Fwd: Re: JFFS2 NAND support - Mount failure on "good" filesystem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 February 2004 09:20, David M=FCller (ELSOFT AG) wrote:
> Hello
>
> Thomas Gleixner wrote:
> > Update of /home/cvs/mtd/drivers/mtd/nand
> > In directory phoenix.infradead.org:/tmp/cvs-serv15636
>
> What about accesses which cross a block boundary. I think this case is
> still not correctly handled.

This is handled by JFFS2 /YAFFS correct. I don't see any reason to take car=
e=20
of it in the driver

=2D-=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
