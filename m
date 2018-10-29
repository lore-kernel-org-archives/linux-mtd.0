Date: Mon, 29 Oct 2018 10:47:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh@kernel.org>, Hanjie Lin
 <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu
 <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione
 <carlo@caione.org>, linux-amlogic@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181029104701.1bcdfbf3@xps13>
In-Reply-To: <1537433449-65213-3-git-send-email-jianxin.pan@amlogic.com>
References: <1537433449-65213-1-git-send-email-jianxin.pan@amlogic.com>
 <1537433449-65213-3-git-send-email-jianxin.pan@amlogic.com>
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

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> wrote
on Thu, 20 Sep 2018 16:50:49 +0800:

> From: Liang Yang <liang.yang@amlogic.com>
>=20
> Add initial support for the Amlogic NAND flash controller which found
> in the Meson-GXBB/GXL/AXG SoCs.
>=20
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---

I lost track of what's ongoing there, can you remind me the status of
the whole clk/nand series?

If the clock driver is ready, can you resend the NAND controller driver
please? IIRC it was in a pretty good shape already.

Thanks,
Miqu=C3=A8l
