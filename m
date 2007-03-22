Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUJbo-0006xi-40
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 05:29:29 -0400
Subject: Re: [PATCH/RFC] OneNAND simulator support
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
References: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Thu, 22 Mar 2007 11:28:54 +0200
Message-Id: <1174555734.17249.218.camel@sauron>
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

On Thu, 2007-03-22 at 09:51 +0900, Kyungmin Park wrote:
> Hi,
>=20
> This patch simulate various OneNAND flash chips for the MTD onenand layer=
.
> It's simple implementation, only basic operations.
> It don't support the recent changes in NANDSIM such as lazy block allocat=
ion,
> bitflip, and so on.
>=20
> Any comments are welcome.

Did you run our nand-tests to make sure it is OK?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
