Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctrPb-00064j-8b
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 07:56:00 +0000
Date: Fri, 31 Mar 2017 09:55:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] mtd: move code reading DT specified part probes to
 the common place
Message-ID: <20170331095532.720e9348@bbrezillon>
In-Reply-To: <20170331094213.055149e1@bbrezillon>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170331094213.055149e1@bbrezillon>
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

On Fri, 31 Mar 2017 09:42:13 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Rafal,
>=20
> On Thu, 30 Mar 2017 23:53:31 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>=20
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > Handling (creating) partitions for flash devices requires using a proper
> > driver that will read partition table (out of somewhere). We can't
> > simply try all existing drivers one by one, so MTD subsystem allows
> > drivers to specify a list of applicable part probes.
> >=20
> > So far physmap_of was the only driver with support for linux,part-probe
> > DT property. Other ones had list or probes hardcoded which wasn't making
> > them really flexible. It prevented using common flash drivers on
> > platforms that required some specific partition table access. =20
>=20
> I agree that having each flash device driver specify the set of
> partition parsers it supports is a bad idea (most of the time,
> partition table format are devicetype agnostic). On the other hand, I'm
> not a big fan of this property, and I would prefer a solution where all
> parsers are tested on each MTD device.
> But testing all parsers sequentially is not a perfect solution either
> because it increases boot-time and you can't really define the order in
> which partition parsers are tested (which means that if you have 2
> different partition table in 2 different format, you can't choose the
> one that has precedence on the other).
>=20
> I guess I can live with this "linux,part-probe" property, even if,
> as the names implies, it's not really describing hardware, and as
> such, does not have its place in DT :-P.
>=20
> >=20
> > This commit moves support for mentioned DT property to the common place
> > so it can be reused by other drivers. =20
>=20
> This property does not seem to be documented. Can you add a patch
> documenting it in Documentation/devicetree/bindings/mtd/common.txt and
> Cc the DT maintainers.

Please ignore this comment, it's already done in patch 2 :).

> Only then we'll see if this property is
> acceptable for them.
>=20
