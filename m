Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrcql-0000Bi-2B
 for linux-mtd@lists.infradead.org; Fri, 21 Nov 2014 01:17:27 +0000
From: =?iso-2022-jp?B?UWkgV2FuZyAbJEIyJjUvGyhCIChxaXdhbmcp?=
 <qiwang@micron.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@imgtec.com" <ezequiel.garcia@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
Date: Fri, 21 Nov 2014 01:16:51 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A7713225E@NTXXIAMBX02.xacn.micron.com>
References: <mailman.22397.1416508326.22890.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.22397.1416508326.22890.linux-mtd@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ionela.voinescu@imgtec.com" <ionela.voinescu@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 11/20/2014 10:18 AM, Ezequiel Garcia wrote:
> Hm, perhaps it's better to rely in the NAND core code and avoid that BBT
> and ECC code handling duplication?
>=20
> Ionela and I are preparing an SPI NAND framework, but it's far from
> ready yet, so if you have something to submit, please do so :)

Yes, duplicate BBT and ECC code from nand code do is not a good idea.
But SPI NAND framework should be a standalone module in MTD, might cause
chaos if it still rely on NAND core code, that is my only concern.
How do you think?

Thanks

Qi Wang
