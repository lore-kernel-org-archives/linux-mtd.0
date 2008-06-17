Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8doy-0000Z8-DH
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 16:14:13 +0000
Date: Wed, 18 Jun 2008 01:15:40 +0900 (JST)
Message-Id: <20080618.011540.18574389.anemo@mba.ocn.ne.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080617153942.GE28448@logfs.org>
References: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
	<20080617152932.GD28448@logfs.org>
	<20080617153942.GE28448@logfs.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 17 Jun 2008 17:39:43 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> > In other words, I am tempted to replace all that with a single line=
:
> > 	BUG();
> =

> Or maybe combine it with the else path:
> 	slave->mtd.erasesize =3D master->erasesize;
> 	if (master->numeraseregions > 1)
> 		printk(KERN_ERR"mtdpart can not handle multiple eraseregions correc=
tly.\n");
> =

> Nemoto-san, would this be good enough for you?  It fixes the bug you
> noticed, it removes most long lines and it removes the sparse warning=
.=

> It also removes functionality that may have been useful to some perso=
n -
> detecting a smaller erasesize.  And with some luck and a warm easterl=
y
> wind, that functionality may even have worked.

No, unfortunately.  For example, if you split a 2MB chip with
16KB+8KB+8KB+32KB+64KBx31 eraseregions into two 1MB partitions, both
partition should have 64KB erase size.

---
Atsushi Nemoto
