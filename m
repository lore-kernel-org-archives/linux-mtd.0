Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYeo8-0001y8-Eo
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 21:18:14 +0000
Date: Mon, 8 Jan 2018 22:17:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park
 <kyungmin.park@samsung.com>, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Ladislav Michl
 <ladis@linux-mips.org>, Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH v4 0/4] mtd: Preparation patches for the SPI NAND framework
Message-ID: <20180108221751.6cc5c21a@bbrezillon>
In-Reply-To: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
References: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
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

Should be [PATCH v4 *0/3*].

On Mon,  8 Jan 2018 22:15:39 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> Here is a set of patches preparing the introduction of the generic
> NAND and SPI frameworks.
> 
> If you want to see the overall picture of the SPI NAND framework you can
> have a look at this branch [2].
> 
> Regards,
> 
> Boris
> 
> Change in v4:
> - add "mtd: mtdpart: Make ECC stat handling consistent" and
> - integrate "mtd: Remove duplicate checks on mtd_oob_ops parameter"
>   into this series
> - drop "mtd: Stop directly calling master ->_xxx() hooks from mtdpart
>   code"
> 
> Boris Brezillon (3):
>   mtd: mtdpart: Make ECC stat handling consistent
>   mtd: Fallback to ->_read/write_oob() when ->_read/write() is missing
>   mtd: Remove duplicate checks on mtd_oob_ops parameter
> 
>  drivers/mtd/devices/docg3.c        | 70 ------------------------------
>  drivers/mtd/mtdcore.c              | 31 +++++++++++++-
>  drivers/mtd/mtdpart.c              | 42 +++++-------------
>  drivers/mtd/nand/nand_base.c       | 87 --------------------------------------
>  drivers/mtd/onenand/onenand_base.c | 81 -----------------------------------
>  5 files changed, 40 insertions(+), 271 deletions(-)
> 
