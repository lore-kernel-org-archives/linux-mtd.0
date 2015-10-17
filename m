Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnVqL-0004MD-9r
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 18:04:34 +0000
Subject: Re: [PATCH] UBI: Fastmap: Fix PEB array type
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
References: <1445104555-30509-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: hs@denx.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <56228D96.7070408@nod.at>
Date: Sat, 17 Oct 2015 20:04:06 +0200
MIME-Version: 1.0
In-Reply-To: <1445104555-30509-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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

Am 17.10.2015 um 19:55 schrieb Ezequiel Garcia:
> The PEB array is an array of __be32, so let's fix the
> scan_pool() prototype accordingly.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index db3defdfc3c0..c867707a1d04 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -383,7 +383,7 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
>   * < 0 indicates an internal error.
>   */
>  static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
> -		     int *pebs, int pool_size, unsigned long long *max_sqnum,
> +		     __be32 *pebs, int pool_size, unsigned long long *max_sqnum,
>  		     struct list_head *eba_orphans, struct list_head *free)
>  {
>  	struct ubi_vid_hdr *vh;

The change makes sense, but does it fix a real issue?
I suspect it silences a compiler warning, which one?

Thanks,
//richard
