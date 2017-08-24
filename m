Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dko1A-0000l1-7I
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 09:01:42 +0000
Date: Thu, 24 Aug 2017 11:01:04 +0200
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd-utils: tests: avoid using only one block in
 nandpagetest
Message-ID: <20170824110104.5740cfb1@xps13>
In-Reply-To: <e5fc2f53-738f-037b-6bd6-c1aa18d363f7@sigma-star.at>
References: <20170823135732.12899-1-miquel.raynal@free-electrons.com>
 <e5fc2f53-738f-037b-6bd6-c1aa18d363f7@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

> > The case 'first =3D=3D last' leads to erasing the block before reading
> > it. Hence the test will fail with no actual reason.
> >  =20
> So if some existing automated test setup were to use this, it would
> (as of right now) *always* fail and terminate with EXIT_FAILURE.
>=20
> > The patch does not forbid the use of -c1 as it could do it in
> > process_options() with a errmsg_die(). Instead, it warns the user
> > and uses a second block in order to avoid risking to break existing
> > scripts.=20
> But wouldn't exactly that change the behavior of such a setup by
> suddenly having all tests succeed?
>=20
> If this combination of options always fails anyway, wouldn't it be
> more appropriate to terminate with an error message in
> process_options instead?

I though you would prefer to do not exit with an error but I it is ok
for me, I will resend the patch, with an error thrown in
process_options().

Regards,
Miqu=C3=A8l
