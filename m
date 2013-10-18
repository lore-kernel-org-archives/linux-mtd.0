Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX6R6-0005ad-9J
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 09:33:36 +0000
Date: Fri, 18 Oct 2013 06:33:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Fix registered MTD name
Message-ID: <20131018093316.GA18998@localhost>
References: <1382001897-2709-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131018013618.GI23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131018013618.GI23337@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 17, 2013 at 06:36:18PM -0700, Brian Norris wrote:
> On Thu, Oct 17, 2013 at 06:24:57AM -0300, Ezequiel Garcia wrote:
> > In a recent commit:
> > 
> >   commit f455578dd961087a5cf94730d9f6489bb1d355f0
> >   Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >   Date:   Mon Aug 12 14:14:53 2013 -0300
> > 
> >   mtd: nand: pxa3xx: Remove hardcoded mtd name
> > 
> >   There's no advantage in using a hardcoded name for the mtd device.
> >   Instead use the provided by the platform_device.
> > 
> > The MTD name was changed to use the one provided by the platform_device.
> > However, this can be problematic as some users want to set partitions
> > using the kernel parameter 'mtdpart', where the name is needed.
> > 
> > For that reason, using a simpler and easier to remember name such
> > as 'pxa3xx-nand' is certainly a better choice.
> 
> Hmm, if we're really interested in the user experience of 'mtdparts'
> users, shouldn't we just revert to the old name ("pxa3xx_nand-0") to
> avoid breaking systems? Or are there no users that would care?
> 

Dammit! yes, that's the intention of this patch: revert to the old name
"pxa3xx_nand-0" to avoid breaking systems.

Guess I couldn't manage my OCD and picked a more appealing name :)

I'll send a v2 right away.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
