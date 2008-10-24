Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KtL4H-0005kj-Vd
	for linux-mtd@lists.infradead.org; Fri, 24 Oct 2008 11:43:02 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
From: Artem Bityutskiy <dedekind@infradead.org>
To: KeunO Park <lastnite@gmail.com>
In-Reply-To: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 24 Oct 2008 14:41:19 +0300
Message-Id: <1224848479.4466.130.camel@sauron>
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

On Fri, 2008-05-30 at 15:01 +0900, KeunO Park wrote:
> [write test]
>=20
> yaffs2
> write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
> load avg right after copy&sync: 0.03 -> 0.11
>=20
> ubifs (LZO)
> write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
> load avg right after copy&sync: 0.03 -> 0.53
>=20
> ubifs (ZLIB)
> write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
> load avg right after copy&sync: 0.03 -> 0.80
>=20
> ubifs (No Compression)
> write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
> load avg right after copy&sync: 0.03 -> 0.43
>=20
> ubiblk(vfat mount)
> read: 0.46s, 0.47s, 0.46s avg: 0.463s (21.5MB/s)
> write: 12.13s, 14.95s, 12.61s avg:13.23s (755KB/s)
> load avg right after copy&sync: 0.02 -> 0.31
>=20
> With above result, it seems that there is some overload in ubi.

Hi,

you complained about UBIFS load average. We have added a mount
option which disabled data CRC checking. You may try it to improve
the situation. Just added this piece of documentation:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
