Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LGC19-0003uE-4R
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 12:42:15 +0000
Subject: Re: [PATCH] nandwrite - handle situation when read returns less
	bytes the expected
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hai Zaar <haizaar@haizaar.com>
In-Reply-To: <76d9e2a30812240648y38e0b62crffddf0930b49d125@mail.gmail.com>
References: <76d9e2a30812140559y6ade25c0jf55fd8a7b299e83a@mail.gmail.com>
	<1229408910.4911.72.camel@sauron>
	<76d9e2a30812160040u263e275aqa04c0e4b726365cc@mail.gmail.com>
	<1229422714.17960.2.camel@sauron>
	<76d9e2a30812240648y38e0b62crffddf0930b49d125@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Dec 2008 14:43:05 +0200
Message-Id: <1230295385.11802.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Gilad Ben-Yossef <gilad@codefidence.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-24 at 16:48 +0200, Hai Zaar wrote:
> > Would be nice if you tried my patch and confirmed it works, because I
> > did not test it.
> I've tried the patch with the latest git version of mtd-utils and I
> confirm that it works on ARM at91sam9260 board.
> Thanks!

Pushed, thank you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
