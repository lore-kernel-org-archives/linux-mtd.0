Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amFjH-0008HO-N8
 for linux-mtd@lists.infradead.org; Sat, 02 Apr 2016 07:12:20 +0000
Date: Sat, 2 Apr 2016 09:11:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Kamal Dasu
 <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely
 <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH V2 0/4] mtd: nand: add enum nand_ecc_algo
Message-ID: <20160402091156.00c01288@bbrezillon>
In-Reply-To: <20160330152710.0b33d28d@bbrezillon>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
 <20160330152710.0b33d28d@bbrezillon>
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

On Wed, 30 Mar 2016 15:27:10 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Rafal,
>=20
> On Wed, 23 Mar 2016 11:18:59 +0100
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>=20
> > Some time ago I started working on a new "nand-ecc-algo" property to al=
low
> > specifying ECC algorithm for hardware ECC mode as well.
> > Boris pointed out it's becoming a bit messy that way as we already have=
 value
> > NAND_ECC_SOFT_BCH.
> > I suggested deprecating "soft_bch" value from nand-ecc-mode property an=
d got
> > Boris agreed and no objections from others. So there is how I want to i=
mplement
> > this.
> > If you agree on this way & apply my patches, I'll start modifying NAND =
drivers
> > (similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH =
except
> > for handling backward compatibility.
> > Then finally we should be able to add "nand-ecc-algo" property support =
properly.
>=20
> Can you configure git-send-email to not encode your messages in base64?


Nevermind, my mailer was showing me base64 encoded content, but after a
reboot everything is back to normal. Don't know what happened exactly.



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
