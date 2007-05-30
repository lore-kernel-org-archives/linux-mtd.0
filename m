Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HtPO9-00070U-0I
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 10:43:04 -0400
Subject: Re: Current status of UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jacky Lam <faichai0@yahoo.com>
In-Reply-To: <975540.55285.qm@web53002.mail.re2.yahoo.com>
References: <975540.55285.qm@web53002.mail.re2.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 May 2007 17:42:54 +0300
Message-Id: <1180536174.24399.12.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-30 at 07:28 -0700, Jacky Lam wrote:
>     Currently, I am searching for alternative of NFTL.
> I am happy to see that UBI is actively developin.
> Could someone tell me the status of UBI? It is usable
> now?
>=20
>     Also, NFTL seems only support flash with page size
> 512 only? Is it correctly? Any way to work around
> that?

It is usable, and it is merged to mainline. It is used in production by
some people. We develop a new file-system on top of it
(http://git.infradead.org/?p=3Dusers/dedekind/new-ubifs-2.6.git;a=3Dsummary=
)

I also quite quickly fix it when I get a bugreport, so it is maintained.

But make sure you understand that UBI is _NOT_ FTL. If you dig FAQ
(which is partially outdated, but still), you will find explanation why.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
