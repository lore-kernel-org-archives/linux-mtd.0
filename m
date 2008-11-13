Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0cb1-00034K-1S
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 13:50:55 +0000
Date: Thu, 13 Nov 2008 22:51:01 +0900 (JST)
Message-Id: <20081113.225101.14979944.anemo@mba.ocn.ne.jp>
To: vapier@gentoo.org
Subject: Re: [PATCH] mtd/physmap: use parse_mtd()
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1226533189-8492-1-git-send-email-vapier@gentoo.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<1226533189-8492-1-git-send-email-vapier@gentoo.org>
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

On Wed, 12 Nov 2008 18:39:48 -0500, Mike Frysinger <vapier@gentoo.org> wrote:
> Call parse_mtd() to handle partition/device registration rather than doing
> it all ourself.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  drivers/mtd/maps/physmap.c |   21 +--------------------
>  1 files changed, 1 insertions(+), 20 deletions(-)

You should adjust physmap_flash_remove() too.

* remove kfree(info->parts)
* call del_mtd_partitions() or del_mtd_device()

Maybe del_parsed_mtd() or something is required?

---
Atsushi Nemoto
