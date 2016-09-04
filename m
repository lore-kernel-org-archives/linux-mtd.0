Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgclE-0000Q0-PD
 for linux-mtd@lists.infradead.org; Sun, 04 Sep 2016 19:07:21 +0000
Date: Sun, 4 Sep 2016 21:06:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add maintainer entry for Ingenic JZ4780
 NAND driver
Message-ID: <20160904210658.244b723e@bbrezillon>
In-Reply-To: <20160830142255.23468-1-harveyhuntnexus@gmail.com>
References: <20160830142255.23468-1-harveyhuntnexus@gmail.com>
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

On Tue, 30 Aug 2016 15:22:55 +0100
Harvey Hunt <harveyhuntnexus@gmail.com> wrote:

Applied.

Thanks for doing that.

Boris

> Signed-off-by: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71aa5da..28d2d5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5992,6 +5992,12 @@ M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>  S:	Maintained
>  F:	drivers/dma/dma-jz4780.c
>  
> +INGENIC JZ4780 NAND DRIVER
> +M:	Harvey Hunt <harveyhuntnexus@gmail.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	drivers/mtd/nand/jz4780_*
> +
>  INTEGRITY MEASUREMENT ARCHITECTURE (IMA)
>  M:	Mimi Zohar <zohar@linux.vnet.ibm.com>
>  M:	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
