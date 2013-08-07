Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V73OU-0007d9-7n
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 13:03:15 +0000
Date: Wed, 7 Aug 2013 10:02:45 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH v2 00/14] pxa3xx-nand patches to support mvebu builds
Message-ID: <20130807130244.GA18270@localhost>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <52024167.9090208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52024167.9090208@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 07, 2013 at 02:45:27PM +0200, Daniel Mack wrote:
> On 07.08.2013 14:31, Ezequiel Garcia wrote:
> > Hello everyone!
> > 
> > This patchset is part of the work I'm doing to enable the pxa3xx-nand
> > driver to support the NAND controller in Armada 370/XP. While this is
> > work in progress, here's a subset of patches I consider good enough
> > for mainline.
> 
> Nice. For the whole series:
> 
>   Tested-by: Daniel Mack <zonque@gmail.com>
> 

Thanks Daniel!

FWIW, there's room for another bunch of cleanups.

For instance, the driver does its own device detection which should be
handled by the NAND core instead. I have a few patches to take care of this
but they far more intrusive changes. Therefore I'm postponing them until
I carefully review them to prevent regressions.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
