Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8dXU-0006Bm-4q
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 15:56:09 +0000
Date: Wed, 18 Jun 2008 00:57:35 +0900 (JST)
Message-Id: <20080618.005735.51867626.anemo@mba.ocn.ne.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080617152932.GD28448@logfs.org>
References: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
	<20080617152932.GD28448@logfs.org>
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

On Tue, 17 Jun 2008 17:29:32 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> At least I have a hard enough time understanding it today.  The first=

> loop seems to look for the last eraseregion that is part of the curre=
nt
> partition.  Why then it should check for
> 	slave->offset + slave->mtd.size > regions[i].offset
> instead of =

> 	slave->offset >=3D regions[i].offset

The first loop searches an erase region which the start of the
partition belongs to.  So slave->mtd.size should be irrelevant.

> Odd.  And the second loop should go backwards as long as the
> eraseregions are part of the current partition.  Which means that
> 	i < master->numeraseregions
> doesn't make sense at all and
> 	slave->offset + slave->mtd.size > regions[i].offset
> would imply that eraseregions go backwards.

No, the second loop go forwards.  It searches maximum erasesize of the
partition.

> In other words, I am tempted to replace all that with a single line:
> 	BUG();
> =

> At least that line is short and descriptive.  Otherwise it seems to b=
e
> roughly equivalent of what we had before.

Oh please don't.  Creating partitions on NOR flash chip with small
boot sectors is common usage.  These codes are surely required.

---
Atsushi Nemoto
