Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfHvi-0000TT-0m
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 09:46:15 -0400
Message-ID: <42A45382.5080301@yandex.ru>
Date: Mon, 06 Jun 2005 17:45:38 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
	<20050606131534.GC31739@wohnheim.fh-wedel.de>
In-Reply-To: <20050606131534.GC31739@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 superblock search
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> You already know that I'm skeptical about the B+ tree.  But I'm even
> more skeptical about a 4-level tree.  That could turn into a
> bottleneck rather quickly.
>=20
Joern,

providing the key is 16 bytes and the pointer is 8 bytes, the 4-level=20
B-tree is enough for (4096/24)^4 =3D 170^4 ~1E8. If this isn't enough we =

may use more levels as well.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
