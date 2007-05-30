Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HtJo5-0003R2-NT
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 04:45:27 -0400
Subject: Re: Some issues with the AT91 dataflash driver...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20070530103857.629b84ee@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron> <20070528212513.5086bfac@newbox>
	<1180467763.3642.125.camel@sauron>
	<20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
	<1180509202.3642.131.camel@sauron>
	<20070530103857.629b84ee@dhcp-255-175.norway.atmel.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 May 2007 11:45:13 +0300
Message-Id: <1180514713.3642.135.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Michal Piotrowski <michal.k.k.piotrowski@gmail.com>,
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

On Wed, 2007-05-30 at 10:38 +0200, Haavard Skinnemoen wrote:
> On Wed, 30 May 2007 10:13:22 +0300
> Artem Bityutskiy <dedekind@infradead.org> wrote:
>=20
> > Thanks! Could you please try the below patch - it should help.
>=20
> It does. No more messages, the GC thread stays alive and I can execute
> binaries from the mount. Thanks!

OK, good, now I do not understand how and why it worked on NAND ...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
