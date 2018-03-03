Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1es4ZY-00053V-UE
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 10:39:27 +0000
From: Richard Weinberger <richard@nod.at>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
Date: Sat, 03 Mar 2018 11:40:31 +0100
Message-ID: <3359334.BzATs06viZ@blindfold>
In-Reply-To: <CAJ+vNU3JhZRFfh-GC+SDXe0ynQadt1Yup4vLFfGuzRy_c5a8QQ@mail.gmail.com>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
 <4813843.hImRYGMsqb@blindfold>
 <CAJ+vNU3JhZRFfh-GC+SDXe0ynQadt1Yup4vLFfGuzRy_c5a8QQ@mail.gmail.com>
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

Tim,

Am Freitag, 2. M=E4rz 2018, 17:20:57 CET schrieb Tim Harvey:
> > Just to be sure, this is SLC NAND, right?
>=20
> No, its a MT29F16G08 16GB MLC

Sorry, MLC NAND is not supported by UBI and UBIFS [0].

The ECC errors you are facing are most likely caused by paired pages.
On MLC NAND, pages come in pairs. If a write operation is interrupted, not=
=20
only the current page is corrupted like on SLC, also the already written=20
paired page is lost too.
Boris Brezillon and I spent a lot of time in addressing this problem but ca=
me=20
to no good solution after all.
Well, we had a solution but it needs a lot of testing and fine tuning, sadl=
y=20
we run out of budget.
Beside of that, read and write disturb are also an important factor, this c=
an=20
be addressed with the experimental ubihealthd.

Thanks,
//richard

[0] http://linux-mtd.infradead.org/doc/ubifs.html#L_ubifs_mlc
