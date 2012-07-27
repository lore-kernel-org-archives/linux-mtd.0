Message-ID: <50126975.9010907@freescale.com>
Date: Fri, 27 Jul 2012 18:12:05 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Include IMX6 in the list of supported
 SoCs
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <20120727092959.GF3347@b20223-02.ap.freescale.net>
In-Reply-To: <20120727092959.GF3347@b20223-02.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8827=E6=97=A5 17:30, Richard Zhao =E5=86=99=
=E9=81=93:
> We don't need to list all SoCs. Shall we just check MXC or MXS ?
The gpmi nand controller only exits in mx23/mx23/mx50/mx6q. In=20
mx53/mx35, we use the mxc-nand controller.
So it's better to list all the supported SoCs here.

Best Regards
Huang Shijie
