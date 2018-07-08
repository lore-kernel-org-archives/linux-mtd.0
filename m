Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc84b-0004Bm-Pv
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 11:41:52 +0000
Date: Sun, 8 Jul 2018 13:41:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sergey Larin <cerg2010cerg2010@mail.ru>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] fix regressions in DoC G4 driver
Message-ID: <20180708134133.2427d488@bbrezillon>
In-Reply-To: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
References: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
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

Hi Sergey,

On Sun,  8 Jul 2018 14:29:22 +0300
Sergey Larin <cerg2010cerg2010@mail.ru> wrote:

> docg4 driver became broken and these patches will make it work again.

I guess you have a platform with a DoC G4 on it. If that's the case, I
might have a few changes I'd need you to test if you don't mind.

Thanks,

Boris 

> 
> Sergey Larin (2):
>   mtd: rawnand: docg4: fix NULL deref while probing
>   mtd: rawnand: docg4: specify bits_per_cell
> 
>  drivers/mtd/nand/raw/docg4.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
