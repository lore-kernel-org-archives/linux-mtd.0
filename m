Received: from smail3.alcatel.fr ([64.208.49.56])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZPXb-00040f-BL
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 15:40:32 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 22 Jun 2011 17:40:09 +0200
Subject: RE: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DF22@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308722112.18119.36.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308740228.18119.70.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DDB3@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DDB3@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adam Thomson Wrote:
>=20
> The original request was for a stable patch, and that would=20
> be accepted if I provided a proper tidy fix also. To be fair=20
> it was a few weeks ago now that that mail was sent. :-)=20
> Anyway, as it turns out the tidy fix was almost identical,=20
> and we don't need the memset as far as I can tell from=20
> reviewing code and from testing. Will run up your patch today=20
> to verify your additional change, but should be fine.
>=20

Have tested the updated patch on hardware, and all seems good.
No problems with OOB corruption, and mtd tests run without failure.

Thanks

Adam=
