Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJonT-0004qe-Hd
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:57:38 -0400
Message-ID: <4337B7C9.6030402@yandex.ru>
Date: Mon, 26 Sep 2005 12:56:41 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <4333D014.8000809@mw-itcon.de> <4333D37A.1020900@yandex.ru>
	<4333E759.8000804@mw-itcon.de>
	<20050925151550.GE28978@wohnheim.fh-wedel.de>
In-Reply-To: <20050925151550.GE28978@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: Minimum/optimal sector_size for jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> Hmm.  "sector_size" is a confusing name.  It reminds people of a disk
> sector, which is semantically similar to the writesize (or pagesize,
> if NAND people prefer).  But JFFS2 uses sector_size as erasesize.
>=20
I would not mind if one rename that field to erasesize.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
