From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Date: Thu, 4 Nov 2010 06:32:17 +0530
Subject: RE: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from board
	file
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0356BABFAE@dbde02.ent.ti.com>
References: <1285596710-25658-1-git-send-email-s-ghorai@ti.com>
	<1285596710-25658-5-git-send-email-s-ghorai@ti.com>
	<AANLkTikKMnzHR5DZqzGdJJbnCXhCpxKA7K2C2ZtPhNke@mail.gmail.com>
In-Reply-To: <AANLkTikKMnzHR5DZqzGdJJbnCXhCpxKA7K2C2ZtPhNke@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	Vimal Singh <vimalsingh@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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
> Sent: Wednesday, November 03, 2010 6:33 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Vimal Singh; Artem.Bityutskiy@nokia.com
> Subject: Re: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from
> board file
>=20
> On Mon, Sep 27, 2010 at 5:11 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> > This patch makes it possible to select sw or hw (different layout
> options)
> > ecc scheme supported by omap nand driver. =A0And hw ecc layout selected
> for
> > sdp and zoom boards, by default.
> >
> > Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> > Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
>=20
> Any news on this? Commit 2c01946c accidentally (?) enabled hardware
> ECC and now my board is broken, as the driver always used sw ecc and
> my NAND partitions are formatted accordingly. We should at least
> switch the default back to sw ecc, don't you think?
[Ghorai]=20
1. which board you are working.=20
2. and the default layout is the same as previous=20
+       board_nand_data.ecc_opt         =3D OMAP_ECC_HAMMING_CODE_DIFF_LAYO=
UT;
