Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKtLB-0000ei-0E
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 04:00:38 -0400
Date: Thu, 29 Sep 2005 10:00:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20050929080037.GD16687@wohnheim.fh-wedel.de>
References: <20050928234254.GA21547@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050928234254.GA21547@plexity.net>
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix ixp4xx MTD driver module build
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 September 2005 16:42:54 -0700, Deepak Saxena wrote:
> 
> Missing ';' breaks module build.
> 
> Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> 
> diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -254,6 +255,6 @@ module_init(ixp4xx_flash_init);
>  module_exit(ixp4xx_flash_exit);
>  
>  MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems")
> +MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems");
>  MODULE_AUTHOR("Deepak Saxena");

Applied to mtd cvs.  (Actually, with cvs it was easier to just redo
the change myself, but basically...)

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
