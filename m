Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0Geh-0003Ub-67
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 15:29:52 +0000
Date: Wed, 21 Oct 2009 00:29:41 +0900 (JST)
Message-Id: <20091021.002941.41633716.anemo@mba.ocn.ne.jp>
To: hartleys@visionengravers.com
Subject: Re: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Oct 2009 13:31:46 -0400, "H Hartley Sweeten" <hartleys@visionengravers.com> wrote:
> During the probe for physmap platform flash devices there are a
> number error exit conditions that all do a goto err_out which
> then calls physmap_flash_remove().  In that function one of the
> cleanup steps is:
> 
> #ifdef CONFIG_MTD_CONCAT
> 	if (info->cmtd != info->mtd[0])
> 		mtd_concat_destroy(info->cmtd);
> #endif
> 
> This test will succeed since info->cmtd == NULL and info->mtd[0] is
> valid.

Oh I had missed this case when fixing physmap_flash_remove last time.

> Fix this by exiting the remove function when info->cmtd == NULL.

No, map_destroy loop at the end of the function should not be skipped
even when info->cmtd == NULL.

> Also, cleanup the #ifdef CONFIG_MTD_PARTITIONS stuff by using
> mtd_has_partitions().

And this cleanup cause build errors when CONFIG_MTD_PARTITIONS was not
set.  A separate patch might be better for such cleanup.

---
Atsushi Nemoto
