Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7Qp4-00040D-H1
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 08:41:34 +0000
Subject: Re: [PATCH/mtd-utils] Separate '-m' and the mode with a space when
	invoking 'install'
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0811261744m71593462md64fd363cbdc5062@mail.gmail.com>
References: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<8bd0f97a0811261744m71593462md64fd363cbdc5062@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 10:39:31 +0200
Message-Id: <1228207171.5029.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-11-26 at 20:44 -0500, Mike Frysinger wrote:
> On Wed, Nov 26, 2008 at 08:27, Enrico Scholz wrote:
> > Some 'install' versions (e.g. this of OpenEmbedded) require the mode
> > to be a separate argument and don't understand the '-m0755' syntax:
>=20
> then why dont you fix the `install` that comes with OE rather than
> spuriously patching random build systems out there ?

May be this point is sensible, but taking into account Enrico's answer
it does not hurt to amend mtd-utils, so I applied his patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
