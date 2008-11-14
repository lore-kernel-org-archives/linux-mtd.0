Date: Fri, 14 Nov 2008 13:39:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
Message-Id: <20081114133953.bb65b2ad.akpm@linux-foundation.org>
In-Reply-To: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 12 Nov 2008 18:38:53 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> +int parse_mtd(struct mtd_info *mtd, const char **probe_types,
> +              struct mtd_partition *parts, int nr_parts)
> +{
> +#ifdef CONFIG_MTD_PARTITIONS
> +	const char *default_part_probe_types[] = {
> +		"cmdlinepart",
> +		"RedBoot",
> +		NULL
> +	};
> +	int ret;
> +
> +	if (!probe_types)
> +		probe_types = default_part_probe_types;
> +
> +	ret = parse_mtd_partitions(mtd, probe_types, &parts, 0);
> +	if (ret > 0) {
> +		ret = add_mtd_partitions(mtd, parts, ret);
> +		kfree(parts);
> +		return ret;
> +	} else if (nr_parts)
> +		return add_mtd_partitions(mtd, parts, nr_parts);
> +#endif
> +
> +	return add_mtd_device(mtd);
> +}

look:

From: Andrew Morton <akpm@linux-foundation.org>

          text    data     bss     dec     hex filename
before:   2488      88     132    2708     a94 drivers/mtd/mtdcore.o
after:    2456     100     132    2688     a80 drivers/mtd/mtdcore.o

Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdcore.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/mtdcore.c~mtd-unify-mtd-partition-device-registration-fix drivers/mtd/mtdcore.c
--- a/drivers/mtd/mtdcore.c~mtd-unify-mtd-partition-device-registration-fix
+++ a/drivers/mtd/mtdcore.c
@@ -306,7 +306,7 @@ int parse_mtd(struct mtd_info *mtd, cons
               struct mtd_partition *parts, int nr_parts)
 {
 #ifdef CONFIG_MTD_PARTITIONS
-	const char *default_part_probe_types[] = {
+	static const char *default_part_probe_types[] = {
 		"cmdlinepart",
 		"RedBoot",
 		NULL
_
