Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrbFU-0003YN-UF
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 10:30:59 -0500
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071112122852.GA6330@lazybastard.org>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
	<20071112122852.GA6330@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Nov 2007 16:30:50 +0100
Message-Id: <1194881450.4029.44.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	Damir Shayhutdinov <lost404@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-12 at 13:28 +0100, J=C3=B6rn Engel wrote:
> On Mon, 12 November 2007 13:39:02 +0300, Damir Shayhutdinov wrote:
> >=20
> > I'm studying JFFS2 code now, and I believe I've found a kernel memory l=
eak.
> >=20
> > fs/jffs2/erase.c:
> >=20
> > 76         ret =3D c->mtd->erase(c->mtd, instr);
> > 77         if (!ret)
> > 78                 return;
> >=20
> > In case of ret =3D=3D 0 (erase succeeded), line 78 leaves the function
> > jffs2_erase_block without kfree-ing previously kmalloc-ed pointer
> > instr (line 50).
> >=20
> > So, sizeof(struct erase_info) + sizeof(struct erase_priv_struct) bytes
> > are leaking each time block is erased successfully.
>=20
> Makes 64 Bytes, including kmalloc overhead.  On every successful erase.
> David, please apply.
>=20
> J=C3=B6rn

eeh, what about jffs2_erase_callback() as posted previously?
