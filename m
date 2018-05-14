Received: from mail1.bemta12.messagelabs.com ([216.82.251.8])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI29O-0003bf-SP
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 01:19:44 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "PACKHAM
 Chris" <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Subject: [PATCH v4 0/2] mtd: cfi_cmdset_0002: Changes to retry for flash erase
Date: Mon, 14 May 2018 01:19:25 +0000
Message-ID: <TY1PR01MB095422887AF326BA75083C83DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
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

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

The flash erase error is caued on the Macronix flash device below.
  MX29GL512FHT2I-11G
Also it has been just confirmed to be able to reproduce.
And the retry function can resolved the flash erase error correctly.

Tokunori Ikegami (2):
  mtd: cfi_cmdset_0002: Change definition naming to retry write=20
    operation
  mtd: cfi_cmdset_0002: Change erase functions to retry for  error

 drivers/mtd/chips/cfi_cmdset_0002.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

--=20
2.16.1
