Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG3PL-0000v4-PL
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 14:16:02 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>
Subject: RE: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry for
 error
Date: Tue, 8 May 2018 14:15:42 +0000
Message-ID: <TY1PR01MB09544BC0D2D5A5737EE2DD85DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508132037.152cc581@bbrezillon>
In-Reply-To: <20180508132037.152cc581@bbrezillon>
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

Hi Boris-san,

Thank you so much for your review comments.

> > For the word write functions it is retried for error.
> > But it is not implemented to retry for the erase functions.
> > To make sure for the erase functions change to retry as same.
>=20
> Can you give a bit more context, like why this is needed, where did
> you see the problem (which chip/controller), ...

  Okay I will do update the commit message to add more context.

> > -#define MAX_WORD_RETRIES 3
> > +#define MAX_WRITE_RETRIES 3
>=20
> Not sure why you rename this macro, but if it's needed can you do that
> in a separate patch?

  The reason is just to share the definition for both the word write and er=
ase functions.
  Okay I will consider to do this in a separate patch.

> > -		pr_debug("Using buffer write method\n" );
> > +		pr_debug("Using buffer write method\n");
>=20
> Same for coding style issues, they should be fixed in a separate commit.

  Okay I will do that.

> > +		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
> > +			goto retry;
>=20
> Shouldn't we have a MAX_ERASE_RETRY for that?

  It is okay also and I also thought this at first.
  But the similar definitions are defined so I thought that it is better to=
 be shared as MAX_WRITE_RETRIES.

> Also, what makes you think the following erase operations will work?

  I think that it is possible to be recovered by the retry and it is same f=
or the word write operations.

Regards,
Ikegami
