Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3nzV-00007P-0g
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 08:05:05 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
From: Artem Bityutskiy <dedekind@infradead.org>
To: KeunO Park <lastnite@gmail.com>
In-Reply-To: <5ed5c4730806032106r77a912f4jbf72f06c59e3f72f@mail.gmail.com>
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron> <1212149102.31023.138.camel@sauron>
	<5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
	<1212155390.31023.140.camel@sauron>
	<5ed5c4730805300808v79f7fd7dpe3550cd8fc1b0db5@mail.gmail.com>
	<1212387034.31023.166.camel@sauron>
	<5ed5c4730806032106r77a912f4jbf72f06c59e3f72f@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 04 Jun 2008 11:05:46 +0300
Message-Id: <1212566746.14566.20.camel@sauron>
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

On Wed, 2008-06-04 at 13:06 +0900, KeunO Park wrote:
> Hi, I tested again with '-o sync'. :-)

Note, these load average numbers do not mean much, and you cannot do
conclusions whether the FS will prevent your camera application from
being executed.

>=20
> UBIFS LZO (mounted with '-o sync,noatime' option)
> 16.93sec 590KB/s
> load avg : 0.00 -> 0.36
>=20
> UBIFS No Compressor (mounted with '-o sync,noatime' option)
> 13.38sec 747KB/s
> load avg : 0.00 -> 0.29
>=20
> YAFFS2 (mounted with '-o sync,noatime' option)
> 12.25sec 816KB/s
> load avg : 0.00 -> 0.15

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
