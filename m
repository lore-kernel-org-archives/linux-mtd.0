Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g42gN-0005cN-Qm
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2018 11:36:37 +0000
Date: Sun, 23 Sep 2018 13:35:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] mtd: rawnand: ams-delta: Cleanups and optimizations
Message-ID: <20180923133557.08107d3b@xps13>
In-Reply-To: <20180919225255.31175-1-jmkrzyszt@gmail.com>
References: <20180820213904.13475-1-jmkrzyszt@gmail.com>
 <20180919225255.31175-1-jmkrzyszt@gmail.com>
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

Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Thu, 20 Sep 2018
00:52:52 +0200:

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
>=20
>=20

Series applied on nand/next.

Thanks,
Miqu=C3=A8l
