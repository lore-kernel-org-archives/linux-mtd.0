Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FVtq-0001H7-7Q
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 10:16:42 +0100
Date: Tue, 13 May 2003 11:16:32 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030513091632.GB10678@wohnheim.fh-wedel.de>
References: <20030511100649.GC1107@fs.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030511100649.GC1107@fs.tum.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Adrian Bunk <bunk@fs.tum.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: [2.5 patch] let MTD_UCLINUX depend on !MMU
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pruned the CC: list a bit.

On Sun, 11 May 2003 12:06:50 +0200, Adrian Bunk wrote:
> 
> Trying to compile a kernel with MTD_UCLINUX enabled for a computer with
> a MMU fails at the final linking because the variable _ebss seems to be
> not defined on such machines (it's only defined on m68knommu, h8300 and 
> v850).
> 
> The following patch (still applies with a few lines offset against 
> 2.5.69-bk4) tries to correct this issue by letting MTD_UCLINUX depend on 
> !MMU.
> 
> 
> --- linux-2.5.65-full/drivers/mtd/maps/Kconfig.old	2003-03-20 16:56:25.000000000 +0100
> +++ linux-2.5.65-full/drivers/mtd/maps/Kconfig	2003-03-20 16:56:45.000000000 +0100
> @@ -348,7 +348,7 @@
>  
>  config MTD_UCLINUX
>  	tristate "Generic uClinux RAM/ROM filesystem support"
> -	depends on MTD_PARTITIONS
> +	depends on MTD_PARTITIONS && !MMU
>  	help
>  	  Map driver to support image based filesystems for uClinux.

Usually, I committed such random fixes to CVS, but my time is getting
more constrained.

David, what would create the least work for you. To have such small
patches both in 2.5 and mtd cvs? Just curious, so I don't waste my
time on something that doesn't really help you.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
