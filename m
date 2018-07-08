Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHZ2-0000wC-2T
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:49:53 +0000
Date: Sun, 8 Jul 2018 23:49:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "David Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Peter
 Pan <peterpandong@micron.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: spinand: Fix error return code in
 spinand_init()
Message-ID: <20180708234939.6beb9a0d@xps13>
In-Reply-To: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
References: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wei,

Wei Yongjun <weiyongjun1@huawei.com> wrote on Wed, 4 Jul 2018 08:34:58
+0000:

> Fix to return error code -ENOMEM from the kzalloc() error handling
> case instead of 0, as done elsewhere in this function.
>=20
> Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI N=
ANDs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/nand/spi/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)


Merged with the original commit.

Thanks,
Miqu=C3=A8l
