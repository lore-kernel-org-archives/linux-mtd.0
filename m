Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvwPE-0003yG-3c
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 08:13:38 -0400
Message-ID: <42E0E2C8.7090304@yandex.ru>
Date: Fri, 22 Jul 2005 16:12:56 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao_fusheng@hotmail.com
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
In-Reply-To: <20050722115939.GA941@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
>=20
> Sevenfold indentation is not what I call good coding style.  Try to
> make this stuff simpler.  Use "if (!...) continue" and similar
> constructs.
>=20
Agree, although it is how JFFS2 is written. Let's not worsen it, but=20
instead, make it tidier. Please, if you don't mind, reformat the whole=20
function, you may split it on shorter sub-functions, etc.

BTW, IMO the Summary patch of Ferenc Havasi is not yet in CVS (even=20
though it greatly helps with mount time) because he didn't bothered=20
making it cute. He just took messy JFFS2 code, and made it even messier. =

I'd be glad to see Ferenc's patch nice and in CVS.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
