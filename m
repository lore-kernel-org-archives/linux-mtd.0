Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JuUDF-0002r9-7Z
	for linux-mtd@lists.infradead.org; Fri, 09 May 2008 15:08:45 +0000
Date: Sat, 10 May 2008 00:09:50 +0900 (JST)
Message-Id: <20080510.000950.25478534.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [2.6.25 PATCH] JFFS2 Fix of panics caused by wrong condition
	for hole frag creation in write_begin
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1208202002.3005.35.camel@pmac.infradead.org>
References: <1208202002.3005.35.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	torvalds@infradead.org, akpm@linux-foundation.org,
	vailiy.leonenko@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Apr 2008 20:40:02 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> From: Alexey Korolev <akorolev@infradead.org>
> 
> This fixes a regression introduced in commit
> 205c109a7a96d9a3d8ffe64c4068b70811fef5e8 when switching to
> write_begin/write_end operations in JFFS2. The page offset is
> miscalculated, leading to corruption of the fragment lists and
> subsequently to memory corruption and panics.
> 
> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@mail.ru>
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>

I see this in final 2.6.25 kernel.
Is this worth to go to 2.6.24.y stable too?

---
Atsushi Nemoto
