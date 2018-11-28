Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRus0-0006Qu-C7
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 08:06:53 +0000
Date: Wed, 28 Nov 2018 09:06:30 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Pan Bian <bianpan2016@163.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: do not drop UBI device reference before using
Message-ID: <20181128090631.1a99f995@bbrezillon>
In-Reply-To: <1543375203-97876-1-git-send-email-bianpan2016@163.com>
References: <1543375203-97876-1-git-send-email-bianpan2016@163.com>
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

On Wed, 28 Nov 2018 11:20:03 +0800
Pan Bian <bianpan2016@163.com> wrote:

> The UBI device reference is dropped but then the device is used as a
> parameter of ubi_err. The bug is introduced in changing ubi_err's 
> behavior. The old ubi_err does not require a UBI device as its first 
> parameter, but the new one does.
> 
> Fixes: 32608703310 ("UBI: Extend UBI layer debug/messaging capabilities")
> 

Unnecessary blank line here.

> Signed-off-by: Pan Bian <bianpan2016@163.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/ubi/kapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index e9e9ecb..0b8f0c4 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -227,9 +227,9 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
>  out_free:
>  	kfree(desc);
>  out_put_ubi:
> -	ubi_put_device(ubi);
>  	ubi_err(ubi, "cannot open device %d, volume %d, error %d",
>  		ubi_num, vol_id, err);
> +	ubi_put_device(ubi);
>  	return ERR_PTR(err);
>  }
>  EXPORT_SYMBOL_GPL(ubi_open_volume);
