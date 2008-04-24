Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joy9W-0007kU-Te
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 09:54:07 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080424074526.GA21709@cloud.net.au>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
	<20080424074526.GA21709@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Thu, 24 Apr 2008 12:53:59 +0300
Message-Id: <1209030839.11721.115.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-24 at 17:45 +1000, Hamish Moffatt wrote:
> The rest of the discussion was about improved use of sub-page writes.
> I'm sure that would be useful but it's not strictly relevant to the
> partial read patch.
Yup.

> Artem, were you able to try the patch on the OLPC with hardware ECC, as
> you hinted in the original discussion?

Right, I completely forgot to do this. I've just verified - OLPC works
just fine with this patch. It also does not affect our OneNAND setup.

> Also I reverted your recent patch to combine the EC + VID header reads
> in the UBI scan for this test. I think with partial reads it may make=20
> things slower, because it will force 2K to be read (or 576 bytes if the=20
> ALIGN() is removed, still more than 64 + 64). Because min_io_size =3D 2K
> is not really accurate I guess.

I deliberately did that. I though making one call instead of 2 is
better, because MTD anyway reads whole page. And my other motivation was
that flashes like OneNAND which may read 2 consecutive pages faster
(kind of "burst" read). Although for OneNAND this trick does not really
work. Anyway, lets forget about that patch.

I think if Alexey is not any more interested in working on his patch,
you could do this, if you are interested. I am going to be away till the
5 of May, so I won't be able to help.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
