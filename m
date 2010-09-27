From: "Premi, Sanjeev" <premi@ti.com>
To: "Ghorai, Sukumar" <s-ghorai@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
Date: Mon, 27 Sep 2010 19:28:49 +0530
Subject: RE: [PATCH v5 5/5] omap: nand: making ecc layout as compatible with
	romcode ecc
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB5930233C3631E@dbde02.ent.ti.com>
References: <1285594634-19277-1-git-send-email-s-ghorai@ti.com>
	<1285594634-19277-6-git-send-email-s-ghorai@ti.com>
In-Reply-To: <1285594634-19277-6-git-send-email-s-ghorai@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Vimal Singh <vimalsingh@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-omap-owner@vger.kernel.org=20
> [mailto:linux-omap-owner@vger.kernel.org] On Behalf Of Sukumar Ghorai
> Sent: Monday, September 27, 2010 7:07 PM
> To: linux-omap@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org;=20
> linux-arm-kernel@lists.infradead.org; Ghorai, Sukumar; Vimal Singh
> Subject: [PATCH v5 5/5] omap: nand: making ecc layout as=20
> compatible with romcode ecc
>=20
>     This patch overrides nand ecc layout and bad block=20
> descriptor (for 8-bit
>     device) to support hw ecc in romcode layout. So as to=20
> have in sync with ecc
>     layout throughout; i.e. x-loader, u-boot and kernel.
>=20
>     This patch also enables to use romcode ecc for spd and=20
> zoom, by default.
>=20
>     This enables to flash x-loader, u-boot, kernel, FS images=20
> from kernel itself
>     and compatiable with other tools.
>=20
The description seems to start with different whitespace indents
in this patch series.

~sanjeev

[snip]...[snip]=
