Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7QQk-0002rW-7F
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 08:16:26 +0000
Subject: Re: [PATCH/mtd-utils] Separate '-m' and the mode with a space when
	invoking 'install'
From: Artem Bityutskiy <dedekind@infradead.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 10:13:37 +0200
Message-Id: <1228205617.5029.6.camel@sauron>
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

On Wed, 2008-11-26 at 14:27 +0100, Enrico Scholz wrote:
> Some 'install' versions (e.g. this of OpenEmbedded) require the mode
> to be a separate argument and don't understand the '-m0755' syntax:
>=20
>   .../staging/x86_64-linux/usr/bin/install-sh: ./-m0755 does not exist.
>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  Makefile                     |    2 +-
>  mkfs.ubifs/Makefile          |    2 +-
>  ubi-utils/Makefile           |    2 +-
>  ubi-utils/new-utils/Makefile |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

I've pushed this patch to mtd-utils.git.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
