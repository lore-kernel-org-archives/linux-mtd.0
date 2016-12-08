Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEnlB-0000Ys-6C
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2016 01:44:34 +0000
Subject: Re: [PATCH] mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'
To: Fabio Estevam <fabio.estevam@nxp.com>, boris.brezillon@free-electrons.com
References: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
Cc: marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <04ddeef1-76a0-95fe-e4c0-86e077719014@mleia.com>
Date: Thu, 8 Dec 2016 03:44:10 +0200
MIME-Version: 1.0
In-Reply-To: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On 11/29/2016 05:28 PM, Fabio Estevam wrote:
> devm_ioremap_resource() does a NULL check on the 'rc' argument, so
> remove the unneeded manual NULL check.
> 
> While at it, place the 'rc' assignment just before
> devm_ioremap_resource() to improve readability.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

thank you for the change, it is nice.

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
