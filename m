Received: from mail-db5eur03on062d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::62d]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmr13-00068s-F6
 for linux-mtd@lists.infradead.org; Wed, 30 Aug 2017 00:38:00 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Sanjay Tandel <sanjay.tandel@rockwellcollins.com>, "arnd@arndb.de"
 <arnd@arndb.de>, Scott Wood <oss@buserror.net>
Subject: RE: [PATCH v2] mtd: map: new driver for NXP IFC
Date: Wed, 30 Aug 2017 00:37:29 +0000
Message-ID: <HE1PR04MB124123999DA6E9CEE905F890979C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1504036047-38848-1-git-send-email-matthew.weber@rockwellcollins.com>
In-Reply-To: <1504036047-38848-1-git-send-email-matthew.weber@rockwellcollins.com>
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

Dear Matt,

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of
> Matt Weber
> Sent: Wednesday, August 30, 2017 1:17 AM
> To: linux-mtd@lists.infradead.org
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>; boris.brezillon@free-
> electrons.com; Sanjay Tandel <sanjay.tandel@rockwellcollins.com>;
> arnd@arndb.de
> Subject: [PATCH v2] mtd: map: new driver for NXP IFC
>=20
> From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
>=20
> This patch adds map driver for parallel flash chips interfaced over
> a NXP Integrated Flash Controller (IFC). This driver allows either
> 8-bit or 16-bit accesses, depending on bank-width, to parallel flash
> chips(like Everspin MR0A16A), which are physically mapped to CPU's
> memory space. For unaligned accesses, it performs read-modify-write
> operations to keep access size same as bank-width.
>=20


IFC is configured as per Flash's width per Chip select via boot-loader.=20

Can you please share more details about the driver requirement.=20
What is not working with NXP IFC?

--prabhakar
