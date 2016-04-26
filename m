Date: Tue, 26 Apr 2016 09:51:28 +0200
From: Stefan Christ <s.christ@phytec.de>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160426075128.GC2351@lws-christ>
References: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Apr 25, 2016 at 02:35:12PM +0200, Markus Pargmann wrote:
> ECC is only calculated for written pages. As erased pages are not
> actively written the ECC is always invalid. For this purpose the
> Hardware BCH unit is able to check for erased pages and does not raise
> an ECC error in this case. This behaviour can be influenced using the
> BCH=5FMODE register which sets the number of allowed bitflips in an erased
> page. Unfortunately the unit is not capable of fixing the bitflips in
> memory.
>=20
> To avoid complete software checks for erased pages, we can simply check
> buffers with uncorrectable ECC errors because we know that any erased
> page with errors is uncorrectable by the BCH unit.
>=20
> This patch adds the generic nand=5Fcheck=5Ferased=5Fecc=5Fchunk() to gpmi=
-nand
> to correct erased pages. To have the valid data in the buffer before
> using them, this patch moves the read=5Fpage=5Fswap=5Fend() call before t=
he
> ECC status checking for-loop.
>=20
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> [Squashed patches by Stefan and Boris to check ECC area]
> Cc: Stefan Christ <s.christ@phytec.de>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>=20
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Tested-by: Stefan Christ <s.christ@phytec.de>

I verified the fix again on our board.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ
