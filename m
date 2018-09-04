Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxAay-0001x5-IA
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 12:38:13 +0000
Date: Tue, 4 Sep 2018 14:38:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ashish Kumar <ashish.kumar@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
Subject: Re: Query| USE of MTD_CFI_ADV_OPTIONS for SPI-NOR/serial-NOR flash
 for BE-kernel on arm64
Message-ID: <20180904143801.36297bb6@bbrezillon>
In-Reply-To: <VI1PR04MB4015390D61A2AA4F289CE15D95030@VI1PR04MB4015.eurprd04.prod.outlook.com>
References: <VI1PR04MB4015390D61A2AA4F289CE15D95030@VI1PR04MB4015.eurprd04.prod.outlook.com>
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

Hi Ashish,

On Tue, 4 Sep 2018 11:21:11 +0000
Ashish Kumar <ashish.kumar@nxp.com> wrote:

> Hi all,
>=20
> I may sound very na=C3=AFve, but I do not have other options to look for.
> What I was trying to achieve was "running BE-kernel on arm64, with the SP=
I-NOR controller(fsl_qspi) configured for AHB and IP buffer in BE mode. It =
works to an extent but not all is working correctly.

Could you detail what is working and what is not?

>=20
> I was grep-ing through /driver/mtd/ and include/linux/mtd to look for the=
se advance option(MTD_CFI_ADV_OPTIONS) to be used for SPI-NOR interface, is=
 there a way this(MTD_CFI_BE_BYTE_SWAP) can be achieved for SPI-NOR flash?
>=20
> Is anyone working on this, or similar thing?

That's not the proper fix. If you want you driver to work in
big-endian, fix the driver.

Regards,

Boris
