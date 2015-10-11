Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlMqo-0004MA-Sf
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2015 20:04:11 +0000
Received: by qgez77 with SMTP id z77so107775381qge.1
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2015 13:03:49 -0700 (PDT)
Date: Sun, 11 Oct 2015 13:03:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/5] mtd: mtdpart: Do not fail mtd probe when parsing
 partitions fails.
Message-ID: <20151011200347.GD3696@localhost>
References: <cover.1439911625.git.hramrach@gmail.com>
 <97366073dfe93b478f24e2fc30ca818326906e0a.1439911625.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97366073dfe93b478f24e2fc30ca818326906e0a.1439911625.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

Sorry for the very long waits here. Unfortunately, I've been saying that
a lot lately, as I haven't had a lot of time and have generated a lot of
backlog. I really like that you've been working on this though, since
there are definitely problems here.

On Tue, Aug 18, 2015 at 03:34:07PM -0000, Michal Suchanek wrote:
> Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
> with no partitions because the subnode containing controller data
> confuses the ofpart parser.
> 
> Thus compiling in ofpart support automatically fails probing any SPI NOR
> flash without partitions on Exynos.
> 
> Compiling in a partitioning scheme should not cause probe of otherwise
> valid device to fail.
> 
> Remove that failure possibility when MTD_PARTITIONED_MASTER is set.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> 
> ---
> v2:
> 
>  - only allow partition parsing failure when MTD_PARTITIONED_MASTER is
>    set

Why the special case for MTD_PARTITIONED_MASTER? I don't think this case
should be much different. In either case, we should actually be falling
back to just exposing the unpartitioned master device. We already do
that when no partitions are found (but no error codes) in either
MTD_PARTITIONED_MASTER={y,n}. We just need to do that for error cases
too, I think.

> ---
>  drivers/mtd/mtdpart.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 31888c2..6eafbe9 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -774,10 +774,15 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  		if (ret > 0) {
>  			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
>  			       ret, parser->name, master->name);
> -			break;
> +			return ret;
> +		}
> +		if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && (ret < 0)) {
> +			pr_err("Error parsing %s partitions on %s\n",
> +			       parser->name, master->name);
> +			return ret;

I think this hunk should be more like the hunk from the previous
versions; don't do a separate CONFIG_xxx special case.

I also think this has one other flaw: it's best if we don't completely
ignore all failures. If we have one or more partitioning failures, this
should show up somehow in the log at least, and not only with the
pr_debug() messages from patch 1. I like the logic for the block
subsystem for failures (see check_partition() in
block/partitions/check.c). Skip a parser quietly if a later one
succeeds, but report an error with a warning printk if none succeed.

>  		}
>  	}
> -	return ret;
> +	return 0;
>  }
>  
>  int mtd_is_partition(const struct mtd_info *mtd)

All in all, I think my suggestions would look something like the
following alternative patch. I haven't tested it yet.

Brian

(git-format-patch pasted below)

>From 53b60f31a2a0f2a7e8220a4aff47457248bccbcf Mon Sep 17 00:00:00 2001
From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Oct 2015 10:25:23 -0700
Subject: [PATCH] mtd: mtdpart: Do not fail mtd probe when parsing partitions
 fails.

Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
with no partitions because the subnode containing controller data
confuses the ofpart parser.

Thus compiling in ofpart support automatically fails probing any SPI NOR
flash without partitions on Exynos.

Compiling in a partitioning scheme should not cause probe of otherwise
valid device to fail.

Instead, let's do the following:
 * try parsers until one succeeds
 * if no parser succeeds, report the first error we saw
 * even in the failure case, allow MTD to probe, with fallback
   partitions or no partitions at all -- the master device will still be
   registered

Issue report and comments initially by Michal Suchanek.

Reported-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c |  6 ++++--
 drivers/mtd/mtdpart.c | 14 ++++++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8ec4f81e9190..bb50e486e064 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -589,8 +589,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 	/* Didn't come up with either parsed OR fallback partitions */
 	if (ret < 0) {
-		pr_info("mtd: failed to find partitions\n");
-		goto out;
+		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
+			ret);
+		/* Don't abort on errors; we can still use unpartitioned MTD */
+		ret = 0;
 	}
 
 	ret = mtd_add_device_partitions(mtd, real_parts, ret);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f5279ea6dc87..f8ba153f63bf 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -755,12 +755,12 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 struct mtd_part_parser_data *data)
 {
 	struct mtd_part_parser *parser;
-	int ret = 0;
+	int ret, err = 0;
 
 	if (!types)
 		types = default_mtd_part_types;
 
-	for ( ; ret <= 0 && *types; types++) {
+	for ( ; *types; types++) {
 		pr_debug("%s: parsing partitions %s\n", master->name, *types);
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
@@ -776,10 +776,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-			break;
+			return ret;
 		}
+		/*
+		 * Stash the first error we see; only report it if no parser
+		 * succeeds
+		 */
+		if (ret < 0 && !err)
+			err = ret;
 	}
-	return ret;
+	return err;
 }
 
 int mtd_is_partition(const struct mtd_info *mtd)
-- 
2.6.0.rc2.230.g3dd15c0
