Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffuTY-0000xV-NA
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:59:14 +0000
Date: Wed, 18 Jul 2018 23:58:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: better name for the controller
 structure
Message-ID: <20180718235845.4131d653@bbrezillon>
In-Reply-To: <20180718215056.1242-2-miquel.raynal@bootlin.com>
References: <20180718215056.1242-1-miquel.raynal@bootlin.com>
 <20180718215056.1242-2-miquel.raynal@bootlin.com>
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

On Wed, 18 Jul 2018 23:50:55 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>  
>  /**
> - * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
> + * struct nand_controller - Control structure for hardware controller

Hm, the description is weird. How about "NAND controller object" or
"Structure used to describe a NAND controller"

Other than this detail, it looks all good to me.

> + *                          shared among independent devices
>   * @lock:               protection lock
>   * @active:		the mtd device which holds the controller currently
>   * @wq:			wait queue to sleep on if a NAND operation is in
>   *			progress used instead of the per chip wait queue
>   *			when a hw controller is available.
>   */
> -struct nand_hw_control {
> +struct nand_controller {
>  	spinlock_t lock;
>  	struct nand_chip *active;
>  	wait_queue_head_t wq;
>  };
