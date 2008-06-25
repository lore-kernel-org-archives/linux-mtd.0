Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KBVHP-0006Ti-Ld
	for linux-mtd@lists.infradead.org; Wed, 25 Jun 2008 13:43:24 +0000
Subject: Re: [PATCH] [MTD-UTILS] ubiformat: reverse question about vid
	offset change
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bernard Blackham <bernard@largestprime.net>
In-Reply-To: <20080625131723.GA24006@mersenne.largestprime.net>
References: <20080625131723.GA24006@mersenne.largestprime.net>
Content-Type: text/plain; charset=utf-8
Date: Wed, 25 Jun 2008 16:42:32 +0300
Message-Id: <1214401352.6573.24.camel@sauron>
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

On Wed, 2008-06-25 at 21:17 +0800, Bernard Blackham wrote:
> Users can pass the -O option to ubiformat to override the VID header
> offset on the command-line. If for some reason, the new offset does
> not match what is on flash, ubiformat currently prompts the user if
> they'd rather use the *old* offsets.  This means that calling
> ubiformat with --yes will not do what was requested on the
> command-line.
>=20
> This patch reverses the question so --yes is actually useful for
> running in batch-mode.

Pushed, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
