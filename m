Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAlxk-0000Th-PN
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 06:08:27 -0400
Date: Thu, 1 Sep 2005 12:05:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
Message-ID: <20050901100535.GA30932@wohnheim.fh-wedel.de>
References: <1125480492.18626.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125480492.18626.42.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 August 2005 11:28:12 +0200, Øyvind Harboe wrote:
> 
> The attached patch allows JFFS2 to write to really small JFFS2 disks.
> 
> This is e.g. useful when using JFFS2 for in-system one time programming
> of embedded device parameters: serial number, MAC, etc.
> 
> Comments?

> Index: build.c
> ===================================================================
> RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
> retrieving revision 1.76
> diff -u -r1.76 build.c
> --- build.c    30 Jul 2005 15:29:27 -0000	1.76
> +++ build.c    31 Aug 2005 09:01:34 -0000
> @@ -279,6 +279,14 @@
>  
> 	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
>  
> +	/* If the flash disk is smaller than resv_blocks_write, then we 
> +	   allow writing to the disk anyway. The flash disk is then most likely
> +	      being used as write once - read many medimum, e.g. in-system configuration of 
> +	         static parameters(e.g. MAC address of device in stored in "ROM"). */
> +		 if (c->resv_blocks_write * c->sector_size > c->flash_size) {
> +		   c->resv_blocks_write = 0; 
> +		   }
> +
> 	/* When do we let the GC thread run in the background */
>  
> 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;

Minor stuff: You indentation is broken.

If you changed the patch to add a mount option for the WORM case and
check for the mount option instead, this might go in.  Looks like it
could be useful.

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
