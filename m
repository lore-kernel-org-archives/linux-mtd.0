Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXYsp-0003Zm-Ed
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 10:01:11 +0000
Subject: Re: [PATCH] mtd-utils: use 'stat(2)' instead of 'lstat(2)'
From: Artem Bityutskiy <dedekind@infradead.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1219656108-1365-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1219656108-1365-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 25 Aug 2008 12:57:32 +0300
Message-Id: <1219658252.18027.106.camel@sauron>
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

Hi,

On Mon, 2008-08-25 at 11:21 +0200, Enrico Scholz wrote:
> The UBI tools refuse to work with symlinks like
> '/dev/ubi/bootloader -> ../ubi0_2' because they use 'lstat(2)' and get
> information about the symlink but not about the device.  This is
> unwanted and fixed by this patch.
>=20
> This patch renames 'struct stat stat' variables to 'st' to avoid
> compilation errors.

Applied and pushed, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
