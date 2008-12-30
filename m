Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHd4A-0008OE-24
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 11:47:18 +0000
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4959E12D.9060609@nokia.com>
References: <4958F2AF.8060606@runbox.com>  <4959E12D.9060609@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Dec 2008 13:48:02 +0200
Message-Id: <1230637682.30332.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Cal Page <pagcal@runbox.com>, ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-30 at 10:51 +0200, Adrian Hunter wrote:
> Cal Page wrote:
> > How do I get past this UBIFS mount failure:
> >=20
> > UBIFS error (pid XXX): insert_node: duplicate sqnum in replay.
> >=20
> > UBIFS DBG (pid XXX): ubifs_bp_thread: background thread "ubifs_bht0_1" =
stops
>=20
> The error is fatal.  There is no getting past it.
>=20
> Perhaps you could send some more information.  What kernel version are yo=
u using?
> What patches have you applied? How did the problem arise? Can you send al=
l the
> kernel messages? Can you send an image of the file system?

I think he did not properly erase his flash, than flashed the image
somehow, and ended up with a mixture of old garbage and the new image.
But this is only a theory.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
