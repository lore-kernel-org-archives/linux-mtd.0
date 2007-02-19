Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJGwA-0008K8-8h
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 17:24:50 -0500
Date: Mon, 19 Feb 2007 22:20:41 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Felix Fietkau <nbd@openwrt.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070219222041.GE7813@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1171920579.4996.8.camel@celeron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 February 2007 22:29:39 +0100, Felix Fietkau wrote:
> 
> Hi, I have a small fix for a crash that happened when I was using jffs2
> in combination with block2mtd.c
> 
> In the erase function when checking the block to see if it's already
> erased, the limit is to be set to the page_address(page) + PAGE_SIZE,
> but because the variable has the type (ulong *), it gets set to
> PAGE_SIZE*sizeof(ulong), which makes the kernel oops when the page is
> very close to the end of RAM.

Good catch!  What a twisted little piece of code you've found.

> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> 
> --- linux.dev/drivers/mtd/devices/block2mtd.c.old	2007-02-18 14:08:59.519952312 +0100
> +++ linux.dev/drivers/mtd/devices/block2mtd.c	2007-02-18 14:09:04.219237912 +0100
> @@ -111,7 +111,7 @@
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>  
> -		max = (u_long*)page_address(page) + PAGE_SIZE;
> +		max = (u_long*) ((u8 *) page_address(page) + PAGE_SIZE);
>  		for (p=(u_long*)page_address(page); p<max; p++)
>  			if (*p != -1UL) {
>  				lock_page(page);

The proper fix would be to remove the cast instead of adding yet
another.  I wonder when those got added.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
