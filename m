Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRhc-0000rd-Tj
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:50:54 +0000
Date: Thu, 28 Jun 2018 09:50:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH v2 2/4] libubi: add volume flags to ubi_mkvol_request
Message-ID: <20180628095040.1c1b1ea2@bbrezillon>
In-Reply-To: <20180628074344.10249-3-quentin.schulz@bootlin.com>
References: <20180628074344.10249-1-quentin.schulz@bootlin.com>
 <20180628074344.10249-3-quentin.schulz@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Jun 2018 09:43:42 +0200
Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> Now that we have per-UBI volume flags (for instance for skipping CRC
> check when opening it) from the Linux header, let's add it to the
> ubi_mkvol_request in libubi and assign the flags to ubi_mkvol_req from
> the Linux header from ubi_mkvol.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  include/libubi.h | 2 ++
>  lib/libubi.c     | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/include/libubi.h b/include/libubi.h
> index 4d6a7ee..46596a3 100644
> --- a/include/libubi.h
> +++ b/include/libubi.h
> @@ -69,6 +69,7 @@ struct ubi_attach_request
>   * @bytes: volume size in bytes
>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
>   * @name: volume name
> + * @flags: volume flags
>   */
>  struct ubi_mkvol_request
>  {
> @@ -77,6 +78,7 @@ struct ubi_mkvol_request
>  	long long bytes;
>  	int vol_type;
>  	const char *name;
> +	uint8_t flags;
>  };
>  
>  /**
> diff --git a/lib/libubi.c b/lib/libubi.c
> index 978b433..4322a19 100644
> --- a/lib/libubi.c
> +++ b/lib/libubi.c
> @@ -1000,6 +1000,7 @@ int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
>  	r.alignment = req->alignment;
>  	r.bytes = req->bytes;
>  	r.vol_type = req->vol_type;
> +	r.flags = req->flags;
>  
>  	n = strlen(req->name);
>  	if (n > UBI_MAX_VOLUME_NAME)
