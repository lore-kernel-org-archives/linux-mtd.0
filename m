Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCBa0-0003sx-Lg
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 02:35:30 -0400
Message-ID: <415905E4.1020601@yandex.ru>
Date: Tue, 28 Sep 2004 10:34:12 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?Kornel_Mas=B3owski?= <maslow@pf.pl>
References: <000701c4a4c3$822d6e90$0b0aa8c0@maslow>
In-Reply-To: <000701c4a4c3$822d6e90$0b0aa8c0@maslow>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kornel Mas=B3owski wrote:
> I'm not sure how jffs2 works.
> I have jffs2 on  8bit NAND flash (page 512 B).
> I want to append record 32B to the file on flash which current size is =

> 10kB.
> Flash device is almost empty.
> How many pages will be written by jffs2?
>=20
>=20
It is hard to calculate because of compression. Moreover, if your file=20
was created by
seek to "nowhere" it will cosist of only one "hole" node and fit into=20
one NAND page only.

If there is no compression, the exact number of pages also depends on=20
how your file was created. Also, there is some platform dependency -=20
does you platform has 4K RAM pages? - but this is minor since most=20
platforms have 4K RAM pages.

If your 10K file was created by one go and there is no compression, the=20
file will consist of 3 JFFS2 nodes (4K + 4K + 2K) and fit into 9 + 9 + 5 =

=3D 23 NAND pages (4K data =3D 4 NAND pages and one is needed for node=20
header; the rest of page won't be used since the next node isn't fit to i=
t).

When you append 32 bytes, one more page will be used (24 total). But if=20
your append just after 10K file creation (i.e, the JFFS2 write buffer=20
hasn't yet been written to the NAND flash media), the 32B appendix node=20
will be added to the 23-th page and there will be only 23 used pages.

If the compression is on, there ought to be fewer used NAND pages.

Ok, this is theory (I didn't check) and my own understanding of how=20
JFFS2 works. I might make mistakes :-)

You may check this by creating/appending your file and then calculating=20
the numbur of used pages. The nanddump utility may be used.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
