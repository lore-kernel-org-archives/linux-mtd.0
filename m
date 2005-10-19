Received: from topsns.toshiba-tops.co.jp ([202.230.225.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESB8V-0002Gk-9H
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 06:25:35 -0400
Date: Wed, 19 Oct 2005 19:26:29 +0900 (JST)
Message-Id: <20051019.192629.126139764.nemoto@toshiba-tops.co.jp>
To: mreimer@vpop.net
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <200510172127.39342.mreimer@vpop.net>
References: <200510172127.39342.mreimer@vpop.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd_blkdevs.c missing flush_dcache_page()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> On Mon, 17 Oct 2005 21:27:39 -0700, Matthew Reimer <mreimer@vpop.net> said:
mreimer> I came across this post in which RMK says mtd_blkdevs.c is
mreimer> missing a call to flush_dcache_page(), patch included:

mreimer> http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2005-May/029023.html

mreimer> I suppose not calling flush_dcache_page() could result in
mreimer> file corruption.

mreimer> Should this patch be applied?

Yes.  Without this patch, I saw file corruption on following
conditions:

* CPU have dcache aliasing
* use ext2 (etc.  not jffs2 neither cramfs) on /dev/mtdblock
* mmap and read a file in the filesystem

I tested this patch on MIPS and it works fine.

---
Atsushi Nemoto
