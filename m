Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlURj-0007o6-9P
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 13:25:32 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J05002CJ4EDQC40@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 31 May 2006 13:25:25 -0400 (EDT)
Date: Wed, 31 May 2006 13:25:25 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <447DC80E.6040604@yandex.ru>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-id: <Pine.LNX.4.64.0605311314060.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
	<1149086997.32620.101.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>
	<447DC80E.6040604@yandex.ru>
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 May 2006, Artem B. Bityutskiy wrote:

> Nicolas Pitre wrote:
> > > The Idea still stays unchanged - it's a thin layer over mtd->type.
> > > Implement it differently.
> > 
> > I'm glad you say yourself that it is an extra (IMHO unneeded) layer over
> > mtd->type.
> Although it is a layer, it makes no additional overhead. But it makes MTD
> completely independent on features people may think of.

This is the fundamental differences between our views.

I just can't agree with the "additional layer makes no additional 
overhead" assertion. Sorry.

> > It is an extra layer over mtd->type.  That's the drawback.
> It's a plus: better layering, no overhead, more independence to MTD core.

And while this sentence sounds like marketing, I makes no sense to me 
technically.

Anyway, I give up.  Let's agree to disagree and leave it at that.
It's up to David to decide who is right and who is wrong.


Nicolas
