Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg29j-0006IV-2Q
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 06:11:18 +0000
Date: Thu, 19 Jul 2018 08:11:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Changes in the internal raw NAND API
Message-ID: <20180719081101.361b1370@bbrezillon>
In-Reply-To: <20180718231234.8534-1-miquel.raynal@bootlin.com>
References: <20180718231234.8534-1-miquel.raynal@bootlin.com>
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

On Thu, 19 Jul 2018 01:12:32 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
> 
> After having sent two versions of a series removing the
> nand_scan_ident/nand_scan_tail limitation that prevents us to allocate
> memory at critical moments, we are still discussing the internal API.
> 
> To avoid sending again more than 20 patches, this is an RFC of the
> internal changes prior to the above modifications in each driver:
> 
> 1/ Rename struct nand_hw_control -> struct nand_controller which is
>    much more meaningful.
> 2/ Rename the function initializing the above structure
>    nand_hw_control_init() -> nand_controller_init().
> 3/ Rename the dummy controller implementation in the nand_chip structure
>    hwcontrol -> dummy_controller.
> 3/ Create a nand_controller_ops structure which will be embedded in the
>    nand_controller structure. These operations are:
>    int (*attach_chip)(struct nand_chip *) and
>    void (*detach_chip)(struct nand_chip *).
> 
> If we agree on this, I could merge them first and then send the bunch of
> patches making use of these API changes.
> 

This version looks good to me.

Regards,

Boris
