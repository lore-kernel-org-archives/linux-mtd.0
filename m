Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H9l3F-0002Te-3y
	for linux-mtd@lists.infradead.org; Wed, 24 Jan 2007 11:32:47 -0500
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: Artem Bityutskiy <dedekind@infradead.org>
To: Benedikt Spranger <b.spranger@linutronix.de>
In-Reply-To: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
Content-Type: text/plain; charset=utf-8
Date: Thu, 25 Jan 2007 03:30:29 +1100
Message-Id: <1169656229.3609.4.camel@sauron>
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

Hi Benedikt,

On Mon, 2007-01-22 at 23:09 +0100, Benedikt Spranger wrote:
> Hello,
>=20
> linking the current ubi-2.6 git tree results in tons of "`.exit.text'
> referenced in section `.text'" or ".init.text". Solution is simple:
> remove all __exit in referenced function.

Yeah, I was actually planning to do the same and get rid of most
__init/__exit. But still out of curiosity, may you please elaborate on
the problem?


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
