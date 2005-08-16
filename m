Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4yC8-00051Z-G6
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 05:57:21 -0400
Message-ID: <4301B85F.9010305@yandex.ru>
Date: Tue, 16 Aug 2005 13:56:47 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>
	<20050815140530.GE3829@wohnheim.fh-wedel.de>
	<1124115547.6148.17.camel@sauron.oktetlabs.ru>
	<20050815143241.GA7045@wohnheim.fh-wedel.de>
	<4300B335.6050006@yandex.ru>
	<1124176573.6148.27.camel@sauron.oktetlabs.ru>
	<430194F4.60802@yandex.ru>
	<20050816094746.GB14405@wohnheim.fh-wedel.de>
In-Reply-To: <20050816094746.GB14405@wohnheim.fh-wedel.de>
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
> Your approach, imo, is fundamentally borked because it requires
> high-order allocations.  Your array of physical pages has to be a
> contiguous virtual memory area, which won't always work.  And if you
> want to maintain a list of pages instead, you end up with the same
> design as with an array of slab objects, just one level higher and
> with another indirection.  Whatever the performance is, the code will
> be ugly.

I meant something like:

objs_per_page =3D PAGE_SIZE / sizeof(struct jffs2_eraseblock);
pages_num =3D c->blocks_nr / objs_per_page;

for (i =3D 0; i < pages_num; i++) {
     page =3D alloc_pages(flags, 0);
     c->blocks[i] =3D page_address(page);
}

So c->blocks[] is an array of pages. Nonetheless, I have never done=20
things like this before, may be there is some cleverer method exists...

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
