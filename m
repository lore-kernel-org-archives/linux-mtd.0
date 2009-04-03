Subject: Re: [PATCH] MTD: nandsim should delete its partitions on module unload
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
References: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Apr 2009 10:01:10 +0300
Message-Id: <1238742070.20906.97.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-02 at 16:32 -0700, Kevin Cernekee wrote:
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
> ---
>  drivers/mtd/nand/nandsim.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index cd0711b..f4fda9b 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2349,6 +2349,7 @@ static void __exit ns_cleanup_module(void)
>  	struct nandsim *ns = (struct nandsim *)(((struct nand_chip
> *)nsmtd->priv)->priv);
The patch is line-wrapped.

>  	int i;
> 
> +	del_mtd_partitions(nsmtd);
>  	free_nandsim(ns);    /* Free nandsim private resources */
>  	nand_release(nsmtd); /* Unregister driver */
>  	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
