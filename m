Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL4Mc-0004s3-6m
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 15:14:32 -0400
Date: Mon, 11 Apr 2005 15:11:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <425AAEF2.3040903@netwinder.org>
Message-ID: <Pine.LNX.4.61.0504111510410.26633@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
	<425AAEF2.3040903@netwinder.org>
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

On Mon, 11 Apr 2005, Ralph Siemsen wrote:

> Robert P. J. Day wrote:
>
> > i did a bit more reading last night and concluded that the PHYSMAP
> > stuff would let me define a single flash chip but no more.  so if i
> > want multiple chips, it *appears* that i have to write a maps file.
>
> If the chips are of the same type, physmap.c will do what you want - just give
> it the total size of flash space.  Eg. if you have two 32M chips then give the
> size as 64M.  The MTD code is will probe and discover the two chips
> automatically.  Be sure you specify the interleave correctly too.

and this would work regardless of the addresses of the two chips?
i'll have to look at the code more carefully.

> If the chips are of different types, then the more recent mphysmap.c
> is probably what you need.  (I haven't tried this one).

just got josh's post, i'll be looking into that shortly once i figure
out the best place to get it.

rday
