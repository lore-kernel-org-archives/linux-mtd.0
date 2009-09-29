Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Msg6t-0002E3-Q2
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 17:03:39 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Date: Tue, 29 Sep 2009 10:03:20 -0700
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
Message-ID: <B125D8217ABC4B43826503DE00A2D44910D7F2EB07@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
	<1254238936.3778.109.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EAE3@SJEXCHCCR01.corp.ad.broadcom.com>
	<4AC233D7.6070502@gmail.com>
In-Reply-To: <4AC233D7.6070502@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "dedekind@infradead.org" <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
> Sent: Tuesday, September 29, 2009 9:21 AM
> To: Darwin Rambo
> Cc: dedekind@infradead.org; linux-mtd@lists.infradead.org;=20
> Matthieu CASTET; Adrian Hunter
> Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
>=20
> On 09/29/2009 07:13 PM, Darwin Rambo wrote:
> > It is a bigger problem with 512K erase blocks. In this case, my
> > 6MB jffs2 image grows to over 14MB ubifs image due to=20
> padding. There are about 12
> > partial blocks with little data in the first few pages, and=20
> about 4 partial
> > blocks at the end. 16 partial blocks is about 8 MB of=20
> overhead on 6MB of
> > real content.
>=20
> Well, of course I do not object if someone implements the optimization
> you mentioned, but I do not have time to do this.
>=20
> --=20
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
>=20

I'm reluctant to implement something unless several people ask for it,
Otherwise it may be wasted effort and a candidate for future deprecation.=20
Let's wait and see. Thanks for your help understanding this.

Regards,
Darwin=
