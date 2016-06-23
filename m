Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bG5mM-0004dA-8E
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 14:38:51 +0000
Subject: Re: [PATCH] UBI: only read UBI_VID_HDR_SIZE when reading the vid_hdr
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
References: <1466688561-16103-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576BF461.2020108@nod.at>
Date: Thu, 23 Jun 2016 16:38:25 +0200
MIME-Version: 1.0
In-Reply-To: <1466688561-16103-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.06.2016 um 15:29 schrieb Sascha Hauer:
> When reading the vid hdr from the device UBI always reads a whole
> page. Instead, read only the data we actually need and speed up
> attachment of UBI devices by potentially making use of reading
> subpages.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Please review carefully. It obviously works and speeds up UBI attachment
> from 3s to 2s here in one case and I have not found places where this patch
> makes problems, but there might be a reason I haven't seen why in case of
> the ec header only the header is read while in case of the vid header the
> whole page is read.
> 
>  drivers/mtd/ubi/io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 10cf3b5..31918a0 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
>  
>  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
> -			  ubi->vid_hdr_alsize);
> +			  UBI_VID_HDR_SIZE);

Hmm, I fear this will break as soon ubi->vid_hdr_shift is non-zero.

Thanks,
//richard
