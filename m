Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eNaTx-000826-Rp
 for linux-mtd@lists.infradead.org; Sat, 09 Dec 2017 08:27:39 +0000
Date: Sat, 9 Dec 2017 09:27:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/2 v2] mtd: onenand: samsung: Simplify code and fix
 leaks in error handling paths
Message-ID: <20171209092710.4439c55b@bbrezillon>
In-Reply-To: <cover.1512804011.git.christophe.jaillet@wanadoo.fr>
References: <cover.1512804011.git.christophe.jaillet@wanadoo.fr>
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

On Sat,  9 Dec 2017 08:24:03 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The first patch converts 's3c_onenand_probe()' to devm_ functions.
> This fixes a leak in one path (line 872).
> This also free_irq which was not handled at all. (I hope I'm correct :) )
> 
> The 2nd patch is about an un-handled error code which looks spurious.
> Not sure if I'm right.
> 
> 
> While compile-testing it, I had to tweak the code because I don't have any
> cross-compiler.

Oh come on! It's really not that complicated to install an arm toolchain
and cross compile the kernel.

> I commented the line "#include <asm/mach/flash.h>" and the compilation
> succeeded. So maybe, this include is also useless.

Yep, it's not surprising, the driver is really in a poor state. I also
noticed that buffers allocated with kmalloc are flagged as __iomem
regions, which is obviously wrong. And I fear we'll find plenty of other
issues if we dig a bit more.

> I've left it as-is, though.

Can be fixed in another patch.

> 
> 
> Theses patches have been compile-tested-only.
> 
> 
> Christophe JAILLET (2):
>   mtd: onenand: samsung: use devm_ function to simplify code and fix
>     some leaks
>   mtd: onenand: samsung: return an error if
>     'mtd_device_parse_register()' fails
> 
>  drivers/mtd/onenand/samsung.c | 169 +++++++++---------------------------------
>  1 file changed, 34 insertions(+), 135 deletions(-)
> 
