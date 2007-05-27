Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsIHA-0000gN-Nj
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 08:55:34 -0400
Subject: Re: [PATCH] mtd/ubi: silence gcc warning
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jeff Garzik <jeff@garzik.org>
In-Reply-To: <20070527113254.GA11940@havoc.gtf.org>
References: <20070527113254.GA11940@havoc.gtf.org>
Content-Type: text/plain; charset=utf-8
Date: Sun, 27 May 2007 15:54:57 +0300
Message-Id: <1180270497.3642.107.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
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

On Sun, 2007-05-27 at 07:32 -0400, Jeff Garzik wrote:
> Silence the gcc warning
>=20
> drivers/mtd/ubi/eba.c: In function =E2=80=98ubi_eba_read_leb=E2=80=99:
> drivers/mtd/ubi/eba.c:371: warning: =E2=80=98crc=E2=80=99 may be used uni=
nitialized in this function
>=20
> This is an example of the uninit'd-var warnings emitted by gcc that
> can be proven to be bogus.
>=20
> Normally I would commit this to my git repository containing
> such verified cases, but with all the goto-driven control flow in
> ubi_eba_read_leb(), I feel that initializing the 'crc' variable is
> an easy way to both shut up gcc, and also make the code less fragile
> for the long term.

Committed to the UBI git tree, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
