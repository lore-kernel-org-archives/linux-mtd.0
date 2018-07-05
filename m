Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fayFF-0000OZ-4b
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 07:00:07 +0000
Date: Thu, 5 Jul 2018 08:59:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "David Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next v3] mtd: spinand: fix missing unlock on error
Message-ID: <20180705085936.38f6c374@xps13>
In-Reply-To: <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
References: <1530696061-76467-1-git-send-email-weiyongjun1@huawei.com>
 <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
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

Wei Yongjun <weiyongjun1@huawei.com> wrote on Wed, 4 Jul 2018 09:30:27
+0000:

> Add the missing unlock before return from function
> spinand_mtd_(read|write) in the error handling case.
>=20
> Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI N=
ANDs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thanks for the two fixes over the spinand work. As this code is not
yet upstream, do you mind if I fold those fixes directly with the
initial patch?

Thanks,
Miqu=C3=A8l
