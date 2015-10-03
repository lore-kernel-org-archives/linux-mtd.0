Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRIs-00048R-Jm
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:13:04 +0000
Subject: Re: [PATCH] UBI: Update comments to reflect UBI_METAONLY flag
To: Andrew Murray <amurray@embedded-bits.co.uk>, linux-mtd@lists.infradead.org
References: <1439204529-15440-1-git-send-email-amurray@embedded-bits.co.uk>
Cc: trivial@kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56101A94.9030005@nod.at>
Date: Sat, 3 Oct 2015 20:12:36 +0200
MIME-Version: 1.0
In-Reply-To: <1439204529-15440-1-git-send-email-amurray@embedded-bits.co.uk>
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

Am 10.08.2015 um 13:02 schrieb Andrew Murray:
> This patch trivially updates code comments to reflect the addition of the
> UBI_METAONLY flag - as discussed https://lkml.org/lkml/2014/10/29/764
> 
> Cc: Richard Weinberger <richard@nod.at>
> Cc: trivial@kernel.org
> Signed-off-by: Andrew Murray <amurray@embedded-bits.co.uk>
> ---
>  drivers/mtd/ubi/gluebi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
> index b93807b..cb7c075 100644
> --- a/drivers/mtd/ubi/gluebi.c
> +++ b/drivers/mtd/ubi/gluebi.c
> @@ -112,8 +112,8 @@ static int gluebi_get_device(struct mtd_info *mtd)
>  		 * The MTD device is already referenced and this is just one
>  		 * more reference. MTD allows many users to open the same
>  		 * volume simultaneously and do not distinguish between
> -		 * readers/writers/exclusive openers as UBI does. So we do not
> -		 * open the UBI volume again - just increase the reference
> +		 * readers/writers/exclusive/meta openers as UBI does. So we do
> +		 * not open the UBI volume again - just increase the reference

Applied!

Thanks,
//richard
