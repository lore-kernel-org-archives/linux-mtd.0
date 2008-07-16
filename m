Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ8cQ-0002zx-E1
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 15:08:39 +0000
Date: Thu, 17 Jul 2008 00:10:23 +0900 (JST)
Message-Id: <20080717.001023.61509796.anemo@mba.ocn.ne.jp>
To: joern@logfs.org
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080619.173458.223067266.nemoto@toshiba-tops.co.jp>
References: <20080619.160938.108184127.nemoto@toshiba-tops.co.jp>
	<20080619082454.GJ10271@logfs.org>
	<20080619.173458.223067266.nemoto@toshiba-tops.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Jun 2008 17:34:58 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> > Much better.  I was thinking about the same thing while doing the
> > patches, but for some reason forgot about it again.
> > 
> > Do you want me to push the patchset?  And would you be willing to add a
> > tested-by: or so?
> 
> Yes, please.
> 
> Tested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

Ping?  Should I send your patchset with my fix?

---
Atsushi Nemoto
