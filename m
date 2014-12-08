From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>
Subject: RE: [V6 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Mon, 8 Dec 2014 08:50:39 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315F03C4@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315EF2C5@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315EF2C5@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>This patch adds code which enables Quad I/O mode on Micron SPI NOR flashes=
.

>For Micron SPI NOR flash,enabling or disabling quad I/O protocol can be do=
ne By two methods, which are to=20
>use EVCR(Enhanced Volatile Configuration Register) and the ENTER QUAD I/O =
MODE command.There is no=20
>difference between these two methods.Unfortunately,for some Micron spi nor=
 flashes,there no ENTER Quad=20
>I/O command(35h),such as n25q064.But for all current Micron spi nor,if it =
support quad I/O mode,using=20
>EVCR definitely be supported.It is a recommended method to enable Quad I/O=
 mode by EVCR,Quad I/O protocol=20
>bit 7.When EVCR bit 7 is reset to 0,the SPI NOR flash will operate in quad=
 I/O mode.

>This patch has been tested on N25Q512A and MT25TL256BAA1ESF.Micron spi nor=
 of spi_nor_ids[] table all=20
>support this method.

>Signed-off-by: bean huo <beanhuo@micron.com>
>Acked-by: Marek Vasut <marex@denx.de>
>---
>v1-v2:
>	Modified to that capture wait_till_ready()
>	return value,if error,directly return its
>	the value.
 >v2-v3:
>	Directly use the reurning error value of
>	read_reg and write_reg,instead of -EINVAL.
> v3-v4:
>	Modify commit logs that wraped into 80 columns.
> v4-v5:
>	Rebuild new patch based on latest linux-mtd.
> v5-v6:
>	Rebuild patch based on latest l2-mtd.
>	add some comments.
>	Add SPI_NOR_QUAD_READ flag in the spi_nor_ids[] for Micron spi nor.

Hi,Brian

This patch is based on the latest l2-mtd,I don't know if can pass?
I have one question is that about following code.
I have added our Mciron quad flag into spi_nor_ids[] table,but line over 80=
 characters,
If I divided one line into two lines,this will make spi_nor_ids[] table loo=
k ugly.I also find that
There are other venders configure line that also over 80 characters,such as=
 Spansion,Catalyst.
So I don't divide my following configure line into two two lines,I don't kn=
ow if this can=20
Be accepted?
=20
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUA=
D_READ) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | S=
PI_NOR_QUAD_READ) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | S=
PI_NOR_QUAD_READ) },
+	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | S=
PI_NOR_QUAD_READ) },
=20
