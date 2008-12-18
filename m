Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDJz7-0000oQ-U9
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 14:36:18 +0000
Subject: Re: [PATCH 0/2] mtd-utils export libraries
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sidney Amani <amani_s@epitech.net>
In-Reply-To: <52e42efe0812180615u19344697la740e4ca1a060aff@mail.gmail.com>
References: <52e42efe0812180615u19344697la740e4ca1a060aff@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2008 16:37:18 +0200
Message-Id: <1229611038.30575.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-12-18 at 15:15 +0100, Sidney Amani wrote:
> We are currently working on an UBI based userspace filesystem.
>=20
> We wanted to use libubi. So here is our patch to export shared
> libraries and headers. This is done for each library in LIBS.

Hi, thanks for the patches. However, Mike (CCed) sent a major build
system rework patch recently, but there was an issue and I am waiting
for a new patch from him. Mike, could you please let me know if I
should wait for a new version of your patch or try to apply these
ones?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
