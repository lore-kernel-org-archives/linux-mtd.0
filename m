Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8LTa-0006CM-WC
 for linux-mtd@lists.infradead.org; Sun, 11 Aug 2013 02:33:51 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so2028668pdj.32
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 19:33:29 -0700 (PDT)
Date: Sat, 10 Aug 2013 19:33:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 05/15] mtd: nand: pxa3xx: Support command buffer #3
Message-ID: <20130811023317.GA15447@norris.computersforpeace.net>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130810234814.62395380@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130810234814.62395380@skate>
Cc: Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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

On Sat, Aug 10, 2013 at 11:48:14PM +0200, Thomas Petazzoni wrote:
> On Sat, 10 Aug 2013 16:34:55 -0300, Ezequiel Garcia wrote:
> > Some newer controllers support a fourth command buffer. This additional
> > command buffer allows to set an arbitrary length count, using the
> > NDCB3.NDLENCNT field, to perform non-standard length operations
> > such as the ONFI parameter page read.
> > 
> > In controllers without this register, the operation has no effect.
> 
> Are you sure this is true? I thought you had this statement in earlier
> revisions of your patch set, but one of the comment was precisely that
> this patch was breaking platforms that did not have this register, and
> this lead you to introduce the separate compatible string.

It appears as if he didn't change the commit message properly. He does
now protect the fourth command buffer (?) with this:

+		/* NDCB3 register is available in NFCv2 (Armada 370/XP SoC) */
+		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+			nand_writel(info, NDCB0, info->ndcb3);

> I must admit, I'm also a bit confused by the existing code:
> 
>  		nand_writel(info, NDCB0, info->ndcb0);
>  		nand_writel(info, NDCB0, info->ndcb1);
>  		nand_writel(info, NDCB0, info->ndcb2);
> 
> but it's probably because I don't know much about NAND and the
> registers of this controller.

Brian
