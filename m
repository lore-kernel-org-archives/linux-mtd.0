Received: from inp.nsk.su ([193.124.167.24] helo=inpbox.inp.nsk.su)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmYpw-0004kx-6T
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 10:09:49 -0400
Date: Mon, 19 Jul 2004 21:01:13 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1090243692.29112.34.camel@weaponx.rchland.ibm.com>
Message-ID: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
Reply-To: D.A.Fedorov@inp.nsk.su
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Jul 2004, Josh Boyer wrote:
> On Mon, 2004-07-19 at 07:49, Dmitry A. Fedorov wrote:
> > 
> > In previous MTD releases there was kernel config parameters
> > CONFIG_MTD_PHYSMAP_START and CONFIG_MTD_PHYSMAP_LEN
> > and it was enough to provide these parameters at kernel' .config
> > for physmap driver and new board worked. Now I should write my own board
> > map driver.
> > Why? It is better to restore this nice feature.
> 
> That feature hasn't been removed...  that's why I said "If there isn't a
> specific map driver for your board, see physmap.c".  So physmap is still
> there.
>
> However, some people prefer to write their own map drivers for their
> boards for various reasons.  I was simply presenting all the options. 

Yes, physmap.c, but now I can't specify address/length for it
from kernel .config parameters. Instead, I should create my own module
and place it before physmap.o in Makefile.

Well, what about generic physmap board module?
I can make patch.
