Message-ID: <49D5B351.5040601@nokia.com>
Date: Fri, 03 Apr 2009 09:57:21 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCH] MTD: nandsim should delete its partitions on module unload
References: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
In-Reply-To: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kevin Cernekee wrote:
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
>  	int i;
> 
> +	del_mtd_partitions(nsmtd);
>  	free_nandsim(ns);    /* Free nandsim private resources */
>  	nand_release(nsmtd); /* Unregister driver */
>  	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)

Doesn't nand_release() already do that?
