Received: from [202.230.225.126] (helo=topsms.toshiba-tops.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfO4i-0001TJ-2D
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 00:38:06 +0000
Date: Fri, 06 Mar 2009 09:37:57 +0900 (JST)
Message-Id: <20090306.093757.42927769.nemoto@toshiba-tops.co.jp>
To: philipp.zabel@gmail.com
Subject: Re: physmap Oops if map_probe failed
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <74d0deb30903050822g45fbf6f8vd9c3d54a0ddb9e59@mail.gmail.com>
References: <74d0deb30903050822g45fbf6f8vd9c3d54a0ddb9e59@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, matthias@kaehlcke.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Mar 2009 17:22:23 +0100, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
> commit e480814f138cd5d78a8efe397756ba6b6518fdb6 ("[MTD] [MAPS]
> physmap: fix wrong free and del_mtd_{partition,device}") introduces a
> NULL pointer dereference in physmap_flash_remove when called from the
> error path in physmap_flash_probe (if map_probe failed).
> The kernel was compiled with CONFIG_MTD_PARTITIONS=y

Oh yes, I will send a fix ASAP.  Thank you for report.

---
Atsushi Nemoto
