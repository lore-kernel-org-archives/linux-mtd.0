Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtKL2-0003pn-IA
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 10:24:00 +0000
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080506094642.GB23685@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron> <20080505084617.GA11042@cloud.net.au>
	<1210055916.3645.21.camel@sauron> <20080506094642.GB23685@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Tue, 06 May 2008 13:23:12 +0300
Message-Id: <1210069392.3645.34.camel@sauron>
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

On Tue, 2008-05-06 at 19:46 +1000, Hamish Moffatt wrote:
> Yes it was against the v0.4 tag.=20
>=20
> mkfs.jffs2 and genext2fs both use -P as the short version of
> --squash-perms, so mkfs.ubifs will have to use something different. No
> big deal however (although they are pretty similar otherwise).

Hmm, ok, then I will make it -p back. I just wanted to reserve -p for
other purposes, but this is not important anymore. I'v pushed
corresponding patch.

> Also, what is the purpose of --max-leb-cnt? It seems to be just a safety
> check that the volume will fit? It's a bit unusual.

It is a form of specifying FS size. But instead of specifying exact FS
size, you specify maximum FS size. This means that it will be possible
to put the image on smaller volumes as well, which is quite handy
because due to random amount of initial NAND bad blocks different
instances of the same device may have a bit different volume sizes.
E.g., rootfs partition may be 500MiB or 501MiB on a 512MiB NAND,
depending on how many initial bad block NAND contains.

Fundamentally, mkfs.ubifs has to know FS size because UBIFS maintains
and stores per-LEB information (like amount of dirty and free space in
each LEB) in so-called LPT area on the media. So obviously, the size of
this area depends on the total amount of LEBs, i.e. on the volume size.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
