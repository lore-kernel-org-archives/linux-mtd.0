Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPcHz-00027X-Rb
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 15:15:57 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 26 May 2011 17:15:43 +0200
Subject: RE: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1306396908.2785.152.camel@localhost>
In-Reply-To: <1306396908.2785.152.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy Wrote:

> 1. We need to send this to the -stable tree, so this needs a
>=20
> Cc: stable@kernel.org
>=20
> You say this is broken since 2.6.31, are you 100% sure? Can=20
> you point the specific commit which broke this? Or you just=20
> guess that this is 2.6.31?
>
> This is important because we'd need to add
>=20
> Cc: stable@kernel.org [2.6.31+] in that case.
>=20
> But AFAICS, the breakage happened after commit
>=20
> commit 7dcdcbef5d2b60d1db68fd2c07351f7afd8ad376
> Author: David Woodhouse <dwmw2@infradead.org>
> Date:   Sat Oct 21 17:09:53 2006 +0100
>=20
>     [MTD] NAND: Combined oob buffer so it's contiguous with data
>=20
> which was released in 2.6.20.
>=20

The reason I mentioned 2.6.31 was because it was the earliest kernel I
had been using when I witnessed this issue. Having looked at the commit
you mentioned, I have to agree that's where the problem first appeared.
Do you want me to add the CC with [2.6.20+] (assume that should be part
of the patch text in the mail)?

>=20
>=20
> 2. I think the right place fir this memset is=20
> 'nand_fill_oob()'. But in this case the first memset from=20
> 'nand_do_write_oob()' has to be removed.
>=20

Yes, that makes sense. Did consider that afterwards. Will update
Accordingly.

>=20
>=20
> 3. And finally, I think we should clean-up the following piece of code
>    in 'nand_do_write_oob()':
>=20
>         memset(chip->oob_poi, 0xff, mtd->oobsize);
>         nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
>         status =3D chip->ecc.write_oob(mtd, chip, page &=20
> chip->pagemask);
>         memset(chip->oob_poi, 0xff, mtd->oobsize);
>=20
> This should not be part of your fix and should not go to=20
> stable. But I think this should be a condition for your fix=20
> to be accepted.
> Unfortunately, so few people love mtd and it is full of crap=20
> which should be cleaned-up, and the only thing to do this is=20
> to force people who want just a bug-fix to also do a bit of=20
> cleaning up. Sorry, nothing personal.
>

No that's fine. Shouldn't be too much to do. Do you want both
the stable patch and the proper fix submitted around the same
time, or are you happy to get the initial fix in first, and follow up
with the more complete tidying of that code? Also am guessing
the complete patch should be based on the latest and greatest
Kernel (2.6.39)?

>=20
> Would you please be kind enough and look into this (if what I=20
> say makes technical sense, of course)? I think the second=20
> memset should not exist at all. And instead, all read side=20
> code has to memset the buffer for itself.
>=20
> Most probably the memset can just be removed, but I'm not=20
> 100% sure and this needs a more careful look.

Having looked briefly at the read side code in nand_base.c,
it does look like it should be enough to remove the second
memset and leave the read side code as is, but will examine
it more thoroughly before I post a patch.

Thanks

Adam=
