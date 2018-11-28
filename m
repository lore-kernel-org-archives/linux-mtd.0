Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRuqn-00067l-U2
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 08:05:39 +0000
Date: Wed, 28 Nov 2018 09:05:16 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Pan Bian <bianpan2016@163.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: put MTD device after it is not used
Message-ID: <20181128090516.16e89c94@bbrezillon>
In-Reply-To: <1543373853-80379-1-git-send-email-bianpan2016@163.com>
References: <1543373853-80379-1-git-send-email-bianpan2016@163.com>
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

On Wed, 28 Nov 2018 10:57:33 +0800
Pan Bian <bianpan2016@163.com> wrote:

> The MTD device reference is dropped via put_mtd_device, however its
> field ->index is read and passed to ubi_msg. To fix this, the patch
> moves the reference dropping after calling ubi_msg.
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/ubi/build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index a4e3454..09170b7 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1101,10 +1101,10 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>  	ubi_wl_close(ubi);
>  	ubi_free_internal_volumes(ubi);
>  	vfree(ubi->vtbl);
> -	put_mtd_device(ubi->mtd);
>  	vfree(ubi->peb_buf);
>  	vfree(ubi->fm_buf);
>  	ubi_msg(ubi, "mtd%d is detached", ubi->mtd->index);
> +	put_mtd_device(ubi->mtd);

Maybe we should move some of these to the dev->release() or
class->dev_release() hook.

>  	put_device(&ubi->dev);
>  	return 0;
>  }
