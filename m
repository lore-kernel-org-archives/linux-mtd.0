Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCp67-0004Si-A2
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 10:27:51 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: Daniel Mack <zonque@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>
Subject: RE: [PATCH v2] mtd: devices: elm: check for device's presence
 before configuration
Date: Tue, 5 Mar 2013 10:26:41 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA92738@DBDE01.ent.ti.com>
References: <1362355040-27344-1-git-send-email-zonque@gmail.com>
 <87r4jvehcs.fsf@dell.be.48ers.dk> <5135C7D0.8010906@gmail.com>
In-Reply-To: <5135C7D0.8010906@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 05, 2013 at 15:54:16, Daniel Mack wrote:
> On 04.03.2013 08:47, Peter Korsgaard wrote:
> >>>>>> "Daniel" =3D=3D Daniel Mack <zonque@gmail.com> writes:
> >=20
> >  Daniel> In case the driver is not probed - due to config mismatches or=
 errors
> >  Daniel> in the DTS files - dev_get_drvdata() returns NULL, leading to =
an Ooops
> >  Daniel> during boot.
> >=20
> >  Daniel> Make elm_config() return an error in such cases to propagate t=
he error
> >  Daniel> up to the user, so it can fall back to software mode.
> >=20
> >  Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
> >  Daniel> Cc: Philip Avinash <avinashphilip@ti.com>
> >  Daniel> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >  Daniel> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> >=20
> > Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
>=20
> Philip, are you also ok with this?

Yes.
Thanks
Avinash

>=20
>=20
> Thanks,
> Daniel
>=20
>=20
