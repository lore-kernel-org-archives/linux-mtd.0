Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuJJo-0003sS-1j
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 15:20:56 +0000
Date: Mon, 27 Aug 2018 17:20:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: liuxiang  <liuxiang_1999@126.com>
Cc: "Liu Xiang" <liu.xiang6@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, han.xu@nxp.com, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, "Yogesh
 Narayan Gaur" <yogeshnarayan.gaur@nxp.com>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: fix read error for flash
 size larger than 16MB
Message-ID: <20180827172028.0e6e6e41@bbrezillon>
In-Reply-To: <3571f5ca.c32c.1657be858d1.Coremail.liuxiang_1999@126.com>
References: <1534583663-2842-1-git-send-email-liu.xiang6@zte.com.cn>
 <20180827100613.78823993@bbrezillon>
 <3571f5ca.c32c.1657be858d1.Coremail.liuxiang_1999@126.com>
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

On Mon, 27 Aug 2018 23:02:29 +0800 (CST)
liuxiang  <liuxiang_1999@126.com> wrote:

> Fixes:e46ecda764dc37f9fc6279d95ea2c007daef1a71("mtd: spi-nor: Add Freesca=
le QuadSPI driver")

12 digits should be enough for the commit-id.

> Cc: stable@vger.kernel.org
>=20
> Should I send a V2 patch that adds these above=EF=BC=9F

Yes please.
