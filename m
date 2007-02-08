Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFBFX-0002zc-KN
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 10:31:54 -0500
Subject: Re: OneNAND test modules
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <45CB3F4C.8080001@nokia.com>
References: <45CB3F4C.8080001@nokia.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Feb 2007 17:31:37 +0200
Message-Id: <1170948697.7984.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-08 at 17:18 +0200, Adrian Hunter wrote:
> There are 4 test modules in users/ahunter/nand-tests.git
> that I have found useful for testing OneNAND.  They are:
>=20
> oobtest		Test reading and writing oob with auto-placement
> pagetest	Test reading and writing some pages
> subpagetest	Test reading and writing some sub-pages
> torture		Artem's torture test (here at Artem's request)

Cool stuff!

Josh, I would recommend you to try the sub-page test out, as you use the
sub-page feature and is relatively new. It helped use with OneNAND.

P.S. May be we may put the tests to /home/git ?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
