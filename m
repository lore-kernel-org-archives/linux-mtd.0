Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVqtx-0004nx-9U
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 11:46:48 -0400
Subject: Re: UBI : Atomic change LEB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20070913143819.GE22250@mail.shareable.org>
References: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
	<1189682032.14370.117.camel@sauron>
	<6b5362aa0709130602g61e9b6f0xa762be770e95a32b@mail.gmail.com>
	<20070913143819.GE22250@mail.shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Sep 2007 18:46:30 +0300
Message-Id: <1189698391.14370.130.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-13 at 15:38 +0100, Jamie Lokier wrote:
> Could you use a read-write lock, instead of a mutex?
>=20
> Lock for "read" (meaning shared) when writing to the MTD device.  Lock
> for "write" (meaning exclusive) when erasing.  Then all erases are
> serialised, and writes can go in parallel.
>=20
> Would that solve the locking problems?
>=20
> If a device can support multiple erases in parallel as well, then
> you'd want something more complicated.

Usual LEB read/write/erase _already_ have per-LEB RW locking which is
actually even too much. We are talking only about LEB atomic change
operation, which is special.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
