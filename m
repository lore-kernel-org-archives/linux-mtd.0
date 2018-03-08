Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etxSX-0006RQ-Vf
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2018 15:28:08 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, tharvey@gateworks.com,
 stable <stable@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] ubi: Reject MLC NAND
Date: Thu, 08 Mar 2018 16:28:50 +0100
Message-ID: <10429741.dU3vzh71GH@blindfold>
In-Reply-To: <1520521275.20980.41.camel@gmail.com>
References: <20180303104554.5958-1-richard@nod.at>
 <3797589.z8fAhu5iDP@blindfold> <1520521275.20980.41.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am Donnerstag, 8. M=E4rz 2018, 16:01:15 CET schrieb Artem Bityutskiy:
> On Thu, 2018-03-08 at 15:43 +0100, Richard Weinberger wrote:
> > As stated by David Woodhouse, it was a huge mistake by UBI to not
> > reject MLC
> > NAND from the very beginning.
>=20
> Correction: when we were developing UBI/UBIFS and upstreamed them, MLC
> was widely used yet we did not really know about it. So there was
> nothing to reject yet.

You mean *not* widely used?
=20
> The mistake is that we did not add the reject timely. When people
> started reporting MLC issues we were answering that UBI/UBIFS stack
> needs more work to make MLC safe to use, and we hoped someone would do
> the work.

True.
TBH Boris and I also thought that adding MLC support is not a that big deal=
=2E..

Thanks,
//richard
