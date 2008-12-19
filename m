Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDe3P-0001w1-Ap
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 12:02:03 +0000
Subject: Re: UBIFS option to make volume not do compression
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <56453.82824.qm@web58902.mail.re1.yahoo.com>
References: <56453.82824.qm@web58902.mail.re1.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 19 Dec 2008 14:02:42 +0200
Message-Id: <1229688162.2756.1.camel@sauron>
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

On Thu, 2008-12-18 at 20:56 -0800, Philip Rakity wrote:
> I would like the option to create an empty UBIFS file system that has com=
pression disabled.   I know I can do this via mkfs.ubifs, ubinit, etc ... b=
ut this is not helpful when just creating a empty file system for testing.
>=20
> this option would be equivalent to the -x none option.

>From Documentation/filesystems/ubifs.txt:

compr=3Dnone              override defoult comressor and set it to "none"
compr=3Dlzo               override defoult comressor and set it to "lzo"
compr=3Dzlib              override defoult comressor and set it to "zlib"

Just make sure you use up-to-date UBIFS, because this was added
recently. And I guess this should also be mentioned somewhere on the web
site.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
