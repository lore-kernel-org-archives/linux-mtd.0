Received: from mail-by2on0112.outbound.protection.outlook.com
 ([207.46.100.112] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhpBs-00019T-5Z
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2015 00:59:01 +0000
Message-ID: <1428973108.22867.656.camel@freescale.com>
Subject: Re: Missing support for ECC_SOFT_BCH in fsl-elbc-nand
From: Scott Wood <scottwood@freescale.com>
To: Tomas Hlavacek <tomas.hlavacek@nic.cz>
Date: Mon, 13 Apr 2015 19:58:28 -0500
In-Reply-To: <419241df-e18f-42f2-83d8-a6f056a5de74@nic.cz>
References: <55156575.8080704@nic.cz>
 <5a117ed2-8cb4-4f55-9098-ff622066db4e@nic.cz>
 <1428952353.22867.621.camel@freescale.com>
 <419241df-e18f-42f2-83d8-a6f056a5de74@nic.cz>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Martin =?UTF-8?Q?Strba=C4=8Dka?= <martin.strbacka@nic.cz>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-04-13 at 23:56 +0200, Tomas Hlavacek wrote:
> Hi!
> 
> On Monday, April 13, 2015 9:12:33 PM CEST, Scott Wood wrote:
> > On Mon, 2015-04-13 at 00:30 +0200, Tomas Hlavacek wrote:
> >> 1) How to disable HW ECC?
> >> 
> >> What I have done is this:
> >> 
> >> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c  ...
> >
> > You shouldn't be setting BR_DECC if you don't want to use HW ECC, so
> > this ifdef doesn't accomplish anything.
> >
> > Also, while a compile-time hack may be suitable for your own use, to get
> > a mergable patch it should be a runtime decision.  You should be able to
> > read at runtime the level of ECC that the flash requires.
> 
> How? Could you please point me to some starting point what to read in order 
> to implement it?

The information should be in the chip's identification bytes, either via
ONFI or a manufacturer-specific format.  Or, if that's too complicated,
at least indicate the type of ECC to be used in the device tree.

-Scott
