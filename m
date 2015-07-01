From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: "git@xilinx.com" <git@xilinx.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
Date: Wed, 1 Jul 2015 02:19:00 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF3651A@NTXXIAMBX02.xacn.micron.com>
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
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

>drivers/mtd/spi-nor/spi-nor.c | 2 ++
> 1 file changed, 2 insertions(+)

>diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c=
 index e8f6131..10ba94f 100644
>--- a/drivers/mtd/spi-nor/spi-nor.c
>+++ b/drivers/mtd/spi-nor/spi-nor.c
>@@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, struct=
 flash_info *info)
 >		}
 >		return status;
 >	case CFI_MFR_ST:
>+		if (!(nor->spi->mode & SPI_TX_QUAD))
>+			return 0;
I think, this action should be done before callback set_quad_mode,and add s=
ome codes in=20
Spi controller driver.what is more,how do you get spi member in spi_nor?see=
ms no this member.

I have one concern that as long as spi nor be configed into quad mode,spi c=
ontroller must be also=20
immediately Transfer into quad mode, otherwise read status will be fail.
But setting spi controller layer(driver/spi/) and configure spi nor layer(d=
river/mtd/spi-nor)
 are not the same mtd layer,I found that it's hard to do.
But for new structure spi controller(such as driver/mtd/spi-nor/fsl-quadspi=
.c) is very reasonable.and=20
it can be easy to set spi controller and spi nor into quad mode at the same=
 time.

 >		status =3D micron_quad_enable(nor);
 >		if (status) {
 >			dev_err(nor->dev, "Micron quad-read not enabled\n");
>--
>1.9.1
