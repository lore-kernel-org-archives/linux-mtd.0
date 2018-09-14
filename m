Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0p6M-0002EA-57
 for linux-mtd@lists.infradead.org; Fri, 14 Sep 2018 14:29:44 +0000
Date: Fri, 14 Sep 2018 16:29:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Steffen Trumtrar
 <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: fix a race condition when DMA is
 kicked
Message-ID: <20180914162923.05c44fcc@xps13>
In-Reply-To: <1536818329-11068-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536818329-11068-1-git-send-email-yamada.masahiro@socionext.com>
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

Hello,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Thu, 13 Sep
2018 14:58:49 +0900:

> I thought the read-back of the DMA_ENABLE register was unnecessary
> (at least it is working on my boards), then deleted it in commit
> 586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helper
> into caller").  Sorry, I was wrong - it caused a timing issue on
> Cyclone5 SoCFPGAs.
>=20
> Revive the register read-back, commenting why this is necessary.
>=20
> Fixes: 586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helpe=
r into caller")
> Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
