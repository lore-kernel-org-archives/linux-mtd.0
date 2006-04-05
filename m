Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FR1pH-00009R-9L
	for linux-mtd@lists.infradead.org; Wed, 05 Apr 2006 02:49:20 -0400
Date: Tue, 4 Apr 2006 23:47:58 -0700
From: Andrew Morton <akpm@osdl.org>
To: =?ISO-8859-1?B?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
Message-Id: <20060404234758.66a70968.akpm@osdl.org>
In-Reply-To: <20060404092628.GA12277@wohnheim.fh-wedel.de>
References: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: spse@secret.org.uk, ebiederman@lnxi.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, hpa@zytor.com, tglx@linutronix.de,
	dwmw2@infradead.org
Subject: Re: [Patch 0/3] Remove blkmtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> This patchset removed blkmtd in three steps:
> 1. Mark it as deprecated,
> 2. mark block2mtd, the replacement, as no longer experimental and
> 3. remove the driver.
>=20
> Eric suggested sending patch 1 and 2 directly to Linus while leaving
> patch 3 in -mm as long as klibc remains there as well.  Andrew, do you
> prefer me to send the first two patches to Linus or will you rather do
> it yourself?
>=20

That's all too much fuss.  Let's just zap it.
