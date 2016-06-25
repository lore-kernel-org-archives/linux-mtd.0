Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGjUU-0003NU-2Z
 for linux-mtd@lists.infradead.org; Sat, 25 Jun 2016 09:03:02 +0000
Subject: Re: [PATCH] ubi: Speedup ubi_io_read_vid_hdr()
To: s.hauer@pengutronix.de
References: <20160624093957.528c48dc@bbrezillon>
 <1466843991-3423-1-git-send-email-richard@nod.at>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <576E48AF.1030105@nod.at>
Date: Sat, 25 Jun 2016 11:02:39 +0200
MIME-Version: 1.0
In-Reply-To: <1466843991-3423-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 25.06.2016 um 10:39 schrieb Richard Weinberger:
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

Given a second thought on that, we can drop this memset().

>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
> -			  ubi->vid_hdr_alsize);
> +			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
>  	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
>  		return read_err;

Thanks,
//richard
