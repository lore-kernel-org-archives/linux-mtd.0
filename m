Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxRbm-0003jg-8c
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 06:48:12 +0000
Date: Wed, 5 Sep 2018 08:47:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: rawnand: ams-delta: Cleanups and optimizations
Message-ID: <20180905084757.432e7c19@xps13>
In-Reply-To: <20180820213904.13475-1-jmkrzyszt@gmail.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20180820213904.13475-1-jmkrzyszt@gmail.com>
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

Hi Janusz,

Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Mon, 20 Aug 2018
23:39:01 +0200:

> This series consist of possibly ready to apply patches extracted from
> a former one titled "mtd: rawnand:  ams-delta: Use GPIO API for data I/O".
> Remaining patches implementing conversion of data I/O to GPIO have been
> postponed until gpiolib is optimized to ensure sufficient performance.
>=20
>=20
> Janusz Krzysztofik (3):
>       mtd: rawnand: ams-delta: show parent device in sysfs
>       mtd: rawnand: ams-delta: Use private structure
>       mtd: rawnand: ams-delta: Set port direction when needed

Patch 2/3 does not apply on nand/next. Indeed the driver does not look
the same as in the diff. I don't see any changes on my side that could
explain this so perhaps you could rebase on top of 4.19-rc2 (or
nand/next, as you wish) and resend the series?

Thanks,
Miqu=C3=A8l
