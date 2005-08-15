Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fXR-0005c2-Vs
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 10:02:28 -0400
Message-ID: <4300A03C.5000204@yandex.ru>
Date: Mon, 15 Aug 2005 18:01:32 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<43008BFB.502@yandex.ru> <4300970E.2090803@inf.u-szeged.hu>
	<43009AE1.6010907@yandex.ru>
	<20050815135158.GD3829@wohnheim.fh-wedel.de>
In-Reply-To: <20050815135158.GD3829@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: zhao_fusheng@hotmail.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> JFFS2 doesn't have a superblock.  Where should the versions be stored?
I thought to have them in cleanmarkers.

> I'd create a new node with INCOMPATIBLE flag set.  That's the JFFS2
> translation of what you just stated.  Converging this node with
> something else like the former erase marker would make sense, yes.
Agree, this is better.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
