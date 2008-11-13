Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0dBD-0004yi-Ct
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 14:28:20 +0000
Date: Thu, 13 Nov 2008 23:28:23 +0900 (JST)
Message-Id: <20081113.232823.125897716.anemo@mba.ocn.ne.jp>
To: vapier@gentoo.org
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20081113.224350.18312549.anemo@mba.ocn.ne.jp>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<20081113.224350.18312549.anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Nov 2008 22:43:50 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Wed, 12 Nov 2008 18:38:53 -0500, Mike Frysinger <vapier@gentoo.org> wrote:
> > Rather than having every map/mtd driver doing the same sequence of
> > registering partitions and/or devices, implement common parse_mtd().
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > ---
> >  drivers/mtd/mtdcore.c   |   37 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/mtd.h |    3 +++
> >  2 files changed, 40 insertions(+), 0 deletions(-)
> 
> I like this idea.

Some drivers call both add_mtd_device() and add_mtd_partitions().  The
mtd_device is used to access whole flash area (like /dev/hda).  How do
you think of these usage patterns?

maps/edb7312.c
maps/mbx860.c
maps/plat-ram.c
nand/cafe_nand.c
nand/diskonchip.c
nand/ndfc.c

Automatic fallback to mtd_device in parse_mtd() is convenient but
somewhat unflexible...

---
Atsushi Nemoto
