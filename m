Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cPPXV-0005WZ-Rs
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 08:06:20 +0000
Date: Fri, 6 Jan 2017 09:05:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: Fixes for 4.10-rc3
Message-ID: <20170106090556.5fa6a5a8@bbrezillon>
In-Reply-To: <20170105180710.GA138504@google.com>
References: <20170104211557.434b07af@bbrezillon>
 <20170105180710.GA138504@google.com>
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

On Thu, 5 Jan 2017 10:07:10 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Jan 04, 2017 at 09:15:57PM +0100, Boris Brezillon wrote:
> > Hi Brian,
> > 
> > Here is a fixes PR for 4.10-rc3 (or -rc4 if it's already too late for
> > -rc3).
> > 
> > The xway and oxnas fixes are fixing bugs introduced before 4.10-rc1. I
> > know fixes PRs are supposed to contain only fixes for bugs introduced by
> > code merged during the merge window, but I thought it would be good to
> > have them applied in this release.  
> 
> Actually, I thought all bugfixes are candidates (within reason of
> course) for post-rc1 merging, especially early rc's. I recall Linus
> saying things along the lines of "if it's a candidate for stable, then
> it's a candidate for an -rc" (i.e., don't wait until the next merge
> window).

Okay, good to know.

> 
> These really aren't a big deal anyway.
> 
> > Let me know if this is a problem, and I'll move them to my nand/next and
> > resend of PR.  
> 
> Pushed to linux-mtd.git. Thanks!

Thanks,

Boris

> 
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
