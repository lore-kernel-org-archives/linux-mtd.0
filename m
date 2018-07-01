Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZi8o-0002Gl-Rw
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 19:36:12 +0000
From: Richard Weinberger <richard@nod.at>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/2] ubi: expose the volume CRC check skip flag
Date: Sun, 01 Jul 2018 21:35:57 +0200
Message-ID: <382648641.QZzOm4Mo72@blindfold>
In-Reply-To: <0ace6202bddb495ae0e632ae2fd0346f99fcdab4.1530169759.git-series.quentin.schulz@bootlin.com>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <0ace6202bddb495ae0e632ae2fd0346f99fcdab4.1530169759.git-series.quentin.schulz@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quentin,

Am Donnerstag, 28. Juni 2018, 09:40:53 CEST schrieb Quentin Schulz:
> Now that we have the logic for skipping CRC check for static UBI volumes
> in the core, let's expose it to users.
> 
> This makes use of a padding byte in the volume description data
> structure as a flag. This flag only tell for now whether we should skip
> the CRC check of a volume.
> 
> This checks the UBI volume for which we are trying to skip the CRC check
> is static.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/ubi/cdev.c      |  4 ++++
>  drivers/mtd/ubi/vmt.c       |  3 +++
>  include/uapi/mtd/ubi-user.h | 16 ++++++++++++++--
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 45c3296..3eea1df 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -622,6 +622,10 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
>  	    req->vol_type != UBI_STATIC_VOLUME)
>  		goto bad;
>  
> +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&
> +	    req->vol_type != UBI_STATIC_VOLUME)
> +		goto bad;

We should also reject unknown flags here.

Thanks,
//richard
