Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvXxW-0003qe-EQ
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2013 19:48:07 +0000
Date: Tue, 24 Dec 2013 14:47:44 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Add "armada370-nand" compatible
Message-ID: <20131224194744.GF19878@titan.lakedaemon.net>
References: <1387899607-2656-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387899607-2656-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 24, 2013 at 12:40:07PM -0300, Ezequiel Garcia wrote:
> Now that the driver can support the Armada 370/XP SoC NAND controller,
> add the devicetree compatible string, enabling its use.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> Applies on top of l2-mtd.git master branch, rebased on top of v3.13-rc4
> in order to include:
> 
> commit 9c59ac616137fb62f6cb3f1219201b09cbcf30be
> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Date:   Mon Dec 9 18:36:26 2013 -0300
> 
>     Partially revert "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"
> 
> and it is v3.14 material.
> 
>  drivers/mtd/nand/pxa3xx_nand.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
