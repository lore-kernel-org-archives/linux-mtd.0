Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jov2q-0007qM-QE
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 06:35:01 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2008 09:34:36 +0300
Message-Id: <1209018876.11721.100.camel@sauron>
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

On Thu, 2007-12-13 at 18:15 +0000, Alexey Korolev wrote:
> Hi=20
>=20
> Here is a patch providing partial page read functionality for NAND
> devices.=20
>=20
> In many cases it gives performacne boost. I've added this feature
> enabling under chip->options flag.=20
> Setting NAND_PART_READ option in board driver will enable this feature.

Hamish, this stuff should certainly help you. You could give it a try.
Unfortunately Alexey gave up almost straight away and did not try to
push his work harder.The arguments against the patch were weak, and
addressable. This work needs some more efforts and it may get merged.
Moreover, Alexey came with impressive numbers, and it is difficult to
argue against. Would you give it a try? If it gives performance benefits
for you, I think we could raise this again.

Look here for the full story:=20
http://lists.infradead.org/pipermail/linux-mtd/2007-December/020105.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
