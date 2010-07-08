Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWseE-00054j-36
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 15:04:23 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>, "'Sean Preston'"
	<seanp@pfk.co.za>, Linux-MTD List <linux-mtd@lists.infradead.org>
Date: Thu, 8 Jul 2010 10:03:46 -0500
Subject: RE: New NAND Help
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9F1351CD@dlee01.ent.ti.com>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
	<0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
	<0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
	<0A40042D85E7C84DB443060EC44B3FD325405DE5AF@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD325405DE5AF@dekaexchange07.deka.local>
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



>=20
> <snip>
>=20
> > This device is probably a ONFI device. Thus the fourth ID byte might no=
t
> > be properly interpreted.
> >
>=20
> That is correct.  Micron used to support both the ID byte and the
> parameter page in their ONFO 1.0 compliant parts, but seems to have
> dropped support in their newer ONFI 2.1 compliant parts.  I found out the
> hard way when switching from an mlc part to an slc part.


So did i
IIRC there were some discussions on the list to add support for these devic=
es and reading the relevant info from the param page.=20
>=20
> Eric


The issue with the DM365 is that the RBL is not geared up for these devices=
.

Sandeep
