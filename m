Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwdQA-00043P-7T
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 05:41:44 -0500
Received: by wproxy.gmail.com with SMTP id i1so106040wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jan 2006 02:41:37 -0800 (PST)
Message-ID: <29f916510601110241v952772fge443a6620b647f00@mail.gmail.com>
Date: Wed, 11 Jan 2006 05:41:37 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: Peter Wippich <pewi@gw-instruments.de>
In-Reply-To: <Pine.LNX.4.33.0601111107380.26443-100000@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <29f916510601102154i4935a716g7ee1751465e21c3d@mail.gmail.com>
	<Pine.LNX.4.33.0601111107380.26443-100000@redbean.intranet.gw-instruments.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: sector locks handling for J3 flashes?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Peter,

Thanks for your reply.

If my partitions are to be used as read only jffs2 partitions ..
Will removing this unlock on these sectors harm anything ??

We are currently undergoing a whole exercise of locking flash sectors
to get past some random flash corruptions we are observing.

Can you please help me to point in code, where this unlock is being done ?

I am actually surprised that noone is running his / her boards with
flash sectors locked ?

I am new to embedded designs, but wont this be a pretty standard /
accepted practice to lock your flash sectors ?

Regards,
Alfred

On 1/11/06, Peter Wippich <pewi@gw-instruments.de> wrote:
>
> Hi Alfred,
>
> the original MTD driver unlocks all flash sector during initialization.
> However, this is a lenghty operation. Took about 2..3 seconds, depending
> on flash size. Uli Luckas has supplied a patch which does "lazy"
> unlocking. Each time a write / erase operation fails it unlocks the secto=
r
> and retries the operation. But this is only available for the latest 2.6
> kernel. You may have a look there and / or check Russel's patch history
> for the ARM linux kernel.
>
> Ciao,
>
> Peter
>
>
>
> On Wed, 11 Jan 2006, alfred hitch wrote:
>
> > Hi,
> >
> > I am trying to understand how it works for flash'es which have
> > Hardware flash protection.
> > Bootloader say locks say 1 partition, then linux kernel / MTD while com=
ing up
> > reads / probes flash (sector by sector) for locked sectors ?
> > If yes, and it maintain this in an internal software structure. Using
> > it when writes to partitions is done ?
> >
> > I hope linux kernel arm-linux2.4.25-x (snapgear 3.1) has support for
> > ixdp425 and Intel J3 Strata flash for automatic detection and working
> > with locked flashes ?
> >
> > Any one already tried this ?
> >
> > Regards,
> > Alfred
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
> |       Peter Wippich                   Voice: +49 30 46776411          |
> |       G&W Instruments GmbH            fax:   +49 30 46776419          |
> |       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
> |       D-13355 Berlin  / Germany                                       |
>
>
>
