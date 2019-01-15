Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjJzV-0005hT-Hs
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 08:22:34 +0000
Date: Tue, 15 Jan 2019 09:22:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190115092229.59e09c2d@xps13>
In-Reply-To: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
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

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 15 Jan
2019 17:11:34 +0900:

> Commit 6f1fe97bec34 ("mtd: rawnand: denali_dt: add more clocks based
> on IP datasheet") introduced a more correct binding that requires
> three named clocks.
>=20
> Now that all upstream DT files migrated over to it, remove the single
> anonymous clock support.

I would love to do that but I think this is against the "DT backward
compatibility rule". Anyway, IIRC it is accepted that this kind of
rule might be broken if decided per the arch-maintainer (in this
case, you I suppose). So if this is really what you want, I'll queue
it.


Thanks,
Miqu=C3=A8l
