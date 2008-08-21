Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW4Tu-0004kV-Ll
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 07:21:18 +0000
Subject: Re: [PATCH] mkfs.ubifs: set CFLAGS/LDLIBS properly
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1219255029-22308-1-git-send-email-vapier@gentoo.org>
References: <1219255029-22308-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 21 Aug 2008 10:18:58 +0300
Message-Id: <1219303138.18027.52.camel@sauron>
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

Hi,

On Wed, 2008-08-20 at 13:57 -0400, Mike Frysinger wrote:
> CFLAGS should only be set as a default instead of overriding the user's
> choices.  LDLIBS is for adding libraries, not LDFLAGS.
>=20
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  mkfs.ubifs/Makefile |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Thanks, applied.

> -CFLAGS :=3D $(CFLAGS) -Wall -O0 -ggdb
> -LDFLAGS :=3D $(LDFLAGS) -lz -llzo2 -lm -luuid
> +CFLAGS ?=3D -O0 -ggdb

This is forgotten debugging hack leftover, I've removed it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
