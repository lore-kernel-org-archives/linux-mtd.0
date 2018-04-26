Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBnBk-0001yr-QZ
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 20:08:23 +0000
Date: Thu, 26 Apr 2018 22:08:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: nand: add myself as NAND co-maintainer
Message-ID: <20180426220808.2abed5a4@bbrezillon>
In-Reply-To: <20180422175553.7489-1-miquel.raynal@bootlin.com>
References: <20180422175553.7489-1-miquel.raynal@bootlin.com>
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

On Sun, 22 Apr 2018 19:55:53 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> I have been actively reviewing and contributing improvements to the NAND
> subsystem for more than 6 months now and am willing to continue doing so
> in the future. Formalize my new role.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Richard Weinberger <richard@nod.at>

Applied.

Thanks,

Boris

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a1410d5a621..85b39fd1c70d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9574,6 +9574,7 @@ F:	drivers/net/ethernet/myricom/myri10ge/
>  
>  NAND FLASH SUBSYSTEM
>  M:	Boris Brezillon <boris.brezillon@bootlin.com>
> +M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  R:	Richard Weinberger <richard@nod.at>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
