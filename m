Date: Fri, 5 Oct 2018 16:37:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof
 Halasa <khalasa@piap.pl>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: ixp4xx: include linux/mtd/platnand.h
Message-ID: <20181005163704.12661da6@xps13>
In-Reply-To: <20180926130458.2406549-2-arnd@arndb.de>
References: <20180926130458.2406549-1-arnd@arndb.de>
 <20180926130458.2406549-2-arnd@arndb.de>
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

Hi Arnd,

Arnd Bergmann <arnd@arndb.de> wrote on Wed, 26 Sep 2018 15:04:39 +0200:

> The platform_nand_data structure definition is required for ixdp425
> but has now moved to a new header file:
>=20
> arch/arm/mach-ixp4xx/ixdp425-setup.c:98:15: error: variable 'ixdp425_flas=
h_nand_data' has initializer but incomplete type
>  static struct platform_nand_data ixdp425_flash_nand_data =3D {
>                ^~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/ixdp425-setup.c:99:3: error: 'struct platform_nand_d=
ata' has no member named 'chip'
>=20
> Fixes: 19cf5dfa3a31 ("mtd: rawnand: Move platform_nand_xxx definitions ou=
t of rawnand.h")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Sorry for the delay, squashed in nand/next with the commit introducing
the regression.

Thanks,
Miqu=C3=A8l
