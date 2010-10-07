From: "Menon, Nishanth" <nm@ti.com>
To: "G, Manjunath Kondaiah" <manjugk@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
Date: Thu, 7 Oct 2010 07:17:08 -0500
Subject: RE: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
	read/write
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C014F74831E@dlee02.ent.ti.com>
References: <1285063280-4057-1-git-send-email-manjugk@ti.com>
	<1285063280-4057-10-git-send-email-manjugk@ti.com>
In-Reply-To: <1285063280-4057-10-git-send-email-manjugk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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
> From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
> owner@vger.kernel.org] On Behalf Of G, Manjunath Kondaiah
> Sent: Tuesday, September 21, 2010 5:01 AM
> To: linux-omap@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org
> Subject: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
> read/write
>=20
> Following sparse warnings exists due to use of writel/w and readl/w
> functions.
>=20
> This patch fixes the sparse warnings by converting readl/w functions usag=
e
> into
> __raw_readl/__raw_readw functions.

Apologies on bringing up an old topic here -> Is'nt it better to fix readl/=
w or writel/w than replacing it with __raw_readl/w etc?



Regards,
Nishanth Menon

[...]
