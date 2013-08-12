Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8uCg-0004Kc-G8
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 15:38:43 +0000
Date: Mon, 12 Aug 2013 12:38:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 05/15] mtd: nand: pxa3xx: Support command buffer #3
Message-ID: <20130812153819.GB2413@localhost>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130810234814.62395380@skate>
 <20130811023317.GA15447@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130811023317.GA15447@norris.computersforpeace.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
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

On Sat, Aug 10, 2013 at 07:33:18PM -0700, Brian Norris wrote:
> On Sat, Aug 10, 2013 at 11:48:14PM +0200, Thomas Petazzoni wrote:
> > On Sat, 10 Aug 2013 16:34:55 -0300, Ezequiel Garcia wrote:
> > > Some newer controllers support a fourth command buffer. This additional
> > > command buffer allows to set an arbitrary length count, using the
> > > NDCB3.NDLENCNT field, to perform non-standard length operations
> > > such as the ONFI parameter page read.
> > > 
> > > In controllers without this register, the operation has no effect.
> > 
> > Are you sure this is true? I thought you had this statement in earlier
> > revisions of your patch set, but one of the comment was precisely that
> > this patch was breaking platforms that did not have this register, and
> > this lead you to introduce the separate compatible string.
> 
> It appears as if he didn't change the commit message properly. He does
> now protect the fourth command buffer (?) with this:
> 
> +		/* NDCB3 register is available in NFCv2 (Armada 370/XP SoC) */
> +		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +			nand_writel(info, NDCB0, info->ndcb3);
> 

Indeed, I just forgot to update the commit message.

I'll prepare a new version to fix this.

> > I must admit, I'm also a bit confused by the existing code:
> > 
> >  		nand_writel(info, NDCB0, info->ndcb0);
> >  		nand_writel(info, NDCB0, info->ndcb1);
> >  		nand_writel(info, NDCB0, info->ndcb2);
> > 

In fact, I got confused as well when I first saw it.

However this behavior is specified in the Armada 370 (I can't find it in the public
PXA specs), which says that software must write either 12 or 16 bytes directly to
NDCB0, four bytes at a time to load the commands in NDCB0, NDCB1, NDCB2, (and optionally
NDCB3).

Writes to NDCB1, NDCB2 and NDCB3 are ignored but each NDCBx register can be read.

I'll add this information as a comment to the above confusing sequence
in the next soon to come version.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
