Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwVS-000642-4J
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:41:51 +0000
Received: by mail-pd0-f179.google.com with SMTP id w10so2743451pde.10
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 10:41:28 -0700 (PDT)
Date: Wed, 9 Apr 2014 10:35:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Message-ID: <20140409173527.GC32070@ld-irv-0074>
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
 <201404091043.38198.marex@denx.de>
 <20140409170720.GB32070@ld-irv-0074>
 <201404091927.31018.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201404091927.31018.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 07:27:30PM +0200, Marek Vasut wrote:
> btw Brian, completely off-topic, but is there a special ML for SPI NOR stuff or 
> is all of that going through linux-mtd ?

All on linux-mtd, AFAIK. Occasionally we'll CC linux-spi as well, since
Mark Brown was interested in some of this (mostly to keep "SPI NOR" out
of drivers/spi/, I think).

Brian
