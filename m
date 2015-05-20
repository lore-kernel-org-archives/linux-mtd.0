Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv909-0003bE-8O
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 18:45:58 +0000
Received: by pdbnk13 with SMTP id nk13so78384586pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 11:45:35 -0700 (PDT)
Date: Wed, 20 May 2015 11:45:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/1] mtd: add support for typed parsers splitting
 partitions
Message-ID: <20150520184532.GH11598@ld-irv-0074>
References: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
Cc: Gabor Juhos <juhosg@openwrt.org>, Felix Fietkau <nbd@openwrt.org>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I haven't reviewed this entirely yet, but my build tests complained:

On Mon, May 18, 2015 at 02:34:53PM +0200, Rafał Miłecki wrote:
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index cafdb88..d583d6d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
[...]
> @@ -775,6 +781,72 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  	return ret;
>  }
>  
> +int mtd_parse_typed_partitions(struct mtd_info *slave,
> +			       enum mtd_partition_type type,
> +			       struct mtd_partition **pparts,
> +			       struct mtd_part_parser_data *data)

drivers/mtd/mtdpart.c:784:5: warning: no previous prototype for ‘mtd_parse_typed_partitions’ [-Wmissing-prototypes]
 int mtd_parse_typed_partitions(struct mtd_info *slave,
     ^
drivers/mtd/mtdpart.c:784:5: warning: symbol 'mtd_parse_typed_partitions' was not declared. Should it be static? [sparse]

> +{
> +	struct mtd_part_parser *p = NULL;
> +	bool found;
> +	int ret = 0;
> +
> +	while (1) {

[...]

Brian
