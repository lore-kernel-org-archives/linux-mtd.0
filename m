Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amM2D-00062O-Ld
 for linux-mtd@lists.infradead.org; Sat, 02 Apr 2016 13:56:18 +0000
Date: Sat, 2 Apr 2016 15:55:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] nand: Remove BUG abuse
Message-ID: <20160402155556.41cde687@bbrezillon>
In-Reply-To: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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

Hi Ezequiel,

On Fri,  1 Apr 2016 18:29:22 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Hi,
> 
> While using nandsim to debug an issue with an UBI image,
> I hit a BUG() when passing some crazy ID values to nandsim.
> 
> I've always felt that nand_base.c is sort of abusing the 
> BUG() macro, so decided to fix it.
> 
> There are other BUG() uses, but they aren't in the nand_scan
> path, so I'm not touching them.

Now that you've opened the door to this rework, can you also patch other
locations where BUG() is employed? :)

Thanks,

Boris

> 
> Patches apply cleanly on v4.6-rc1.
> 
> Ezequiel Garcia (2):
>   mtd: nand: Drop mtd.owner requirement in nand_scan
>   mtd: nand: Remove BUG() abuse in nand_scan_tail
> 
>  drivers/mtd/nand/nand_base.c | 62 ++++++++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
