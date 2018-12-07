Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVAqM-0006Sh-F5
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 07:46:40 +0000
Date: Fri, 7 Dec 2018 08:46:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 0/2] mtd: rawnand: denali: clean-up unnecessary hook
 and device reset
Message-ID: <20181207084625.2d93c769@xps13>
In-Reply-To: <1543382857-30827-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543382857-30827-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Wed, 28 Nov
2018 14:27:35 +0900:

> I sent this series on September,
> and Miquel replied this series was applied:
> http://patchwork.ozlabs.org/patch/967242/
>=20
> But, It turned out not applied.
>=20
> I rebased it and resending now.
>=20
>=20
> Masahiro Yamada (2):
>   mtd: rawnand: denali: remove ->dev_ready() hook
>   mtd: rawnand: denali: remove denali_reset_banks()
>=20
>  drivers/mtd/nand/raw/denali.c | 52 +------------------------------------=
------
>  1 file changed, 1 insertion(+), 51 deletions(-)
>=20

I don't know how I missed those. Sorry for that, they are now applied
on nand/next.


Thanks,
Miqu=C3=A8l
