Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0cU5-0002qq-R4
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 13:43:46 +0000
Date: Thu, 13 Nov 2008 22:43:50 +0900 (JST)
Message-Id: <20081113.224350.18312549.anemo@mba.ocn.ne.jp>
To: vapier@gentoo.org
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
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

On Wed, 12 Nov 2008 18:38:53 -0500, Mike Frysinger <vapier@gentoo.org> wrote:
> Rather than having every map/mtd driver doing the same sequence of
> registering partitions and/or devices, implement common parse_mtd().
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  drivers/mtd/mtdcore.c   |   37 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |    3 +++
>  2 files changed, 40 insertions(+), 0 deletions(-)

I like this idea.

> +int parse_mtd(struct mtd_info *mtd, const char **probe_types,
> +              struct mtd_partition *parts, int nr_parts)
> +{
> +#ifdef CONFIG_MTD_PARTITIONS
> +	const char *default_part_probe_types[] = {
> +		"cmdlinepart",
> +		"RedBoot",
> +		NULL
> +	};

But I'm not sure this default_part_probe_types is appropriate.

How about enclose each parser with #ifdefs?

	const char *default_part_probe_types[] = {
#ifdef CONFIG_MTD_CMDLINE_PARTS
		"cmdlinepart",
#endif
#ifdef CONFIG_MTD_REDBOOT_PARTS
		"RedBoot",
#endif
		NULL
	};

This get rid of "RedBoot partition parsing not available" noise in
boot message when you use default_part_probe_types without
MTD_REDBOOT_PARTS.

---
Atsushi Nemoto
