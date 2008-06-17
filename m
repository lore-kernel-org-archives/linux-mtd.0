Received: from smtp.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8PMW-0005wi-9z
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 00:47:53 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: mtd partitions limited to 4 GB?
Date: Tue, 17 Jun 2008 12:41:08 +1200
References: <4856FF76.9000302@firmworks.com>
In-Reply-To: <4856FF76.9000302@firmworks.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806171241.08371.manningc2@actrix.gen.nz>
Cc: Mitch Bradley <wmb@firmworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 17 June 2008 12:04:06 Mitch Bradley wrote:
> In drivers/mtd/mtdpart.c, struct mtd_part has  "u_int32_t offset", thus
> (apparently) limiting the partition start offset to 4 GiB.  Similarly,
> struct mtd_partition in include/linux/mtd/partititions.h has "u_int32_t
> size" and "u_int32_offset".

As Josh says it is not just an mtd_part issue, but the whole guts of mtd 
suffer from this. The actual mtd_xxx interface to the kernel is close enough 
for most purposes.

I am aware of people using Linux with >4GB of NAND for a long time now (well 
over a year). They did this by writing their own mtd drivers that just fit 
onto the existing interface.  Many people do that anyway because the nand 
core stuff is slow relative to a tailor made driver.

>
> Now that NAND FLASH device sizes have exceeded that, this appears to be
> a significant limitation.
>
> Is anyone in the mtd community already addressing this?
>
> Fixing the core infrastructure might be as simple as using "loff_t"
> instead of "u_int32_t" for those fields.  However, all of the existing
> partition map parsers appear to have the same 32-bit limitation, so
> partitioning a >4GiB device will require a new or modified partition map
> format.

It is more than just changing the 32 to 64 bit types.
