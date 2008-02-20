Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRlvj-0004rn-8t
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 10:12:00 +0000
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.1.00.0802182214000.7583@apollo.tec.linutronix.de>
References: <1203342580.8085.23.camel@august>
	<alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
	<1203353343.8085.48.camel@august>
	<alpine.LFD.1.00.0802182214000.7583@apollo.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Feb 2008 12:10:00 +0200
Message-Id: <1203502200.3758.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	"Monte K. Copeland" <catboat@texas.net>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@de.ibm.com>, Alexander Schmidt1 <ALEXSCHM@de.ibm.com>,
	Frank Haverkamp <haver@vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-02-18 at 22:26 +0100, Thomas Gleixner wrote:
> I really give a sh*t whether Artem can use them or not. He is not the
> center of the universe. If he needs them changed, then he should send
> a patch or a suitable replacement for the tool, which does not force
> others to fixup their scripts and build tools for no benefit. This is
> not a sandbox, this are tools used in production environments.
>=20
> Artem, please stop this nonsense right now. You can create your own
> world if you have the urge to do so, but please keep stuff others use
> intact. This "I don't like that old crap" attitude is an arrogant and
> at the same time ignorant childish behaviour, which has no place in a
> serious project.
>=20
> > E.g. that he could not put the vid-hdr the
> > offset he wanted it to put. He promissed me to write up the deficiencie=
s
> > so that we can work on them. I am sure that after fixing, we can move
> > the tools back to their old location.
>=20
> No, they go back to their place immediately, period.
>=20
> Yours even more grumpy,

I apologize for this. Indeed that was not nice and arrogant. The tools
are returned to their previous place.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
