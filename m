Received: from zero.ics.uci.edu ([128.195.1.35])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IEYve-0003p4-CS
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 19:09:05 -0400
Date: Fri, 27 Jul 2007 16:05:23 -0700 (PDT)
From: Siddharth Choudhuri <sid@egor.ics.uci.edu>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Subject: Re: [PATCH][MTD] CORE: sysfs support for mtd
In-Reply-To: <200707271530.08809.alexs@linux.vnet.ibm.com>
Message-ID: <Pine.GSO.4.64.0707271549220.7573@egor.ics.uci.edu>
References: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
	<200707271530.08809.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I have applied this patch to my tree and tried to compile it, but I get
> lots of compile errors. Maybe you created it on an outdated kernel?!
>
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:112: error: (Each undeclared identifier is reported only once
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:112: error: for each function it appears in.)
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:113: error: `MTD_ECC_RS_DiskOnChip' undeclared (first use in this function)
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:114: error: `MTD_ECC_SW' undeclared (first use in this function)
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:116: error: structure has no member named `ecctype'
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c: In function `mtd_sysfs_rd_eccsize':
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:122: error: structure has no member named `eccsize'
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c: In function `add_mtd_partitions':
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:510: warning: assignment from incompatible pointer type
> /home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:511: error: invalid use of undefined type `struct subsystem'
>
Thanks for the error log. You're right, I patched it against 2.6.18. With 
the latest kernel from git, I got the exact same errors. I guess the 
reason is 1) mtd_info struct no longer has ecctype, eccsize as members 
which means these fields cannot be exported 2) Looks like there have been 
some changes to the devices subsystem from 2.6.18 to the current version. 
There's also a new file under Documentation/sysfs-rules.txt. I'll post a 
patch as soon as I figure out how to add mtd to /sys hierarchy in the 
latest kernel.

regards,
-siddharth
