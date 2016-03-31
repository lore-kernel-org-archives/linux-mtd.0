Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alY1Y-0005Ar-O7
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 08:32:18 +0000
Date: Thu, 31 Mar 2016 10:31:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>
Subject: Re: Adding the nand/next branch to linux-next
Message-ID: <20160331103154.22e1687e@bbrezillon>
In-Reply-To: <20160331092432.111d2edf@canb.auug.org.au>
References: <20160330161538.1cfb928d@bbrezillon>
 <20160331092432.111d2edf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 31 Mar 2016 09:24:32 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Boris,
> 
> On Wed, 30 Mar 2016 16:15:38 +0200 Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >
> > I recently became maintainer of the NAND flash subsystem, and, if you
> > don't mind, I'd like to add my nand/next branch [1] to linux-next.
> > 
> > [1]git://github.com/linux-nand/linux.git nand/next
> 
> Added from today.

Thanks.

> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
