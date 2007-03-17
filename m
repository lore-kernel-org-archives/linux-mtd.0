Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HSWT6-0006j7-SI
	for linux-mtd@lists.infradead.org; Sat, 17 Mar 2007 06:49:03 -0400
Subject: Re: [PATCH] JFFS2: fix deadlock on error path
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173788365.5493.31.camel@sauron>
References: <1173788365.5493.31.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Sat, 17 Mar 2007 12:48:50 +0200
Message-Id: <1174128530.11927.13.camel@sauron>
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

On Tue, 2007-03-13 at 14:19 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] JFFS2: fix deadlock on error path
>=20
> When the MTD driver returns write failure, the following deadlock
> occures:
>=20
> We are in __jffs2_flush_wbuf(), we hold &c->wbuf_sem. Write failure.
> jffs2_wbuf_recover()->jffs2_reserve_space_gc()->jffs2_do_reserve_space()
> ->jffs2_erase_pending_blocks()->jffs2_flash_read()
>=20
> and it tries to lock &c->wbuf_sem again. Deadlock.
>=20
> Reported-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

David,

please, send this patch to Linus as it is critical enough.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
