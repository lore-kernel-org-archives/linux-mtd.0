Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JAw8-00018K-2I
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 12:42:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Greg Ungerer <gerg@snapgear.com>
In-Reply-To: <3ECD9C30.7090804@snapgear.com>
References: <3ECD9C30.7090804@snapgear.com>
Message-Id: <1053690186.3402.96.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 23 May 2003 12:43:06 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [ANNOUNCE] MTD driver for DiskOnChip Millennium Plus and INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-23 at 04:57, Greg Ungerer wrote:
> Hi All,
> 
> I would like to announce a patch set to support the M-System's
> Disk-On-Chip Millennium Plus parts, and their new INFTL (Inverse
> NAND Flash Translation Layer).
> 
> You can get the patch at either of these sites:
> 
>   ftp://ftp.snapgear.org/pub/patches/mplus-20030414.patch.gz
>   http://www.uclinux.org/pub/uClinux/misc/mplus-20030414.patch.gz
> 
> This patch is against standard Linux 2.4.20 kernel.

Thanks. I've imported it into CVS and updated it to reflect the other
changes I've made recently, so it should now be working in 2.4 and 2.5
kernels through the blkdev helper stuff.

I haven't incorporated the new ioctls for mtdchar.c -- I think the
MEMSETOOBSEL ioctl should suffice for switching between with-ECC and
without-ECC modes. If not, it _should_ :) 

-- 
dwmw2
