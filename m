Received: from mail1.bemta8.messagelabs.com ([216.82.243.206])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNxZw-00038H-FB
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 09:40:46 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v7 5/5] mtd: cfi_cmdset_0002: Change erase one block to
 enable XIP once
Date: Wed, 30 May 2018 09:39:21 +0000
Message-ID: <TY1PR01MB0954816CC3761C48AD85C89BDC6C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180527232801.1666-1-ikegami@allied-telesis.co.jp>
 <20180527232801.1666-6-ikegami@allied-telesis.co.jp>
 <20180529205751.44b2ba92@bbrezillon>
 <TY1PR01MB095408736BF00FE88D19AC13DC6D0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180530104907.7b37cd05@bbrezillon>
In-Reply-To: <20180530104907.7b37cd05@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris-san,

I have just sent v8 version patch series and it changed the 5/5 patch only.

> Then you should drop the Cc: stable tag.

  Yes just dropped it from 5/5 patch only by the v8 version patch series.

> >   I have just confirmed that the xip_enable() line itself was implement=
ed
> by the commit 02b15e343aeef.
> >   For this patch it is not a bug fix so I will not add the Fixes line
> into the commit message.
>=20
> Right.

  I see.

> >   But if needed it please let me know that.
>=20
> I checked the first patch and it seems it's one of these situation
> where the code predates git, so no need to specify a Fixes tag.

  I see so I will not change other 1/5 to 4/5 patches by the v8 version pat=
ch series.

Regards,
Ikegami

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, May 30, 2018 5:49 PM
> To: IKEGAMI Tokunori
> Cc: PACKHAM Chris; Brian Norris; David Woodhouse; Boris Brezillon; Marek
> Vasut; Richard Weinberger; Cyrille Pitchen;
> linux-mtd@lists.infradead.org; stable@vger.kernel.org
> Subject: Re: [PATCH v7 5/5] mtd: cfi_cmdset_0002: Change erase one block
> to enable XIP once
>=20
> Hello,
>=20
> On Tue, 29 May 2018 23:31:41 +0000
> IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:
>=20
> > Hi Boris-san,
> >
> > Thanks for your reviewing and advices.
> >
> > > Is this really a bug fix? Doesn't look like a bug fix to me.
> >
> >   No as you mentioned it is not a bug fix but just a refactoring to red=
uce
> xip_enable() line.
>=20
> Then you should drop the Cc: stable tag.
>=20
> >
> > > Also, every time you add Cc stable you should try to find the commit
> > > that introduced the bug. Sometime it's not possible because the bug
> > > existed before git was in use, but most of the time you'll find the
> > > offending commit using git blame.
> > >
> > > A fixes tag should be formatted like that:
> > >
> > > Fixes: <commit-id> ("commit subject")
> >
> >   Okay I will do that in future.
> >
> >   This is just FYI.
> >   I have just confirmed that the xip_enable() line itself was implement=
ed
> by the commit 02b15e343aeef.
> >   For this patch it is not a bug fix so I will not add the Fixes line
> into the commit message.
>=20
> Right.
>=20
> >   But if needed it please let me know that.
>=20
> I checked the first patch and it seems it's one of these situation
> where the code predates git, so no need to specify a Fixes tag.
>=20
> Thanks,
>=20
> Boris
