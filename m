Received: from mail-db5eur01on0049.outbound.protection.outlook.com
 ([104.47.2.49] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZwfd-0006Ys-Q5
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 08:58:00 +0000
From: Yunhui Cui <yunhui.cui@nxp.com>
To: Jagan Teki <jteki@openedev.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: RE: [PATCH v2] mtd: spi-nor: Add s25fs256s1 spi-nor flash support
Date: Wed, 17 Aug 2016 08:57:29 +0000
Message-ID: <VI1PR0401MB2640FF70F5770AEB32F7449E94140@VI1PR0401MB2640.eurprd04.prod.outlook.com>
References: <1470597730-10400-1-git-send-email-jteki@openedev.com>
In-Reply-To: <1470597730-10400-1-git-send-email-jteki@openedev.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Monday, August 08, 2016 3:22 AM, Jagan Teki wrote:

> Add Spansion s25fs256s1 spi-nor flash to the list of spi_nor_ids.
>=20
> In spansion S25FS-S family the physical sectors are grouped as normal and
> parameter sectors. Parameter sectors are 4kB in size with 8 set located
> at the bottom or top address of a device.
> Normal sectors are similar to other flash family with sizes of 64kB or 32
> kB.
>=20
> To erase whole flash using sector erase(D8h or DCh) won't effect the
> parameter sectors, so in order to erase these we must use 4K sector erase
> commands (20h or 21h) separately.
>=20
> So better to erase the whole flash using 4K sector erase instead of
> detecting these family parts again and do two different erase operations.
>=20
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Yunhui Cui <yunhui.cui@nxp.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> ---
> Changes for v2:
> 	- Fix wrong vendor name in commit message

[Yunhui] Actually, This flash is belongs to S25FS-S Family, besides,
S25FS128S 128 Mbit (16 Mbyte)
S25FS256S 256 Mbit (32 Mbyte)
S25FS512S 512 Mbit (64 Mbyte)
They need some specific operations, not the Spansion S25FL128S Family. Than=
ks

>=20
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
> nor.c index d0fc165..6ad7779 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -901,6 +901,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128,
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512,
> SECT_4K) },
>  	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256,
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
> --
> 2.7.4
