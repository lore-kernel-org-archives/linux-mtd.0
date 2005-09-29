Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EL4Zz-0005hh-H2
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 16:01:23 -0400
Date: Thu, 29 Sep 2005 13:00:18 -0700 (PDT)
From: Linus Torvalds <torvalds@osdl.org>
To: Deepak Saxena <dsaxena@plexity.net>
In-Reply-To: <20050929195205.GA30002@plexity.net>
Message-ID: <Pine.LNX.4.58.0509291259110.3308@g5.osdl.org>
References: <20050929195205.GA30002@plexity.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix IXP4xx MTD driver no cast warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 29 Sep 2005, Deepak Saxena wrote:
> 
> drivers/mtd/maps/ixp4xx.c: In function 'ixp4xx_flash_probe':
> drivers/mtd/maps/ixp4xx.c:199: warning: assignment makes integer from
> pointer without a cast

Please don't. The warning is entirely warranted, as far as I can tell.

Shutting up warnings just because they are warnings is bad practice. 
Either fix them, or leave them be.

If you do an "ioremap()", then the result is a "(void __iomem *)". If you 
assign it to something that is "unsigned long", you _should_ get a 
warning.

		Linus
