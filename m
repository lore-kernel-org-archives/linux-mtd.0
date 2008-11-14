Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0zeD-0003ID-Ub
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 14:27:46 +0000
Date: Fri, 14 Nov 2008 23:27:42 +0900 (JST)
Message-Id: <20081114.232742.128619046.anemo@mba.ocn.ne.jp>
To: vapier@gentoo.org
Subject: Re: [PATCH v2] mtd: unify mtd partition/device registration
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1226665351-20226-1-git-send-email-vapier@gentoo.org>
References: <1226665351-20226-1-git-send-email-vapier@gentoo.org>
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

On Fri, 14 Nov 2008 07:22:31 -0500, Mike Frysinger <vapier@gentoo.org> wrote:
> Rather than having every map/mtd driver doing the same sequence of
> registering partitions and/or devices, implement common parse_mtd().
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2:
> 	- ifdef parsers in parse_mtd()
> 	- add "always_whole" to parse_mtd()
> 	- add unparse_mtd()
> 
>  drivers/mtd/mtdcore.c   |   60 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |    5 ++++
>  2 files changed, 65 insertions(+), 0 deletions(-)

Though not tested yet on real hardware, all patches looks OK for me.
Thanks!

---
Atsushi Nemoto
