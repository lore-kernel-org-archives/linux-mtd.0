Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOh2N-0008Dp-AF
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 10:12:00 +0000
Date: Fri, 1 Jun 2018 12:11:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Vignesh R <vigneshr@ti.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v7 1/5] mtd: nand: Pass mode information to
 nand_page_io_req
Message-ID: <20180601121144.247c03f3@xps13>
In-Reply-To: <20180515150825.19835-2-boris.brezillon@bootlin.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <20180515150825.19835-2-boris.brezillon@bootlin.com>
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

Hi Boris,

On Tue, 15 May 2018 17:08:21 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> The NAND sub-layers are likely to need the MTD_OPS_XXX mode information
> in order to decide if they should enable/disable ECC or how they should
> place the OOB bytes in the provided OOB buffer.
> 
> Add a field to nand_page_io_req to pass this information.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
