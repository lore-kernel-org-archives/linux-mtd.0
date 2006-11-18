Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlQR6-0006Yx-6B
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 08:40:56 -0500
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1163856955.5597.71.camel@sauron>
References: <20061117184055.569da7ad@localhost.localdomain>
	<1163855713.5597.70.camel@sauron>
	<1163856784.20835.2.camel@zod.rchland.ibm.com>
	<1163856955.5597.71.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Sat, 18 Nov 2006 15:40:28 +0200
Message-Id: <1163857228.5597.74.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-18 at 15:35 +0200, Artem Bityutskiy wrote:
> On Sat, 2006-11-18 at 07:33 -0600, Josh Boyer wrote:
> > Because we've consistently told people not to do that.
>=20
> OK, but why ?
>=20

I didn't review this, but I don't see anything bad to do like this

http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html

for mtdblock_ro.

What are the objections?


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
