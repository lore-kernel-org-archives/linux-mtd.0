Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew7W6-0006Ua-EE
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 14:36:36 +0000
Date: Wed, 14 Mar 2018 15:36:00 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: use put_device() if device_register fail
Message-ID: <20180314153600.458c0fe4@bbrezillon>
In-Reply-To: <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
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

On Fri,  9 Mar 2018 16:20:48 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> if device_register() returned an error! Always use put_device()
> to give up the reference initialized.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/mtdcore.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 28553c8..4d77ca2 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -586,6 +586,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	return 0;
>  
>  fail_added:
> +	put_device(&mtd->dev);

Not sure this is a good idea: the put_device() call will trigger
an mtd_devtype->release(), which will in turn call device_destroy() on
something that does not exist yet. Not sure if this is a real problem,
but it does not look like the right thing to do.

>  	of_node_put(mtd_get_of_node(mtd));

You're referencing an object that is supposed to have been
freed/released by the put_device() call. Again, it's not really a
problem because in our case ->release() does not free the mtd object
(as is usually done in other parts of the kernel), but it still looks
wrong. It's probably better to move the of_node_put() and the below
idr_remove() call in the ->release() hook if you want to use
put_device().

>  	idr_remove(&mtd_idr, i);



>  fail_locked:



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
