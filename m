Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adEE7-0003VB-IO
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 09:46:52 +0000
Date: Tue, 8 Mar 2016 10:46:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <dwmw2@infradead.org>, <zajec5@gmail.com>, <jteki@openedev.com>,
 <ezequiel@vanguardiasur.com.ar>, <juhosg@openwrt.org>,
 <shijie.huang@intel.com>, <mika.westerberg@linux.intel.com>,
 <furquan@google.com>, <han.xu@freescale.com>,
 <fabio.estevam@freescale.com>, <manabian@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
 <raojun@hisilicon.com>, <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
 <zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>, Binquan Peng
 <pengbinquan@huawei.com>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Message-ID: <20160308104628.6224bde2@bbrezillon>
In-Reply-To: <56DE9A79.30704@huawei.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
 <20160307225229.GC55664@google.com> <56DE9A79.30704@huawei.com>
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

On Tue, 8 Mar 2016 17:25:13 +0800
Jiancheng Xue <xuejiancheng@huawei.com> wrote:

> Hi Brian=EF=BC=8C
>    Thank you very much for your comments.
>=20
> On 2016/3/8 6:52, Brian Norris wrote:
> [...]
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/=
Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> >> new file mode 100644
> >> index 0000000..7407147
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> >=20
> > This is not a SPI controller (or is it? it looks like a SPI NOR
> > controller that doesn't do generic SPI), so it shouldn't go in the spi/
> > directory.
> >=20
> OK. I'll move this file into Documentation/devicetree/bindings/mtd.
>=20
> >> @@ -0,0 +1,25 @@
> >> +HiSilicon SPI-NOR Flash Controller
> >> +
> >> +Required properties:
> >> +- compatible : Should be "hisilicon,hisi-sfc" and one of the followin=
g strings:
> >> +		"hisilicon,hi3519-sfc"
> >> +- address-cells : number of cells required to define a chip select
> >> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
> >=20
> > This is not exactly a typical SPI bus, though I suppose some of that
> > documentation could apply...
> >=20
>=20
> OK. I'll modify the description.
>=20
> [...]
> >> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *=
buf,
> >> +		int len)
> >> +{
> >> +	struct hifmc_priv *priv =3D nor->priv;
> >> +	struct hifmc_host *host =3D priv->host;
> >> +	int ret;
> >> +
> >> +	ret =3D hisi_spi_nor_send_cmd(nor, opcode, len);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	memcpy(buf, host->iobase, len);
> >=20
> > sparse doesn't like any of these memcpy()'s, since that's __iomem. Are
> > you sure you want a regular memcpy here, and elsewhere?
> >=20
> It's not a must to use memcpy though host->iobase represents a segment of=
 inner memory
> which stores data from flash device byte by byte.  I will give up using m=
emcpy here and
> hisi_spi_nor_write_reg() in next version. Thank you!

Or you can use memcpy_fromio(), which should give you better perfs than
using readX() accessors in a loop.


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
