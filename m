Received: from [210.241.255.67] (helo=mail.cable.net.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AqlvH-0007zj-3H
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 04:24:28 +0000
Message-ID: <001f01c3f056$cb926ad0$030910ac@linuxer>
From: "Pham Huy Vu" <vuph@mail.cable.net.tw>
To: "Pham Huy Vu" <vuph@mail.cable.net.tw>
References: 
	<00e301c3eb42$8dfbbc80$030910ac@linuxer><005101c3ec6a$85b05440$030910ac@linuxer><1076053877.12587.149.camel@imladris.demon.co.uk>
	<015701c3ed39$e540bdd0$030910ac@linuxer>
Date: Wed, 11 Feb 2004 12:22:53 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Copy files to jffs2 partition have problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I already fixed my bugs. Flash driver for amd can not handle alignment well.
Thank David Woodhouse, Jonas and mtd list.
Thanks.

----Mark Pham----

----- Original Message -----
From: "Pham Huy Vu" <vuph@mail.cable.net.tw>
To: "David Woodhouse" <postmaster@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Sent: Saturday, February 07, 2004 1:18 PM
Subject: Re: Copy files to jffs2 partition have problem


> Hi David Woodhouse,
> I use this version:
> * $Id: cfi_cmdset_0002.c,v 1.52 2001/10/24 09:37:30 dwmw2 Exp $
> This version have fixed this bug or not? Please give me your hints.
> Thanks.
> ----mark pham----
>
> ----- Original Message -----
> From: "David Woodhouse" <postmaster@infradead.org>
> To: "Pham Huy Vu" <vuph@mail.cable.net.tw>
> Cc: "Jonas Holmberg" <jonas.holmberg@axis.com>;
> <linux-mtd@lists.infradead.org>
> Sent: Friday, February 06, 2004 3:51 PM
> Subject: Re: Copy files to jffs2 partition have problem
>
>
> > On Fri, 2004-02-06 at 12:34 +0800, Pham Huy Vu wrote:
> > > Hi Jonas,
> > > Thanks for your reply,
> >
> > Your last message to the list was rejected, partly because you
> > top-posted. Yet you repeated the offence.
> >
> > Do it again and you get a personal entry in the blacklist.
> >
> > > Last[3] is 10, datum is 14000010
> > > Write of 71 bytes at 0x000fe494 failed. returned 0, retlen 68
> > > .....
> > > I think mtd driver is ok,
> > > I just think the jffs2 fs or mkfs.jffs2 have bugs???
> >
> > It's the other way around. The error you see is in the flash driver. We
> > really shouldn't have the top bits set in 'datum' if buswidth is 2. I
> > have a recollection of this bug having been fixed already. What version
> > of drivers/mtd/chips/cfi_cmdset_0002.c do you have? (The $ID:... $ tag
> > near the top of the file).
> >
> > --
> > dwmw2
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
