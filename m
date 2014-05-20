Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmfnn-0002ND-2b
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 08:53:39 +0000
Received: by mail-pd0-f177.google.com with SMTP id g10so129288pdj.22
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 01:53:13 -0700 (PDT)
Date: Tue, 20 May 2014 01:53:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/2] mtd: print out the partition's read-only flag
Message-ID: <20140520085309.GI2413@norris-Latitude-E6410>
References: <1398830010-3628-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398830010-3628-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 11:53:29AM +0800, Huang Shijie wrote:
> We may set a partition to be read only with DT property or kernel cmdline,
> such as the kernel cmdline:
>   mtdparts=50000000.nor:2m(boot)ro,2m(dtb),5m(kernel),-(test)
> 
> This patch prints out the partition's read-only flag in the boot precedure,
> which makes us more clear about the read-only partition.
> 
> Before this patch, the partitions show like this:
> 	0x000000000000-0x000000200000 : "boot"
> 	0x000000200000-0x000000400000 : "dtb"
> 	0x000000400000-0x000000900000 : "kernel"
> 	0x000000900000-0x000002000000 : "test"
> 
> After this patch, the partitions show like this:
> 
> 	0x000000000000-0x000000200000 : "boot"	 (Read-Only)
> 	0x000000200000-0x000000400000 : "dtb"
> 	0x000000400000-0x000000900000 : "kernel"
> 	0x000000900000-0x000002000000 : "test"
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Nak to both. /proc/mtd shouldn't really be changing formats like this.

Brian
