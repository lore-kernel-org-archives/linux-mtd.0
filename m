From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Date: Thu, 4 Nov 2010 16:33:31 +0530
Subject: RE: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from board
	file
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0356BAC323@dbde02.ent.ti.com>
References: <1285596710-25658-1-git-send-email-s-ghorai@ti.com>
	<1285596710-25658-5-git-send-email-s-ghorai@ti.com>
	<AANLkTikKMnzHR5DZqzGdJJbnCXhCpxKA7K2C2ZtPhNke@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B0356BABFAE@dbde02.ent.ti.com>
	<AANLkTinOhBNUt+gvNb0MWiyHD8ZYgLDJPz8tc=p+CsVW@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B0356BAC2B6@dbde02.ent.ti.com>
	<AANLkTinNrZNuZnFfJKGLF9J3zsHsOTK0+VmUmYH88+c3@mail.gmail.com>
In-Reply-To: <AANLkTinNrZNuZnFfJKGLF9J3zsHsOTK0+VmUmYH88+c3@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Vimal Singh <vimal.newwork@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Grazvydas Ignotas [mailto:notasas@gmail.com]
> Sent: Thursday, November 04, 2010 4:27 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Artem.Bityutskiy@nokia.com; Vimal Singh; Tony
> Lindgren
> Subject: Re: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from
> board file
>=20
> On Thu, Nov 4, 2010 at 12:15 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
> >> -----Original Message-----
> >> From: Grazvydas Ignotas [mailto:notasas@gmail.com]
> >> OMAP3 pandora.
> >> What I wanted to say is that current mainline code has hw ECC forced
> >> which is wrong for some boards, and this patch did not make into last
> >> merge window, so NAND is broken. It would be good to take this patch
> >> out of larger series you sent earlier and resend as a fix for -rc1, so
> >> that NAND works on 2.6.37. =A0It's not too large and should probably b=
e
> >> ok for -rc2.
> >
> > [Ghorai]
> > There is an additional patch I will send (with this series by next week=
)
> to select the ECC from board file, such that different board file can
> select the different ECC method.
> >
> > 1. This is mainly for OMAP3630 onwards and has been aligned with many
> customers to use the hw ecc.
> >
> > 2. I did not understand how it's not working, would you please explain
> again? If you apply the series then it's storing the same ecc value in
> different location and generated from h/w module.
>=20
> It most likely works (need to test more), I was just complaining it's
> not upstream and sw ecc is broken on both 2.6.36 and 2.6.37.

[Ghorai] In 2.6.36, it's a s/w ecc by default and working in all platforms =
like - omap3430 SDP, zoom2, 3630SDP, ZOOM3.
So please explain more when you found that - sw ecc is broken on both 2.6.3=
6 =20

>=20
> > 3. This patches are not upstream yet; send me the git-link you referrin=
g
> that these patches are available in 2.6.37?
> Correct, they are not upstream, so that's why suggest sending smaller
> fix patch for 2.6.37-rc2, so that sw ecc works on 2.6.37.
