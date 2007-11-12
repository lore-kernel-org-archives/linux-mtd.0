Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrbGV-0003Yt-Jq
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 10:32:01 -0500
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071112123539.GB6330@lazybastard.org>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
	<1194870649.4029.37.camel@gentoo-jocke.transmode.se>
	<20071112123539.GB6330@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Nov 2007 16:31:54 +0100
Message-Id: <1194881514.4029.45.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Damir Shayhutdinov <lost404@gmail.com>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-12 at 13:35 +0100, J=C3=B6rn Engel wrote:
> On Mon, 12 November 2007 13:30:49 +0100, Joakim Tjernlund wrote:
> >=20
> > Nope, instr is freed in jffs2_erase_callback() in this case.
>=20
> Ick!  So this will double-free if an erase method calls the callback
> _and_ returns an error.  Given the well-documented interfaces we have, I
> wouldn't be surprised to find such a driver.
>=20
> Oh well, just ignore my patch then.
>=20
> J=C3=B6rn

Ouch, I should read all my mail before posting replies :)

 Jocke
