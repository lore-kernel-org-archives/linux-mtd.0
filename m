Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0axy-000779-FA
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 06:29:44 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1182247254.5760.17.camel@localhost.localdomain>
References: <1182184301.6074.62.camel@localhost.localdomain>
	<1182239749.4403.48.camel@sauron>
	<1182247254.5760.17.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Jun 2007 13:29:22 +0300
Message-Id: <1182248962.4403.60.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-19 at 11:00 +0100, Richard Purdie wrote:
> On Tue, 2007-06-19 at 10:55 +0300, Artem Bityutskiy wrote:
> > On Mon, 2007-06-18 at 17:31 +0100, Richard Purdie wrote:
> > > +	if (mtd->erasesize < OOPS_PAGE_SIZE)
> > > +		erase.len =3D OOPS_PAGE_SIZE;
> >=20
> > It seems to me that your code won't work if mtd->erasesize <
> > OOPS_PAGE_SIZE anyway, so this check should not be here I guess.
>=20
> Its just a sanity check...

Then do this once in the "add" notifier.

> > Well, mtd->block_isbad() may return error, unlikely, bu still. You also
> > ignore the error at other places.
>=20
> Ignoring that is deliberate since it doesn't really matter if the block
> is bad or we can't read from it, the action is the same...

No, bad EB is a perfectly legal thing and you should deal with it. Error
code means that something very bad and sever is going on and you have to
just refuse working with this device.

> > Also, do not ignore error code of mtd->block_markbad()
>=20
> All we can do is print a warning, the action will be the same...

No, the action should be returning an error and refuse doing more work.

> > Also, could you please use wait_event_interruptible() instead of
> > set_current_state() which looks better (indeed, you have wait queue,=20
> > so use wq calls).
>=20
> That piece of code is in keeping with the rest of the mtd erase handling
> code. Looking through the various wq macros, I don't see any which help
> particularly in this case...

Well, it is matter of taste so I do not insist. But I think
wait_event_interruptible() is much nicer. Glance at drivers/ubi/io.c how
it looks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
