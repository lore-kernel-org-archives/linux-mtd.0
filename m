Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I6Oo4-00014q-BI
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 06:43:31 -0400
Subject: Re: Signed Unsigned multiplication in io.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: brijesh.singh@calsoftinc.com
In-Reply-To: <41876.172.16.0.34.1183628255.squirrel@webmail.calsoftinc.com>
References: <41876.172.16.0.34.1183628255.squirrel@webmail.calsoftinc.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 05 Jul 2007 13:42:23 +0300
Message-Id: <1183632143.3531.42.camel@sauron>
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

On Thu, 2007-07-05 at 15:07 +0530, brijesh.singh@calsoftinc.com wrote:
> There is signed multiplication assigned to unsigned ei.addr in io.c.
> This causes wrong addresses for big multiplication.This patch solves the
> problem.
>=20
> Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>

Committed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
