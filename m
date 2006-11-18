Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlQ3J-0005pK-Sa
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 08:16:19 -0500
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: kbaidarov <kbaidarov@dev.rtsoft.ru>
In-Reply-To: <20061117184055.569da7ad@localhost.localdomain>
References: <20061117184055.569da7ad@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Sat, 18 Nov 2006 15:15:13 +0200
Message-Id: <1163855713.5597.70.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Konstantin,

On Fri, 2006-11-17 at 18:40 +0300, kbaidarov wrote:
> Description:
> The following patch adds readonly block device layer over mtd
> that allows to use any filesystem on this device in RO mode and
> thus gain faster mount times and better throughput rates.

This is very ambition claim. In comparison with what?

> How it works:
> Blocks translation routine was added to read sector function. Assuming
> that bad block won't appear during MTD reading and BBT is correct, bad
> block is skipped and requested block is lazily mapped to good one.
> Block driver based on the mtd readonly device driver mtdblock_ro.c and
> translation routine was taken from the patch of Pantelis Antoniou
> (which can be found at
> http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html).
>=20

So basically this is bad eraseblock-aware mtdblock_ro? But why you
created a new driver and with so weird name :-) ? Why didn't you just
changed mtdblock_ro? IOW, why you didn't adapt Pantelis' patch instead
and re-send it? (I have no idea why this patch isn't im MTD still,

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
