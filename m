Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAqnd-0000Jw-GK
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 09:44:06 -0500
Message-ID: <4235A298.50908@yandex.ru>
Date: Mon, 14 Mar 2005 17:41:28 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@mindspring.com>
References: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
	<20050314141509.GA17590@wohnheim.fh-wedel.de>
In-Reply-To: <20050314141509.GA17590@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to access jffs2 partition properties?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Not all mtd are flash based.  Mtd code should have zero knowledge
> about chip, start address, etc.  If you need that information, you
> have to tweak the mapping driver to give it out.
>=20
> J=F6rn

May be /proc/mtd is what you are looking for ?

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
