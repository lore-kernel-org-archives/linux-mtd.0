Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8H1g-0004K2-75
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 21:48:45 +0000
Date: Sat, 10 Aug 2013 23:48:14 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 05/15] mtd: nand: pxa3xx: Support command buffer #3
Message-ID: <20130810234814.62395380@skate>
In-Reply-To: <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-6-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
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

Dear Ezequiel Garcia,

On Sat, 10 Aug 2013 16:34:55 -0300, Ezequiel Garcia wrote:
> Some newer controllers support a fourth command buffer. This additional
> command buffer allows to set an arbitrary length count, using the
> NDCB3.NDLENCNT field, to perform non-standard length operations
> such as the ONFI parameter page read.
> 
> In controllers without this register, the operation has no effect.

Are you sure this is true? I thought you had this statement in earlier
revisions of your patch set, but one of the comment was precisely that
this patch was breaking platforms that did not have this register, and
this lead you to introduce the separate compatible string.

I must admit, I'm also a bit confused by the existing code:

 		nand_writel(info, NDCB0, info->ndcb0);
 		nand_writel(info, NDCB0, info->ndcb1);
 		nand_writel(info, NDCB0, info->ndcb2);

but it's probably because I don't know much about NAND and the
registers of this controller.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
