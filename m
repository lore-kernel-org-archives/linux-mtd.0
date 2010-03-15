Received: from cantor.suse.de ([195.135.220.2] helo=mx1.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NrB5a-0007Ez-Fa
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2010 14:16:19 +0000
Date: Mon, 15 Mar 2010 15:16:09 +0100 (CET)
From: Jiri Kosina <jkosina@suse.cz>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] MTD: drop +x perms on C source files
In-Reply-To: <1267808420-27330-1-git-send-email-vapier@gentoo.org>
Message-ID: <alpine.LNX.2.00.1003151515480.18642@pobox.suse.cz>
References: <1267808420-27330-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 Mar 2010, Mike Frysinger wrote:

> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  0 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 drivers/mtd/chips/cfi_util.c
>  mode change 100755 => 100644 drivers/mtd/inftlcore.c
> 
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> old mode 100755
> new mode 100644
> diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
> old mode 100755
> new mode 100644

This has already been fixed tree-wide by commit c14e522b1aab6a1a.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
