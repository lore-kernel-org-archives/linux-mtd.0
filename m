Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MpYB-00046E-JR
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 14:40:35 +0100
Date: Mon, 2 Jun 2003 15:41:11 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vikram Mehta <vm6580@hotmail.com>
Message-ID: <20030602134111.GB21902@wohnheim.fh-wedel.de>
References: <Law14-F110mn26PjxIS00027e5c@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law14-F110mn26PjxIS00027e5c@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Error after putting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2003 18:24:56 +0530, Vikram Mehta wrote:
> 
> >> Call Trace:
> >>         [<10c1b2d0>] [<10c1b0ea>] [<10c1b2d0>] [<10c1b0ea>]
> >>         [<10c1b2d0>] [<10c1b0ea>] [<10c1b2d0>] [<10c1b662>]
> >>         [<10c19e76>] [<10c19d9a>] [<10c19b6c>] [<10c13dae>]
> >
> >>
> >> What is wrong here
> >
> >You haven't decoded the oops. Numbers along are meaningless.
> >
> >--
> >dwmw2
> 
> 
> How do I decode the oops

ksymoops -v <vmlinux> -s <System.map> -K -L -O

Replace <vmlinux> and <System.map> with something useful or look into
the man page, if you don't have either one.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
