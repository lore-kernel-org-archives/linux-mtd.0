Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L1lqD-000831-O4
	for linux-mtd@lists.infradead.org; Sun, 16 Nov 2008 17:55:22 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
Date: Sun, 16 Nov 2008 12:55:17 -0500
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<20081116173453.GA703@logfs.org>
In-Reply-To: <20081116173453.GA703@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200811161255.18513.vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 16 November 2008 12:34:54 J=C3=B6rn Engel wrote:
> On Wed, 12 November 2008 18:38:53 -0500, Mike Frysinger wrote:
> > Rather than having every map/mtd driver doing the same sequence of
> > registering partitions and/or devices, implement common parse_mtd().
>
> I just added partitioning support to block2mtd.  Looks like I might
> rethink the patch. :)
>
> > @@ -292,6 +292,43 @@ void put_mtd_device(struct mtd_info *mtd)
> >  	module_put(mtd->owner);
> >  }
> >
> > +#include <linux/mtd/partitions.h>
>
> #include in the middle of the code?

maybe i'll stick a comment above it ... the reason was to be proactive in=20
preventing mtd partitioning code bleeding into the core.  maybe i'm just=20
paranoid.
=2Dmike
