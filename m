Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R32iB-0006ej-Fw
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2011 09:21:56 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
	<dedekind1@gmail.com>
Date: Mon, 12 Sep 2011 11:20:37 +0200
Subject: RE: [PATCH 01/12] mtd: nand: initialize chip->oob_poi before write
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059C53FC55@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-2-git-send-email-computersforpeace@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "b35362@freescale.com" <b35362@freescale.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris wrote:

> For raw (i.e., w/o ECC) page writes (i.e., w/o OOB), we may=20
> not have initialized and filled the chip->oob_poi buffer.=20
> This can end up writing junk to the flash if we're not=20
> careful. Say, for example, we use `nandwrite -n' (without=20
> OOB). Then nand_do_write_ops calls
> chip->write_page, which writes OOB data with some previous, junk data.
>=20
> This fixes a bug with this commit (from l2-mtd-2.6.git):
>=20
>   commit a8ee364bbf14861d5d0af39c4da06c30441895fb
>   mtd: nand_base: always initialise oob_poi before writing OOB data

That's annoying that I missed that. :( Thanks for spotting said issue and p=
roviding a fix.

Regards

Adam
 =
