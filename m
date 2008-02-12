Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JOwex-0006gS-Nc
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 15:03:07 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1CF2wwD018788
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2008 10:02:58 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1CF2wXQ205316
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2008 10:02:58 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1CF2voo025078
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2008 10:02:57 -0500
Date: Tue, 12 Feb 2008 09:02:04 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Christophe Lohr <christophe.lohr@cegetel.net>
Subject: Re: how to mount this mtd filesystem image?
Message-ID: <20080212090204.66828fd7@zod.rchland.ibm.com>
In-Reply-To: <47B1A74B.5020908@cegetel.net>
References: <47B07A44.6030003@enst-bretagne.fr> <47B19690.10009@gmail.com>
	<47B1A74B.5020908@cegetel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 12 Feb 2008 15:03:55 +0100
Christophe Lohr <christophe.lohr@cegetel.net> wrote:

> Max Stirling:
> 
> >>
> >> My problem is as follow: I have an mtd dump file. This is not a jffs2 
> >> file system image. It looks like a plain old flash file system, but 
> >> which one? How may I get the content of this file system?
> >>
> >> 00000000 46 66 73 23 00 03 01 00 c0 ff ff ff ff ff ff ff 
> >> |Ffs#............|
> >> 00000010 2f 66 66 73 2d 72 6f 6f 74 00 ff ff ff ff ff ff 
> >> |/ffs-root.......|
> >> 00000020 2e 6a 6f 75 72 6e 61 6c 00 ff ff ff c0 00 03 00 
> >> |.journal........|
> >> 00000030 02 00 00 00 c0 00 04 00 03 00 00 00 c0 00 05 00 
> >> |................|
> >> 00000040 04 00 00 00 c0 00 06 00 05 00 00 00 c0 00 07 00 
> >> |................|
> >> 00000050 06 00 00 00 c0 00 08 00 07 00 00 00 c0 00 09 00 
> >> |................|
> >>
> > The first four bytes are the magic numbers telling which flash fs this 
> > might be.
> >
> > I did a search for those numbers and couldn't find any reference to 
> > this anywhere. Try doing "file <your-mtd-dump-file> this might give 
> > more information
> 
> The answer is:     "data"
> :-(
> 
> Note: in fact, this file system is used by a "Nucleus Plus" system 
> executed by a DSP, side to an ARM proc (that executes a Linux). It might 
> be very specific to Nucleus Plus.

I recall some tool being in mtd-utils called "mk.ffs" (or something
similar) at one point.  It's since been deleted as it was considered
old and obsolete.  I'm not sure of anything that still has support for
that.

josh
