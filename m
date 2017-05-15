Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dALXu-0005WR-LD
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 19:20:44 +0000
Date: Mon, 15 May 2017 21:20:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH v2 0/2] Add NAND driver mach dependency constraint
Message-ID: <20170515212021.1ed4d0b5@bbrezillon>
In-Reply-To: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
References: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
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

On Tue,  2 May 2017 16:49:50 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Just two tiny and silly patches I came across while doing
> other things and testing with tiny_defconfig.
> 
> Changes from v1:
> 
>   * Add COMPILE_TEST, suggested by Boris.

Applied to nand/next.

Thanks,

Boris

> 
> Ezequiel Garcia (2):
>   mtd: nand: Add Hisilicon machine dependency
>   mtd: nand: Add Mediatek machine dependency
> 
>  drivers/mtd/nand/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
