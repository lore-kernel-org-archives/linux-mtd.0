Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkNgv-0004By-4c
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 18:09:37 +0000
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions
	causes kernel panic
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 Apr 2008 21:05:33 +0300
Message-Id: <1207937133.5965.17.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: nickpiggin@yahoo.com.au, Jean Pihet <jpihet@mvista.com>, joern@logfs.org,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-11 at 19:00 +0100, Alexey Korolev wrote:
> Hi Jean,
> > Alexey,
> >=20
> > Here is the patch (attached) I applied to get a stable JFFS2 filesystem=
.
> > The changes have been cherry picked from=20
> > http://sourceforge.net/projects/mtd-mods.
> >=20
> > I stressed it with intensive read/write, flash fill-up and data removal=
. A few=20
> > GB's of data have been transferred without any problem. I didn't try th=
e tool=20
> > you mentionned though.
> > Tested on OMAP3 platform.
> >=20
> > Now I am testing with PREEMPT_RT config.
>=20
> Oh very interesting link. I'm glad to hear that people use it - even
> before announce. Actually I know this project very well - I'm the author =
and maintainer of this ;-). The project will be announced soon.

So why did you start this project? How about just making all your work
to go into mainline instead?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
