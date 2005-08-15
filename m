Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fMm-00050X-GZ
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:51:11 -0400
Message-ID: <43009DA7.3060502@yandex.ru>
Date: Mon, 15 Aug 2005 17:50:31 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<43009852.1000203@inf.u-szeged.hu> <43009B37.7010702@yandex.ru>
	<20050815134502.GB3829@wohnheim.fh-wedel.de>
In-Reply-To: <20050815134502.GB3829@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
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
> Dito.  But I don't care much for the userspace tools.  So the reviews
> should be done by someone that cares.  Artem? ;)
>=20
Oh no, I did not ever even glimpse to mkfs.jffs2 code. I also only care=20
about the kernel-side stuff... :-) But the presence of 2 separate tool=20
bothers me. Imagine if ext3 have different tools to make the FS=20
(mkfs.ext3), then to add the journal (a "journaltool"). What for ? I do=20
not insist much though, if the others don't care.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
