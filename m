Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFoQD-0008JL-6h
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2013 16:53:14 +0000
Date: Sat, 31 Aug 2013 13:53:01 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 01/14] mtd: nand: pxa3xx: Remove unneeded ifdef
 CONFIG_OF
Message-ID: <20130831165300.GB2404@localhost>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376327699-7973-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377893182.22372.83.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377893182.22372.83.camel@shinybook.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 30, 2013 at 09:06:22PM +0100, David Woodhouse wrote:
> On Mon, 2013-08-12 at 14:14 -0300, Ezequiel Garcia wrote:
> > There's no need to enclose this code within idef CONFIG_OF,
> > because the OF framework provides no-op stubs if CONFIG_OF=n.
> 
> Hm, won't this end up with the same 'pxa3xx_nand_dt_ids is defined but
> not used' warning that just caused us to *add* an #ifdef CONFIG_OF to
> atmel_nand? 
> 

No, it won't.

Currently atmel_nand uses its of_device_id for just the of_match_table,
while pxa3xx-nand uses the pxa3xx_nand_dt_ids for more than just that,
as a paramater for of_match_device().

The latter prevents the warning by having an actual dummy-inlined
implementation for the !OF case.

I'll answer about the atmel_nand in the respective patch.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
