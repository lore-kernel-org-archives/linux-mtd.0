Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY9Bg-0002E2-Av
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 12:04:44 +0000
Date: Wed, 27 Jun 2018 14:04:04 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH] mtd-utils: add possibility to flag a static volume to
 skip CRC check when opening
Message-ID: <20180627140404.00e814c2@bbrezillon>
In-Reply-To: <20180627113823.28470-1-quentin.schulz@bootlin.com>
References: <20180627113823.28470-1-quentin.schulz@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jun 2018 13:38:23 +0200
Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> Some users of static UBI volumes implement their own integrity check,
> thus making the volume CRC check done at open time by the kernel
> useless. For instance, this is the case when one use the ubiblock +
> dm-verity + squashfs combination, where dm-verity already checks
> integrity of the block device but this time at the block granularity
> instead of verifying the whole volume.
> 
> Skipping this test drastically improves the boot-time.
> 
> Let's add this feature to ubimkvol and ubinize so that we can flag a
> static volume as where the CRC check should be skipped.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  include/libubi.h        |  2 ++
>  include/mtd/ubi-media.h |  6 ++++++
>  include/mtd/ubi-user.h  | 16 ++++++++++++++--
>  lib/libubi.c            |  1 +
>  ubi-utils/ubimkvol.c    | 19 ++++++++++++++++---
>  ubi-utils/ubinize.c     |  7 +++++++

Hm, I think you should split the changes in several patches.

1/ sync ubi-media.h and ubi-user.h with the (future) kernel version
2/ add support for this feature to libubi.{c,h}
3/ patch ubimkvol to support the skip-check feature
4/ patch ubinize to support the skip-check feature

>  6 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/include/libubi.h b/include/libubi.h
> index 4d6a7ee..46596a3 100644
> --- a/include/libubi.h
> +++ b/include/libubi.h
> @@ -69,6 +69,7 @@ struct ubi_attach_request
>   * @bytes: volume size in bytes
>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
>   * @name: volume name
> + * @flags: volume flags
>   */
>  struct ubi_mkvol_request
>  {
> @@ -77,6 +78,7 @@ struct ubi_mkvol_request
>  	long long bytes;
>  	int vol_type;
>  	const char *name;
> +	uint8_t flags;
>  };
>  
>  /**
> diff --git a/include/mtd/ubi-media.h b/include/mtd/ubi-media.h
> index 08bec3e..4db252f 100644
> --- a/include/mtd/ubi-media.h
> +++ b/include/mtd/ubi-media.h
> @@ -61,6 +61,11 @@ enum {
>   * Volume flags used in the volume table record.
>   *
>   * @UBI_VTBL_AUTORESIZE_FLG: auto-resize this volume
> + * @UBI_VTBL_SKIP_CRC_CHECK_FLG: skip the CRC check done on static volume at
> + *				 open time. Should only be set on volumes that
> + *				 are used by upper layers doing this kind of
> + *				 check. Main use-case for this flag is
> + *				 boot-time reduction
>   *
>   * %UBI_VTBL_AUTORESIZE_FLG flag can be set only for one volume in the volume
>   * table. UBI automatically re-sizes the volume which has this flag and makes
> @@ -92,6 +97,7 @@ enum {
>   */
>  enum {
>  	UBI_VTBL_AUTORESIZE_FLG = 0x01,
> +	UBI_VTBL_SKIP_CRC_CHECK_FLG = 0x02,
>  };
>  
>  /*
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index 2b50dad..443f2e1 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -279,6 +279,18 @@ struct ubi_attach_req {
>  	int8_t  padding[10];
>  };
>  
> +/*
> + * UBI volume flags.
> + *
> + * @UBI_VOL_SKIP_CRC_CHECK_FLG: skip the CRC check done on static volumes at
> + *				open time. Only valid for static volumes and
> + *				should only be used if the volume user has a
> + *				way to verify data integrity
> + */
> +enum {
> +	UBI_VOL_SKIP_CRC_CHECK_FLG = 0x1,
> +};
> +
>  /**
>   * struct ubi_mkvol_req - volume description data structure used in
>   *                        volume creation requests.
> @@ -286,7 +298,7 @@ struct ubi_attach_req {
>   * @alignment: volume alignment
>   * @bytes: volume size in bytes
>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
> - * @padding1: reserved for future, not used, has to be zeroed
> + * @flags: volume flags (%UBI_VOL_SKIP_CRC_CHECK_FLG)
>   * @name_len: volume name length
>   * @padding2: reserved for future, not used, has to be zeroed
>   * @name: volume name
> @@ -315,7 +327,7 @@ struct ubi_mkvol_req {
>  	int32_t alignment;
>  	int64_t bytes;
>  	int8_t vol_type;
> -	int8_t padding1;
> +	uint8_t flags;
>  	int16_t name_len;
>  	int8_t padding2[4];
>  	char name[UBI_MAX_VOLUME_NAME + 1];
> diff --git a/lib/libubi.c b/lib/libubi.c
> index 978b433..4322a19 100644
> --- a/lib/libubi.c
> +++ b/lib/libubi.c
> @@ -1000,6 +1000,7 @@ int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
>  	r.alignment = req->alignment;
>  	r.bytes = req->bytes;
>  	r.vol_type = req->vol_type;
> +	r.flags = req->flags;
>  
>  	n = strlen(req->name);
>  	if (n > UBI_MAX_VOLUME_NAME)
> diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
> index b81fc99..6c641e5 100644
> --- a/ubi-utils/ubimkvol.c
> +++ b/ubi-utils/ubimkvol.c
> @@ -44,6 +44,7 @@ struct args {
>  	const char *name;
>  	const char *node;
>  	int maxavs;
> +	int skipcheck;
>  };
>  
>  static struct args args = {
> @@ -68,16 +69,17 @@ static const char optionsstr[] =
>  "                              eraseblocks\n"
>  "-m, --maxavsize               set volume size to maximum available size\n"
>  "-t, --type=<static|dynamic>   volume type (dynamic, static), default is dynamic\n"
> +"-k, --skipcheck               skip the CRC check done at volume open time\n"
>  "-h, -?, --help                print help message\n"
>  "-V, --version                 print program version";
>  
>  
>  static const char usage[] =
>  "Usage: " PROGRAM_NAME " <UBI device node file name> [-h] [-a <alignment>] [-n <volume ID>] [-N <name>]\n"
> -"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m]\n"
> +"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m] [-k]\n"
>  "\t\t\t[--alignment=<alignment>][--vol_id=<volume ID>] [--name=<name>]\n"
>  "\t\t\t[--size=<bytes>] [--lebs=<LEBs>] [--type=<static|dynamic>] [--help]\n"
> -"\t\t\t[--version] [--maxavsize]\n\n"
> +"\t\t\t[--version] [--maxavsize] --[skipcheck]\n\n"
>  "Example: " PROGRAM_NAME " /dev/ubi0 -s 20MiB -N config_data - create a 20 Megabytes volume\n"
>  "         named \"config_data\" on UBI device /dev/ubi0.";
>  
> @@ -91,6 +93,7 @@ static const struct option long_options[] = {
>  	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
>  	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
>  	{ .name = "maxavsize", .has_arg = 0, .flag = NULL, .val = 'm' },
> +	{ .name = "skipcheck", .has_arg = 0, .flag = NULL, .val = 'k' },
>  	{ NULL, 0, NULL, 0},
>  };
>  
> @@ -113,6 +116,9 @@ static int param_sanity_check(void)
>  	if (len > UBI_MAX_VOLUME_NAME)
>  		return errmsg("too long name (%d symbols), max is %d", len, UBI_MAX_VOLUME_NAME);
>  
> +	if (args.skipcheck && args.vol_type != UBI_STATIC_VOLUME)
> +		return errmsg("skipcheck is only valid for static volumes");
> +
>  	return 0;
>  }
>  
> @@ -121,7 +127,7 @@ static int parse_opt(int argc, char * const argv[])
>  	while (1) {
>  		int key, error = 0;
>  
> -		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vm", long_options, NULL);
> +		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vmk", long_options, NULL);
>  		if (key == -1)
>  			break;
>  
> @@ -183,6 +189,10 @@ static int parse_opt(int argc, char * const argv[])
>  			args.maxavs = 1;
>  			break;
>  
> +		case 'k':
> +			args.skipcheck = 1;
> +			break;
> +
>  		case ':':
>  			return errmsg("parameter is missing");
>  
> @@ -266,6 +276,9 @@ int main(int argc, char * const argv[])
>  	req.vol_type = args.vol_type;
>  	req.name = args.name;
>  
> +	if (args.skipcheck)
> +		req.flags |= UBI_VOL_SKIP_CRC_CHECK_FLG;
> +
>  	err = ubi_mkvol(libubi, args.node, &req);
>  	if (err < 0) {
>  		sys_errmsg("cannot UBI create volume");
> diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
> index c85ff9b..bb2cbc6 100644
> --- a/ubi-utils/ubinize.c
> +++ b/ubi-utils/ubinize.c
> @@ -388,6 +388,9 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
>  		if (!strcmp(p, "autoresize")) {
>  			verbose(args.verbose, "autoresize flags found");
>  			vi->flags |= UBI_VTBL_AUTORESIZE_FLG;
> +		} else if (!strcmp(p, "skip-check")) {
> +			verbose(args.verbose, "skip-check flag found");
> +			vi->flags |= UBI_VTBL_SKIP_CRC_CHECK_FLG;

This works because autoresize and skip-check do not apply to the same
volume types (autoresize only applies to dynamic volumes and
skip-check is only valid for static ones), hence you can't have both of
them set at the same time. Still, I think it would be better to
implement a real parsing of the vol_flags prop (use ',' as a separator
between flags for example).

I'm not necessarily asking that you implement that parsing now, but you
should at least add a big fat comment explaining why this is valid for
now and what should be done if we have to support new flags.

>  		} else {
>  			return errmsg("unknown flags \"%s\" in section \"%s\"",
>  				      p, sname);
> @@ -523,6 +526,10 @@ int main(int argc, char * const argv[])
>  			}
>  		}
>  
> +		if (vi[i].flags & UBI_VTBL_SKIP_CRC_CHECK_FLG &&
> +		    vi[i].type != UBI_VID_STATIC)
> +			return errmsg("skip-check is only valid for static volumes");
> +
>  		if (vi[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
>  			if (autoresize_was_already)
>  				return errmsg("only one volume is allowed "
