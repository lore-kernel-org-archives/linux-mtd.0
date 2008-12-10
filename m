Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAPFw-0007F8-PV
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:37:37 +0000
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1228914665.3655.31.camel@localhost.localdomain>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
	<1228884752.3225.80.camel@localhost.localdomain>
	<1228898668.13686.223.camel@sauron>
	<1228914665.3655.31.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 15:35:19 +0200
Message-Id: <1228916119.13686.284.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-10 at 21:11 +0800, xiaochuan-xu wrote:
> On Wed, 2008-12-10 at 10:44 +0200, Artem Bityutskiy wrote:
> >=20
> > I think it does not matter much and we may use the same constant for
> > short term and unknown eraseblocks. I do not see much difference
> > between
> > 8 or 16. Does it really matter? We just want to prevent this
> > eraseblock
> > from being moved for some reasonable "time". And everything depends on
> > work-load of course. So I think just using the same constant for all
> > PEB
>=20
> My opposite experiment indicates that such unified-protection-time
> method seems to be not better than the different-protection-time one in
> run time. the system run time fluctuates.=20

I guess you would have to write a very special test to see any difference.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
