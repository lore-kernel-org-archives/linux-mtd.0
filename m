Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GaYqf-0000rg-0h
	for linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 10:26:32 -0400
Subject: Re: patch to leave cfi in read-array on suspend(reposted)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0610191020180.1971@xanadu.home>
References: <20061019140534.10858.qmail@web54408.mail.yahoo.com>
	<Pine.LNX.4.64.0610191020180.1971@xanadu.home>
Content-Type: text/plain; charset=utf-8
Date: Thu, 19 Oct 2006 17:26:07 +0300
Message-Id: <1161267967.3260.130.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Anders <dave123_aml@yahoo.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-10-19 at 10:21 -0400, Nicolas Pitre wrote:
> > during some testing with several samsung s3c24xx based
> > devices it was discovered that often the
> > cfi_cmdset_0001.c would not leave the chip in
> > read-array mode on suspend. this is an issue if the
> > same flash chip is used for the bootloader that needs
> > to be read on resume. attached is a patch generated
> > against the 2.6.18 kernel and has been tested with
> > several s3c24xx based devices as well as several sharp
> > lh79520 devices. your feedback would be appreciated.
> >=20
> > Signed-off-by: David Anders <danders@amltd.com>
>=20
> Signed-off-by: Nicolas Pitre <nico@cam.org>

Thanks,

will add it to my git tree and take care about its destiny.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
