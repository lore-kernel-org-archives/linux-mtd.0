Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJa7J-0003Tm-RR
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 08:20:19 +0000
Date: Mon, 5 Nov 2018 09:19:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mtd: nand: drop kernel-doc notation for a deleted
 function parameter
Message-ID: <20181105091946.1bd5c854@xps13>
In-Reply-To: <88c00c96-cfd2-4ff1-e753-8875501895df@infradead.org>
References: <88c00c96-cfd2-4ff1-e753-8875501895df@infradead.org>
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

Hi Randy,

Subject prefix should be "mtd: rawnand:".

Randy Dunlap <rdunlap@infradead.org> wrote on Sun, 4 Nov 2018 18:38:35
-0800:

> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> Remove kernel-doc notation for a deleted function parameter to prevent
> a kernel-doc warning:
>=20
> ../drivers/mtd/nand/raw/nand_base.c:603: warning: Excess function paramet=
er 'mtd' description in 'panic_nand_wait'
>=20
> Fixes: f1d46942e823 ("mtd: rawnand: Pass a nand_chip object to chip->wait=
func()")
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
