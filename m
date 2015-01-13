Received: from mail-bn1bon0133.outbound.protection.outlook.com
 ([157.56.111.133] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB9b0-00013p-BG
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 22:05:55 +0000
From: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, "han.xu@freescale.com" <han.xu@freescale.com>
Subject: RE: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Date: Tue, 13 Jan 2015 22:05:29 +0000
Message-ID: <BY1PR0301MB12213C4577DB849CA161F51482400@BY1PR0301MB1221.namprd03.prod.outlook.com>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
 <20150113215817.GW9759@ld-irv-0074>
In-Reply-To: <20150113215817.GW9759@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Fabio.Estevam@freescale.com" <Fabio.Estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Hi Fabio,
>=20
> On Tue, Jan 13, 2015 at 07:45:22PM -0200, Fabio Estevam wrote:
> > On Tue, Jan 13, 2015 at 4:51 PM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> >
> > >> - Read the two flashes.
> > >
> > > Are you doing any verification to make sure you're reading the
> > > *correct* data? I'd imagine from some what I see in your patches,
> > > that you might actually be reading from the wrong flash.
> >
> > Yes, you are right. Just confirmed that with this v3 applied I erased
> > /dev/mtd0, but that also incorrectly erased /dev/mtd1.
> >
> > Now I came back to the original v1 patch: isn't it the simpler
> > approach for fixing the module load/unload crash problem?
> >
> > It only keeps the mtd unregistration index in sync with registration
> > and doesn't touch other areas of the driver.
> >
> > IMHO it is an improvement over the current situation.
>=20
> Right, I thought your original patch was an improvement, but it did still=
 leave
> some of the error path broken. And as Huang mentioned, multiple devices
> were never actually *properly* supported, so there were problems there.
>=20
> > I agree that this driver needs more rework, but I am not able to put
> > it on such good state.
>=20
> I might be OK with taking v1 if we can do the following:
>=20
> (1) Identify who will take responsibility for testing and improving this =
driver.
> We might even add a MAINTAINERS entry

Our QSPI driver owner Xu han (han.xu@freescale.com) will take responsibilit=
y to test and improve
This driver.  I will help him to be familiar with linux kernel community wo=
rk.=20

Best regards
Frank Li

>=20
> (2) Get an 'ack' from said person
>=20
> (3) Document the known issues with this driver; add some TODO/FIXME
> comments, and maybe disable potentially broken features until they get
> fixed (e.g., only probe up to 1 flash, leaving the second flash
> disabled)
>=20
> Huang mentioned that Frank may be interested in (1).
>=20
> Brian
