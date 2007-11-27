Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwz6I-0001Og-4u
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 11:59:44 +0000
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 27 Nov 2007 13:59:18 +0200
Message-Id: <1196164758.20132.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-11-27 at 20:48 +0900, Kyungmin Park wrote:
> In summary,
> NOR: no oob, no problem to write bytes.
> SLC NAND: has oob, NOP is allowed at least 2 and more.
> MCL NAND:  has oob, but NOP is 1.

Hi Kyungmin,

in MTD we call this stuff "sub-pages", so I'd suggest you to use this
term instead of NOP. People are not accustomed to NOP. Use whatever term
in the driver, but try to use "sub-pages" term when you go up to the
generic layer.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
