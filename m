Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOh8Q-0008JZ-1u
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 10:18:16 +0000
Subject: Re: [PATCH v7 1/5] mtd: nand: Pass mode information to
 nand_page_io_req
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Pan <peterpansjtu@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <20180515150825.19835-2-boris.brezillon@bootlin.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <41d6e15d-5265-69e9-f01f-b368e3940a5a@exceet.de>
Date: Fri, 1 Jun 2018 12:17:41 +0200
MIME-Version: 1.0
In-Reply-To: <20180515150825.19835-2-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 15.05.2018 17:08, Boris Brezillon wrote:
> The NAND sub-layers are likely to need the MTD_OPS_XXX mode information
> in order to decide if they should enable/disable ECC or how they should
> place the OOB bytes in the provided OOB buffer.
> 
> Add a field to nand_page_io_req to pass this information.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Tested-by: Frieder Schrempf <frieder.schrempf@exceet.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@exceet.de>
