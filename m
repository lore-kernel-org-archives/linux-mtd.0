Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPubZ-0002ZU-4u
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 15:39:45 +0000
From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Hou Zhiqiang <B48286@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "jonatas.rech@datacom.ind.br" <jonatas.rech@datacom.ind.br>,
 "Jane.Wan@gainspeed.com" <Jane.Wan@gainspeed.com>, "shijie.huang@intel.com"
 <shijie.huang@intel.com>, "valentin.longchamp@keymile.com"
 <valentin.longchamp@keymile.com>, "hkallweit1@gmail.com"
 <hkallweit1@gmail.com>, "hramrach@gmail.com" <hramrach@gmail.com>
CC: Hu Vincent <Mingkai.Hu@freescale.com>
Subject: RE: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
Date: Thu, 13 Aug 2015 15:38:50 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF447C2@NTXXIAMBX02.xacn.micron.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
In-Reply-To: <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
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


Hi,
Is it convenient to tell me that which vendor's spi nor?
For current spi nor structure, write operation has been already split trans=
action length
By page size(256 Bytes). But seems "retlen" not reasonable.

Spi nor read operation indeed does not take spi controller's transaction ab=
ility into
Account.but for spi nor, one-time read length is non-restrictive.

--Beanhuo
