Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LGYEI-0001Bg-8D
	for linux-mtd@lists.infradead.org; Sat, 27 Dec 2008 12:25:18 +0000
Subject: Re: [PATCH] mkfs.jffs2: fix dir creation in /
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1230348908-22199-1-git-send-email-vapier@gentoo.org>
References: <1230295082.11802.2.camel@sauron>
	<1230348908-22199-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Sat, 27 Dec 2008 14:25:54 +0200
Message-Id: <1230380754.19016.3.camel@sauron>
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

On Fri, 2008-12-26 at 22:35 -0500, Mike Frysinger wrote:
> With older mtd-utils, creating a directory in the root worked fine.  With
> current git, the parent dir search algo breaks this.
>=20
> For example, just take the current git tree, build it up, and then run:
> $ ./mkfs.jffs2 -d . -D device_table.txt -o /dev/null
> mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
> mkfs.jffs2: skipping device_table entry '/dev/mem': no parent directory!
> ...
> Doing `mkdir ./dev` first works around the issue, but where's the fun in
> that.
>=20
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
