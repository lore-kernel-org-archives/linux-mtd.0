Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHP0i-0002aR-U4
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 05:23:06 +0000
Date: Mon, 27 Jun 2016 07:22:39 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
Subject: Re: [PATCH] ubi: Speedup ubi_io_read_vid_hdr()
Message-ID: <20160627052239.GP20657@pengutronix.de>
References: <20160624093957.528c48dc@bbrezillon>
 <1466843991-3423-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466843991-3423-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2016 at 10:39:51AM +0200, Richard Weinberger wrote:
> Currently we read a whole (sub)page from flash when reading
> the VID header.
> Sascha reported that reading only UBI_VID_HDR_SIZE instead
> gives him a decent speedup during a full scan.
> 
> Since we have to obey shifted headers too we have to read
> ubi->vid_hdr_shift + UBI_VID_HDR_SIZE bytes.
> It is also important to set the buffer to 0xff bytes before
> reading as in ubi_io_write_vid_hdr() the whole (sub)page
> is written back to flash and we cannot risk leaking
> kernel memory into the storage medium.
> 
> Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Sascha,
> 
> can you please this patch a try?

I already did, this was exactly my suggestion after you mentioned that
my initial patch breaks when vid_hdr_shift is non zero.
I tested it without the memset though.

For reference: I tested this on a 8k page size Nand formatted with
ubiformat -O 512 and attached with ubiattach -O 512.

Sascha

> 
> Thanks,
> //richard
> ---
>  drivers/mtd/ubi/io.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 10cf3b5..803a22d 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -1018,8 +1018,9 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
>  	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
>  
>  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
> +	memset(p, 0xff, ubi->vid_hdr_alsize);
>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
> -			  ubi->vid_hdr_alsize);
> +			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
>  	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
>  		return read_err;
>  
> -- 
> 2.7.3
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
