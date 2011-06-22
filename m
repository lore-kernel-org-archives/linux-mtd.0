Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZEvv-0008RM-D9
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 04:20:57 +0000
Received: by pvg20 with SMTP id 20so262686pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 21:20:50 -0700 (PDT)
Subject: Re: [PATCH 01/18] mtd: abstract last MTD partition parser argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 22 Jun 2011 07:21:32 +0300
In-Reply-To: <1307833922-21602-2-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
	<1307833922-21602-2-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308716496.18119.8.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I see a lot of checkpatch.pl warnings, could you please take a look?

Also, my gcc produces warnings with this patch because you have not
fixed up MPT parsers, e.g., like this:


diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 6697a1e..71bfa2e 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -46,7 +46,7 @@ struct ar7_bin_rec {
 
 static int create_mtd_partitions(struct mtd_info *master,
                                 struct mtd_partition **pparts,
-                                unsigned long origin)
+                                struct mtd_part_parser_data *data)
 {
        struct ar7_bin_rec header;
        unsigned int offset;

On Sun, 2011-06-12 at 03:11 +0400, Dmitry Eremin-Solenikov wrote:
> - * @origin: start address of MTD device, %0 unless you are sure you need this.
> + * @parser_data: data passed to mtd parsers

Nitpick, but could you call this MTD partition parser-specific data
instead.

>   * @pparts: array of partitions found is returned here
> - * @origin: MTD device start address (use %0 if unsure)
> + * @data: data passed to MTD partition parsers

And this.

> +/**
> + * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
> + * @origin: for RedBoot, start address of MTD device, %0 unless you are sure you need this.
> + */
> +struct mtd_part_parser_data {
> +	unsigned long origin;
> +};

Could you please embrace the origin field into an anonymous union - once
we add the of_node field they do not have to be at separate addresses. I
mean:

struct mtd_part_parser_data {
	union {
		unsigned long origin;
		struct device_node *of_node;
	};
};

-- 
Best Regards,
Artem Bityutskiy
