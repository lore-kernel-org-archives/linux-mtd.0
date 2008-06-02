Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K333W-0001c2-C6
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 05:58:07 +0000
Subject: Re: big flash disks?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080601184239.GA11135@shareable.org>
References: <20080601184239.GA11135@shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Mon, 02 Jun 2008 08:59:19 +0300
Message-Id: <1212386359.31023.154.camel@sauron>
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


On Sun, 2008-06-01 at 19:42 +0100, Jamie Lokier wrote:
> Some people developing newer flash filesystems (UBIFS, Logfs,
> FAT-over-UBI :-) and interested in flash filesystem performance might
> be interested in this slashdot comment:
>=20
>     http://slashdot.org/comments.pl?sid=3D569439&cid=3D23618215
>=20
> They're implying that UBIFS and Logfs aren't suitable for high
> performance writes and/or large flash, and don't work well with up and
> coming flash disks either.
>=20
> Also that patents may get in the way.
>=20
> I've never heard of MFT before.

People should understand that UBIFS is designed for embedded systems. It
is good for low-price devices where you have just bare flash which is
cheap. SSD is a completely different area and irrelevant to UBIFS. The
same applies for LogFS and YAFFS IMO. Talking about using these FS-es on
SSD is just silly (again IMHO).

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
