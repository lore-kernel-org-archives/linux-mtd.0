Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCBty-00044f-OW
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 02:55:59 -0400
Message-ID: <41590ABD.9060103@yandex.ru>
Date: Tue, 28 Sep 2004 10:54:53 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>,
	=?ISO-8859-2?Q?Kornel_?= =?ISO-8859-2?Q?Mas=B3owski?= <maslow@pf.pl>
References: <000701c4a4c3$822d6e90$0b0aa8c0@maslow>
	<415905E4.1020601@yandex.ru>
In-Reply-To: <415905E4.1020601@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: [OBORONA-SPAM]  Re: jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Artem B. Bityuckiy wrote:
> Kornel Mas=B3owski wrote:
>=20
>> I'm not sure how jffs2 works.
>> I have jffs2 on  8bit NAND flash (page 512 B).
>> I want to append record 32B to the file on flash which current size is=
=20
>> 10kB.
>> Flash device is almost empty.
>> How many pages will be written by jffs2?
>=20
> If your 10K file was created by one go and there is no compression, the=
=20
> file will consist of 3 JFFS2 nodes (4K + 4K + 2K) and fit into 9 + 9 + =
5=20
> =3D 23 NAND pageg
>(4K data =3D 4 NAND pages and one is needed for node
Ops, 4K data =3D 8 NAND pages.
> header; the rest of page won't be used since the next node isn't fit to=
=20
> it).
>=20


--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
