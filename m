Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGDw-0001su-3U
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:12:35 +0000
Date: Thu, 19 Jul 2018 23:12:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: Remove unused caller_is_module() definition
Message-ID: <20180719231209.4ca37419@xps13>
In-Reply-To: <20180719204738.9564-1-boris.brezillon@bootlin.com>
References: <20180719204738.9564-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
22:47:38 +0200:

> Commit 260e89a6e0d6 ("mtd: core: tone down suggestion that dev.parent
> should be set") removed the only user of caller_is_module() but forgot
> to remove the definition itself. Let's remove it now.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
