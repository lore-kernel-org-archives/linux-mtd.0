Received: from mail-ve1eur01on062e.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::62e]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqcOs-0001S0-Ph
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 10:54:40 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NOR access from ARM-BE toolchain
Date: Fri, 17 Aug 2018 10:54:24 +0000
Message-ID: <VI1PR0402MB38542274356BBA43DED30DDC973D0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
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

Hi Boris,

I am trying to access NOR flash with ARM running in big-endian mode.  But i=
t is causing error as " do_map_probe() failed for type cfi_probe"

On our platform, The connection between Flash controller and NOR flash is l=
ittle-endian.
Here, ARM core running in littler endian mode with MTD_CFI_NOSWAP every thi=
ngs work fine.=20

if we change ARM mode as big-endian, it start showing error as mentioned ab=
ove.=20
Error is same even with MTD_CFI_BE_BYTE_SWAP option.  =20
As per my understanding MTD_CFI_BE_BYTE_SWAP or MTD_CFI_LE_BYTE_SWAP deals =
with flash controller and flash connection.
Not sure, if take care of Core endianness also.=20

Please suggest!!

Regards,
Prabhakar
