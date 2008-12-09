Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA2jG-0002b6-1e
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 13:34:22 +0000
Subject: Re: [PATCH] ubiformat.c: fix printf(%d, size_t) warning
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1228829283-27226-1-git-send-email-vapier@gentoo.org>
References: <1228829283-27226-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Dec 2008 15:31:29 +0200
Message-Id: <1228829489.13686.193.camel@sauron>
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

On Tue, 2008-12-09 at 08:28 -0500, Mike Frysinger wrote:
> A size_t should be printed using %zu (unsigned size_t) rather than %d.  T=
his
> fixes the following warning on my system:
> gcc -O2 -Werror -Wall -Iinclude -Isrc -I../../include src/ubiformat.c -c =
-o ubiformat.o
> cc1: warnings being treated as errors
> src/ubiformat.c: In function =E2=80=98read_all=E2=80=99:
> src/ubiformat.c:345: error: format =E2=80=98%d=E2=80=99 expects type =E2=
=80=98int=E2=80=99, but argument 3 has type =E2=80=98size_t=E2=80=99
> src/ubiformat.c:352: error: format =E2=80=98%d=E2=80=99 expects type =E2=
=80=98int=E2=80=99, but argument 3 has type =E2=80=98size_t=E2=80=99
> make: *** [ubiformat.o] Error 1

Pushed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
