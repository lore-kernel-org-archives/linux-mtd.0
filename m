Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL4eU-0005Oy-Hi
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 15:32:55 -0400
Date: Mon, 11 Apr 2005 15:30:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1113246941.7520.12.camel@windu.rchland.ibm.com>
Message-ID: <Pine.LNX.4.61.0504111529210.26939@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
	<1113238871.7520.3.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0504111509070.26633@localhost.localdomain>
	<1113246941.7520.12.camel@windu.rchland.ibm.com>
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

On Mon, 11 Apr 2005, Josh Boyer wrote:

> On Mon, 2005-04-11 at 15:09 -0400, Robert P. J. Day wrote:
> > On Mon, 11 Apr 2005, Josh Boyer wrote:
> >
> > > See drivers/mtd/maps/mphysmap.c
> >
> > ah, there is no such map file in my kernel source tree 2.6.11.7, so
> > that's obviously new.  CVS?
>
> Yep.  IIRC, it should be in the latest -mm too.

excellent.  so that CVS update should drop in nicely into a 2.6.11.x
source tree, i'm assuming.

and just one more clarification -- what is the current "physmap.c"
capable of in terms of multiple chips and auto-detection?  just
curious.

rday
