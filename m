Received: from mta.songnetworks.no ([62.73.241.56] helo=mta.tdcsong.no)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUhcD-0005BO-9J
	for linux-mtd@lists.infradead.org; Sun, 17 Aug 2008 12:44:13 +0000
Received: from wpr01.wprmedical.local (unknown [80.239.107.60])
	by mta.tdcsong.no (Postfix) with ESMTP id 6D1BA401A
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Aug 2008 14:31:18 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: SV: SV: Jffs2 crach in 2.6.25.6.atmel.1
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Date: Sun, 17 Aug 2008 14:34:57 +0200
Message-ID: <6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
In-Reply-To: <1218877876.3184.185.camel@pmac.infradead.org>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
	<1218877876.3184.185.camel@pmac.infradead.org>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> That just shouldn't happen. It doesn't matter that u-boot has the
first
> blocks reserved -- those aren't counted in this, which is about the
> _logical_ partition. JFFS2 doesn't know that they exist at all.
>=20
> Can you put a hardware watchpoint on c->blocks[0] and see when it's
> getting scribbled on? Or failing that, set up a software check on
every
> interrupt, to BUG() if it's set to 0xffffffff.
>=20
> (Assuming you only have one JFFS2 fs, you can hack jffs2 to store 'c'
in
> a global variable, then put a hack into the core interrupt handler
code
> to do something like:
> 	if (jffs2_c && jffs2_c->blocks &&
> 	    jffs2_c->blocks[0] =3D=3D 0xffffffff)
> 		breakpoint();  // or BUG();
>=20
> --
> David Woodhouse                            Open Source Technology
Centre
> David.Woodhouse@intel.com                              Intel
Corporation
>=20
>=20
Hi

Thanks for replying so quickl.

I'm trying to figure out where to extract the c node from in the jffs2
code.=20
So I get the node tree each time the structure is being used.
Should I place some code to extract the information possibly in:
malloc.c ,scan.c or nodelist.c (under fs/jffs2)?

Or should I place the code for storing the c value in multiple places

I have multiple jffs2 partitions in my system,
but I can easy separate them by checking the number of erase blocks in
each one.=20


Regards
____________________________________________________
=20
Eirik Aanonsen
SW Developer
E-mail: eaa@wprmedical.com=20
Phone: +47 90 68 11 92
Fax: +47 37 03 56 77
____________________________________________________
