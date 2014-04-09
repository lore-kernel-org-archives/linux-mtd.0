Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwaQ-0006H4-Am
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:46:58 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Date: Wed, 9 Apr 2014 19:37:38 +0200
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
 <201404091927.31018.marex@denx.de> <20140409173527.GC32070@ld-irv-0074>
In-Reply-To: <20140409173527.GC32070@ld-irv-0074>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091937.38333.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 07:35:27 PM, Brian Norris wrote:
> On Wed, Apr 09, 2014 at 07:27:30PM +0200, Marek Vasut wrote:
> > btw Brian, completely off-topic, but is there a special ML for SPI NOR
> > stuff or is all of that going through linux-mtd ?
> 
> All on linux-mtd, AFAIK. Occasionally we'll CC linux-spi as well, since
> Mark Brown was interested in some of this (mostly to keep "SPI NOR" out
> of drivers/spi/, I think).

OK, this makes sense. Thanks!

Best regards,
Marek Vasut
