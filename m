Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXiX8-0005kG-29
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 07:37:19 +0000
Date: Tue, 26 Jun 2018 09:36:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Martin Kaiser <martin@kaiser.cx>, David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180626093650.5835593b@xps13>
In-Reply-To: <20180626092413.703249c8@bbrezillon>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
 <20180626091005.08d56b2a@xps13>
 <20180626092413.703249c8@bbrezillon>
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

Hi Boris,

On Tue, 26 Jun 2018 09:24:13 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Tue, 26 Jun 2018 09:10:05 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hi Martin, Boris,
> >=20
> > On Fri, 22 Jun 2018 16:50:25 +0200, Martin Kaiser <martin@kaiser.cx>
> > wrote:
> >  =20
> > > mxcnd_probe_dt is called from mxcnd_probe, which is not marked as __i=
nit.
> > >    =20
> >=20
> > I think this line is just a side note and should be at the end of the
> > commit log.
> >  =20
> > > Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> > > potentially be called at any time. After the __init functions are cle=
aned,
> > > mxcnd_probe_dt is no longer available. Calling it anyway causes a cra=
sh.   =20
> >=20
> > The above paragraph explains the problem and the solution, you can just
> > add something like "mcvnd_probe is untouched because it is already not
> > marked as __init" instead of the first line.
> >  =20
> > >=20
> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>   =20
> >=20
> > Boris, do you think this patch is a good candidate for stable?
> >=20
> > If yes, Martin, could you please add a couple of stable/fixes tags above
> > your SoB? =20
>=20
> We should at least have a Fixes tag. For the stable one, I'm not so
> sure because the bug does not exist in practice (the compiler always
> inline mxcnd_probe_dt()).

Fine, then a Fixes tag will be enough and I will take it into
nand/next as it is not urgent at all to have it in the main tree.


Miqu=C3=A8l
