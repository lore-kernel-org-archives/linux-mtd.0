Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc8GI-00006e-4T
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 11:53:55 +0000
Date: Sun, 8 Jul 2018 13:53:42 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sergey Larin <cerg2010cerg2010@mail.ru>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: docg4: fix NULL deref while probing
Message-ID: <20180708135342.2385fad6@bbrezillon>
In-Reply-To: <30a41254ed09624a8972aa1daf14e4dd1efabed3.1531045014.git.cerg2010cerg2010@mail.ru>
References: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
 <30a41254ed09624a8972aa1daf14e4dd1efabed3.1531045014.git.cerg2010cerg2010@mail.ru>
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

On Sun,  8 Jul 2018 14:29:23 +0300
Sergey Larin <cerg2010cerg2010@mail.ru> wrote:

> nand_scan_tail() invokes nand_chip->scan_bbt() at the end, which is not set
> by the driver. Use the default nand_default_bbt() function to avoid NULL
> dereferncing.

Wow! For how long has this driver been broken? The ->scan_bbt() hook
has been there for a very long time, and nand_scan_tail() is calling
it when NAND_SKIP_BBTSCAN is not set. 

> 
> Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>

Missing Fixes and Cc stable tags.

> ---
>  drivers/mtd/nand/raw/docg4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> index bb96cb33cd6b..bbed8ea7858c 100644
> --- a/drivers/mtd/nand/raw/docg4.c
> +++ b/drivers/mtd/nand/raw/docg4.c
> @@ -1269,6 +1269,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->read_buf = docg4_read_buf;
>  	nand->write_buf = docg4_write_buf16;
>  	nand->erase = docg4_erase_block;
> +	nand->scan_bbt = nand_default_bbt;

Are you sure that's really what you want. My experience with docg4 code
is that it's not really fitting in the raw NAND framework, so I
wouldn't be surprised if the default bad block table scan function does
not match how the docg4 NAND works.

>  	nand->set_features = nand_get_set_features_notsupp;
>  	nand->get_features = nand_get_set_features_notsupp;
>  	nand->ecc.read_page = docg4_read_page;
