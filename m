Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjZKz-00071M-Qo
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 19:55:22 +0000
From: Marek Vasut <marex@denx.de>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Move n25q032 entry to Micron devices list
Date: Wed, 29 Oct 2014 20:54:54 +0100
References: <1414576675-7792-1-git-send-email-Chunhe.Lan@freescale.com>
 <201410292019.20966.marex@denx.de>
 <CACna6rwFmtG01B2xwNgV9vrk945v5On1Mvm=4qfJP4Kxs-Oe8g@mail.gmail.com>
In-Reply-To: <CACna6rwFmtG01B2xwNgV9vrk945v5On1Mvm=4qfJP4Kxs-Oe8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201410292054.54381.marex@denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 Chunhe Lan <Chunhe.Lan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 29, 2014 at 08:43:32 PM, Rafa=C5=82 Mi=C5=82ecki wrot=
e:
> On 29 October 2014 20:19, Marek Vasut <marex@denx.de> wrote:
> > On Wednesday, October 29, 2014 at 06:40:46 PM, Rafa=C5=82 Mi=C5=82ecki =
wrote:
> >> On 29 October 2014 15:05, Marek Vasut <marex@denx.de> wrote:
> >> > On Wednesday, October 29, 2014 at 10:57:55 AM, Chunhe Lan wrote:
> >> >=20
> >> > [...]
> >> >=20
> >> > There are problems with this patch. Firstly, it misses any descripti=
on
> >> > explaining why the change took place at all. From an outside observer
> >> > point of view, this change seems random at best.
> >>=20
> >> This looks like a normal cleaning for me.
> >=20
> > We can only guess, since the commit message is missing.
>=20
> Maybe the topic says everything the patch does :)

Maybe :)

> >> > I can only speculate here, that your SPI NOR was
> >> > recognised as some other part, right ? That's why moving the n25q032
> >> > higher resolved the problem for you, right ?
> >> >=20
> >> > The problem is with the fragility of this code which matches the JED=
EC
> >> > ID and type of the SPI NOR. I recall Huang had some patches which
> >> > tried to resolve this, not sure what the status of those patches is
> >> > though.
> >>=20
> >> Wait, what? OK, this makes things tricky. Does this patch really
> >> change any behavior? How does it happen? I don't see any duplicated
> >> entry with the same JEDEC ID (0x20ba16).
> >>=20
> >> Could you give us some more details?
> >=20
> > Please see this thread:
> > http://lists.infradead.org/pipermail/linux-mtd/2014-April/053308.html
> >=20
> > This is where the discussion about ordering in the table took place
> > and where the patch for implementing the support for length of READID
> > return value was proposed.
>=20
> As I said, entry "n25q032" doesn't share JEDEC with anything else and
> does not even have an ext_id. So I don't think it's related to the
> s25fl128s vs. s25fl129p1 problem.

I hope that's the case. Clearly, proper commit message would help clarify
this case ;-)

Best regards,
Marek Vasut
