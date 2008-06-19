Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9Fbj-0005P3-SF
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 08:35:04 +0000
Date: Thu, 19 Jun 2008 17:34:58 +0900 (JST)
Message-Id: <20080619.173458.223067266.nemoto@toshiba-tops.co.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080619082454.GJ10271@logfs.org>
References: <20080618175253.GD10271@logfs.org>
	<20080619.160938.108184127.nemoto@toshiba-tops.co.jp>
	<20080619082454.GJ10271@logfs.org>
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

On Thu, 19 Jun 2008 10:24:54 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> > This is my quick fix on top of your patchset.  Please fold this (or=

> > your own fix) into first patch.
> =

> Much better.  I was thinking about the same thing while doing the
> patches, but for some reason forgot about it again.
> =

> Do you want me to push the patchset?  And would you be willing to add=
 a
> tested-by: or so?

Yes, please.

Tested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

---
Atsushi Nemoto
