Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL4Iy-0004in-DG
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 15:10:41 -0400
Date: Mon, 11 Apr 2005 15:08:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Michael <xemc@yahoo.com>
In-Reply-To: <20050411164702.13787.qmail@web52707.mail.yahoo.com>
Message-ID: <Pine.LNX.4.61.0504111505580.26633@localhost.localdomain>
References: <20050411164702.13787.qmail@web52707.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 Apr 2005, Michael wrote:

>
> > i did a bit more reading last night and concluded that the
> > PHYSMAP stuff would let me define a single flash chip but no
> more.
> > so if i want multiple chips, it *appears* that i have to write a
> > maps file.
> >
> > rday
>
> Could an alternative be to extend the physmap stuff to handle
> multiple chips?  If situations like yours are more common, this
> solution will make it simpler for all.

i'd thought of that and was already looking at the code.  i think
that, as a start, it wouldn't be hard to add support for multiple,
*identical* chips, each with an arbitrary starting address.

this is what we have here.  is this scenario common enough to warrant
adding that kind of support to physmap?  i can't imagine it would be
that hard.

rday
