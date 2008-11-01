Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KwFsO-0004lY-S2
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 12:46:49 +0000
Date: Sat, 1 Nov 2008 12:46:34 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: Werner Almesberger <werner@openmoko.org>
Subject: Re: [PATCH] nand_read_subpage vs. S3C244x NAND: non-word reads
Message-ID: <20081101124634.GB11063@fluff.org.uk>
References: <20081101031505.GA5177@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081101031505.GA5177@almesberger.net>
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben@trinity.fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 01, 2008 at 01:15:05AM -0200, Werner Almesberger wrote:
> In recent kernels, the optimized OOB reads in nand_read_subpage often
> make requests which aren't an exact multiple of a word, which caused
> nand/s3c2410.c to do a partial read, yielding chaos and mayhem.
> 
> I'm not entirely sure whether nand_read_subpage is to blame for making
> non-word requests, or whether nand/s3c2410.c is to blame for not
> supporting them, but here's a patch for the latter.

As noted on the openmoko list, I think we can do 256byte subpage reads
as long as they are aligned to 256bytes. We could make the ECC code
deal with non-256 byte power-of-two aligned blocks without huge
changes but my belief is that we cannot support anything that isn't
a power of two.

I think the best thing to do is to either force the caller to read
a power of two (pref. >4 bytes), so either we need some form of flag
to say this, or change the behaviour of the callers to never try this.
 
> Note that s3c2410_nand_write_buf has a similar issue. RNDIN is used in
> nand_write_oob_syndrome, so this may also be a real problems.
> 
> - Werner
> 
> ---------------------------------- cut here -----------------------------------
> 
> fix-s3c-nand-read-bytes.patch
> 
> With the introduction of optimized OOB reads in nand_read_subpage,
> the length of the data requested may not be a multiple of four bytes.
> 
> This caused a partial read on the 2440, leading to false ECC errors
> and, worse, attempts to "correct" them.
> 
> Note that there is a similar issue in s3c2440_nand_write_buf, which
> doesn't seem to cause trouble yet.
> 
> Signed-off-by: Werner Almesberger <werner@openmoko.org>
> 
> ---
> 
> Index: ktrack/drivers/mtd/nand/s3c2410.c
> ===================================================================
> --- ktrack.orig/drivers/mtd/nand/s3c2410.c	2008-11-01 00:29:45.000000000 -0200
> +++ ktrack/drivers/mtd/nand/s3c2410.c	2008-11-01 00:38:10.000000000 -0200
> @@ -530,7 +530,14 @@
>  static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  {
>  	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +
>  	readsl(info->regs + S3C2440_NFDATA, buf, len / 4);
> +	if (unlikely(len & 3)) {
> +		u32 data;
> +
> +		data = readl(info->regs + S3C2440_NFDATA);
> +		memcpy(buf + (len & ~3), &data, len & 3);
> +	}

note you'll still fail for len in the 0..3 region, as you'll move
len+4 bytes, and then copy them over the data you just read.

>  }
>  
>  static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
