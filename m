Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alB02-00085k-8a
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 07:57:11 +0000
Subject: Re: [PATCH] modify wrong comment in ubi_leb_map function.
To: z00189512 <abc.zhangliang@huawei.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
References: <1459276879-21046-1-git-send-email-abc.zhangliang@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56FB86BA.20201@nod.at>
Date: Wed, 30 Mar 2016 09:56:42 +0200
MIME-Version: 1.0
In-Reply-To: <1459276879-21046-1-git-send-email-abc.zhangliang@huawei.com>
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

Am 29.03.2016 um 20:41 schrieb z00189512:
> Signed-off-by: z00189512 <abc.zhangliang@huawei.com>
> ---
>  drivers/mtd/ubi/kapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index e844887..cc6fa01 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -708,7 +708,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum)
>  	struct ubi_volume *vol = desc->vol;
>  	struct ubi_device *ubi = vol->ubi;
>  
> -	dbg_gen("unmap LEB %d:%d", vol->vol_id, lnum);
> +	dbg_gen("map LEB %d:%d", vol->vol_id, lnum);

Good catch!

Thanks,
//richard
