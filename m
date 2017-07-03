Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dRze6-0001xR-UX
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 11:36:04 +0000
Date: Mon, 3 Jul 2017 13:35:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: fastmap: fix spelling mistake: "invalidiate" ->
 "invalidate"
Message-ID: <20170703133531.2b27d956@bbrezillon>
In-Reply-To: <20170703093701.11588-1-colin.king@canonical.com>
References: <20170703093701.11588-1-colin.king@canonical.com>
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

On Mon,  3 Jul 2017 10:37:01 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in ubi_err error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index b44c8d348e78..5a832bc79b1b 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1667,7 +1667,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>  
>  	ret = invalidate_fastmap(ubi);
>  	if (ret < 0) {
> -		ubi_err(ubi, "Unable to invalidiate current fastmap!");
> +		ubi_err(ubi, "Unable to invalidate current fastmap!");
>  		ubi_ro_mode(ubi);
>  	} else {
>  		return_fm_pebs(ubi, old_fm);
