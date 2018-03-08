Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etwk5-0003Az-Vb
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2018 14:42:05 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 tharvey@gateworks.com, stable <stable@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] ubi: Reject MLC NAND
Date: Thu, 08 Mar 2018 15:43:12 +0100
Message-ID: <3797589.z8fAhu5iDP@blindfold>
In-Reply-To: <CACRpkdYOqt4xTqGmbSwd_R84NRD8GA9TsHEk_hJ68hhxwbsL_Q@mail.gmail.com>
References: <20180303104554.5958-1-richard@nod.at>
 <CACRpkdYOqt4xTqGmbSwd_R84NRD8GA9TsHEk_hJ68hhxwbsL_Q@mail.gmail.com>
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

Linus,

Am Donnerstag, 8. M=E4rz 2018, 14:42:16 CET schrieb Linus Walleij:
> On Sat, Mar 3, 2018 at 11:45 AM, Richard Weinberger <richard@nod.at> wrot=
e:
> > While UBI and UBIFS seem to work at first sight with MLC NAND, you will
> > most likely lose all your data upon a power-cut or due to read/write
> > disturb.
> >=20
> > In order to protect users from bad surprises, refuse to attach to MLC
> > NAND.
> >=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Richard Weinberger <richard@nod.at>
>=20
> I'm sorry to disturb in this interesting discussion about what
> "stable" really means as in "stable kernel".  Stable for who and
> in what sense, that seems to be the question.
>=20
> But my main problem here is to understand who the consumers
> of the MLC NAND devices really are.
>=20
> I hear some talk here about lab boards. But where is this
> really deployed, large-scale? And who are the people that
> will have their devices potentially not booting after this patch?
>=20
> I am pretty sure these people are board support or
> customization consultants with work being done for some
> certain products, and not hobbyists and even less end
> consumers, right?

Correct.
I saw vendor specific kernels that have hardware and software hacks to make=
=20
UBI on MLC NAND somehow work.
Somehow in terms of, the filesystem will die just a little later.

But these people do _not_ run a vanilla (stable) kernel.
We support mainline, nothing more, nothing less.

> What kind of devices are MLC NANDs being deployed in?
> Certainly not laptops, tablets and phones, they all use eMMC
> and even start to venture into UFS (unified flash storage).
>=20
> What is using these flashes? Routers and switches? NAS boxes?
> Industrial control? Automotive?
>=20
> Or are (God forbid, but would not surprise me) talking about a
> Linux instance running inside of eMMCs or UFS devices?

We need to clarify that even more. Upstream UBI and UBIFS cannot work with =
MLC=20
NAND correctly. Any such product would die within days...
I have many MLC boards on my desk, by running a mainline kernel on them, I =
can=20
kill every single one within a few minutes, either by plugging the power or=
=20
triggering read-disturb.

As stated by David Woodhouse, it was a huge mistake by UBI to not reject ML=
C=20
NAND from the very beginning.
The sole purpose of this patch is fixing that mistake and make it very clea=
r.

Thanks,
//richard
