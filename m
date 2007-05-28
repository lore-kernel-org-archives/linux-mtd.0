Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsjHB-0006JK-Q5
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 13:45:03 -0400
Subject: Re: Some issues with the AT91 dataflash driver...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20070527211234.40777726@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 28 May 2007 20:44:40 +0300
Message-Id: <1180374280.3642.114.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Ivan Kuten <ivan.kuten@promwad.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2007-05-27 at 21:12 +0200, Haavard Skinnemoen wrote:
> On Sun, 27 May 2007 20:08:53 +0200
> Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:
>=20
> > Now that I've got the CRC errors sorted out, I'll try bisecting it.
>=20
> Done. git-bisect blames this commit:

Hi,

whats mtd->writesize of the flash? Do you have the debugging output log?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
