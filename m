Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFReQ-0006fH-O1
 for linux-mtd@lists.infradead.org; Sun, 06 May 2018 21:57:05 +0000
Date: Sun, 6 May 2018 23:56:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Make sure we wait tWB before polling
 the STATUS reg
Message-ID: <20180506235647.7ef3c8e3@xps13>
In-Reply-To: <20180504192431.16661-1-boris.brezillon@bootlin.com>
References: <20180504192431.16661-1-boris.brezillon@bootlin.com>
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

Hi Boris,

On Fri,  4 May 2018 21:24:31 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> NAND chips require a bit of time to take the NAND operation into
> account and set the BUSY bit in the STATUS reg. Make sure we don't poll
> the STATUS reg too early in nand_soft_waitrdy().
>=20
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
