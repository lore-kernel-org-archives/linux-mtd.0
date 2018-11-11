Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwjU-000220-4x
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:53:25 +0000
Date: Sun, 11 Nov 2018 21:53:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mtd: rawnand: Provide helper for polling GPIO
 R/B pin
Message-ID: <20181111215311.5e8551b4@xps13>
In-Reply-To: <20181015194130.21764-1-jmkrzyszt@gmail.com>
References: <20181012204101.26274-1-jmkrzyszt@gmail.com>
 <20181015194130.21764-1-jmkrzyszt@gmail.com>
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

Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Mon, 15 Oct 2018
21:41:28 +0200:

> Each controller driver having access to NAND R/B pin over GPIO would
> have to reimplement the polling loop otherwise.
>=20
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Series applied to nand/next.

Thanks,
Miqu=C3=A8l
