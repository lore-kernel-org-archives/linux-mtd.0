Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkcXp-0008IZ-5P
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 10:01:13 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <1207994233.5965.124.camel@sauron>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Sat, 12 Apr 2008 12:59:29 +0300
Message-Id: <1207994369.5965.126.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-04-12 at 12:57 +0300, Artem Bityutskiy wrote:
> >     If the answer is no, will ubifs give patches for porting it to old
> > linux kernel? The patches only contain the ubifs needed file.
> We maintain 2.6.21, 2.6.22, 2.6.23, and 2.6.24 ports. They contain UBIFS
> patches and all the other patches which are needed to make UBIFS work.
> For example, 2.6.21 port has tons of UBI patches back-ported from the
> ubi-2.6.git tree, it has LZO compressor ported from older versions of
> the kernel as well.

Corrections:
1. Well, 2.6.21 did not have UBI at all, so ubifs-v2.6.21.git contains
all UBI patches, not just UBIFS.
2. LZO was ported from newer kernels of course, not from older.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
