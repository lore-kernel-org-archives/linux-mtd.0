Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jsv7a-0000vK-Ap
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 07:28:26 +0000
Subject: Re: [RFC][PATCH] making ubifs compile with gcc-3.4
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080502052211.GB6654@cloud.net.au>
References: <20080502052211.GB6654@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 May 2008 10:28:14 +0300
Message-Id: <1209972494.3645.4.camel@sauron>
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


On Fri, 2008-05-02 at 15:22 +1000, Hamish Moffatt wrote:
> ubifs fails to compile with my gcc 3.4.4 (for arm), bombing with:
>=20
> fs/built-in.o: In function `ubifs_create_dflt_lpt':
> lpt_commit.c:(.text+0x88690): undefined reference to `__you_cannot_kmallo=
c_that_much'
> make[1]: *** [.tmp_vmlinux1] Error 1
>=20
> It compiles with 4.1.2 ok though. Some web searches suggest that this is
> due to a compiler bug. Patches have been applied in other parts of the=20
> tree to work around this so perhaps you'll consider this patch for ubifs=20
> also.
>=20
> I found that rearranging the kmalloc order makes it compile. I don't
> believe there is any effect on the behaviour.
>=20
> Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>

Applied, thank you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
