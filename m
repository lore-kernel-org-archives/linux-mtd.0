Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHaF-0002u8-Sc
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:51:09 +0000
Date: Sun, 8 Jul 2018 23:50:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Peter Pan
 <peterpandong@micron.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Use 2-factor allocator calls
Message-ID: <20180708235055.7fbc7191@xps13>
In-Reply-To: <20180704172759.GA33591@beast>
References: <20180704172759.GA33591@beast>
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

Hi Kees,

Kees Cook <keescook@chromium.org> wrote on Wed, 4 Jul 2018 10:27:59
-0700:

> As already done treewide, switch from open-coded multiplication to using
> 2-factor allocator helpers.
>=20
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Merged with the original commit.

Thanks,
Miqu=C3=A8l
