Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dRzkJ-0006Ug-E3
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 11:42:29 +0000
Subject: Re: [PATCH] ubi: fastmap: fix spelling mistake: "invalidiate" ->
 "invalidate"
To: Colin King <colin.king@canonical.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20170703093701.11588-1-colin.king@canonical.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b88d7027-f9e1-0a2d-7407-b576b559da3e@nod.at>
Date: Mon, 3 Jul 2017 13:41:53 +0200
MIME-Version: 1.0
In-Reply-To: <20170703093701.11588-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Colin,

Am 03.07.2017 um 11:37 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in ubi_err error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
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
> 

Isn't this material for the trivial tree?

Thanks,
//richard
