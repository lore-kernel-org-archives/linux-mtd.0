Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0Hda-0001WY-2B
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 15:28:10 +0000
Date: Thu, 13 Nov 2008 00:28:14 +0900 (JST)
Message-Id: <20081113.002814.12191937.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	Matteo Croce <technoboy85@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Nov 2008 23:57:33 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> The mtd partition parser returns an allocated pointer array of
> mtd_partition.  The caller must free it.  The array is used only for
> add_mtd_partitions(), so free it just after the call.

Note: all parsers except for the ar7part return kmalloced memory.

The ar7part parser returns a pointer of static array.  While currently
there is no in-kernel user of this parser, there should not be cause
regression.

Anyway, I suppose ar7part parser also should return kmalloced memory,
as like as all other parsers.

---
Atsushi Nemoto
