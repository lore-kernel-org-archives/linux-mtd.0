Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMUj7-0006F6-Qq
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 14:44:42 -0500
Subject: Re: [PATCH 0/5] Add LZO Compression
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1172689998.16062.135.camel@localhost.localdomain>
References: <1172689998.16062.135.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 28 Feb 2007 21:43:46 +0200
Message-Id: <1172691826.17031.37.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 19:13 +0000, Richard Purdie wrote:
> The following patch series adds LZO compression support to the kernel
> and exposes it in a variety of places (jffs2, crypto).
>=20
> This is particularly useful for jffs2 where significant boot time
> speedups (~10%) and file read speed improvements (~40%) are seen when
> its used with only a slight drop in file compression ratio.

Providing the digits are accurate, this is very good stuff.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
