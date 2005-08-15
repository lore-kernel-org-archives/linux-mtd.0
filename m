Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fWO-0005UW-M5
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 10:01:07 -0400
Message-ID: <43009FFC.3090200@yandex.ru>
Date: Mon, 15 Aug 2005 18:00:28 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
In-Reply-To: <20050815134813.GC3829@wohnheim.fh-wedel.de>
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
> My preferred approach would be to allocate a slab cache for jffs2
> erase blocks.  Then we either need a (much smaller) array of pointers
> to the slab objects or maintain them as linked lists.  But then again,
> it wouldn't be the first ugly hack in jffs2.  Go right ahead if you
> really want to!
>=20

Only not slab cache, what for? We allocate the erasblock structure once=20
on mount and deallocate them all once on unmount. No need to use a slab=20
cache. The merit of the slab cache is very fast allocations, and we will =

not make use of this property anyway. No need to use slab cache here at a=
ll.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
