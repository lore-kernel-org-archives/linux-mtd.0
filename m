Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUIzU-0004Ru-Gj
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:40:13 +0000
Received: by fxm14 with SMTP id 14so429110fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:40:09 -0700 (PDT)
Subject: Re: [PATCH v2] mtdinfo: add regioninfo/eraseblock map display
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307461999-6483-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
	<1307461999-6483-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 16:35:51 +0300
Message-ID: <1307540151.31223.85.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 11:53 -0400, Mike Frysinger wrote:
> This brings the mtdinfo utility in line with the functionality
> of the flash_info utility.  It dumps the erase regioninfo (if
> the devices has it) as well as showing a handy eraseblock map
> (if the user has requested it).  The eraseblock map also shows
> which blocks are locked and which ones are bad.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- rename sector map to eraseblock map
> 	- include bad block info in map
> 	- update libmtd api calls

Sorry, but I still have some nit-picks.

> @@ -110,6 +114,10 @@ static int parse_opt(int argc, char * const argv[])
>  			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
>  			break;
>  
> +		case 'M':
> +			args.map = 1;
> +			break;
> +
>  		case 'h':
>  			printf("%s\n\n", doc);
>  			printf("%s\n\n", usage);

Would you also please add the following code near the end of the
'parse_opt()' function:

+       if (args.map && !args.node)
+               return errmsg("-M requires MTD device node name");

This will anyway be true when we remove -m, a the checks like "if
(args.node)" will be not needed.

> +static void print_map(libmtd_t libmtd, const struct mtd_dev_info *mtd,
> +		      int fd, const region_info_t *reginfo)
> +{
> +	unsigned long start;
> +	int i, width;
> +
> +	printf("Eraseblock map:\n");
> +
> +	/* figure out the number of spaces to pad w/out libm */
> +	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
> +		continue;
> +
> +	for (i = 0; i < reginfo->numblocks; ++i) {
> +		start = reginfo->offset + i * reginfo->erasesize;
> +		printf(" %*i: %08lx ", width, i, start);
> +		if (mtd_is_locked(libmtd, mtd, fd, i) == 1)
> +			printf("RO ");
> +		else
> +			printf("   ");

I think this should be something like:

ret = mtd_is_locked()
if (ret < 0 && errno != ENOTSUPP)
	return;
if (ret == 1)
	printf("RO ");
else if (ret == 0)
	printf("   ");

> +		if (mtd_is_bad(mtd, fd, i) == 1)
> +			printf("BAD ");
> +		else
> +			printf("    ");

And similarly:

ret = mtd_is_bad()
if (ret < 0)
	return;
if (ret)
	printf("BAD ")l
else
	printf("    ");

> @@ -196,8 +235,26 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
>  	if (mtd.oob_size > 0)
>  		printf("OOB size:                       %d bytes\n",
>  		       mtd.oob_size);
> -	if (mtd.region_cnt > 0)
> +	if (mtd.region_cnt > 0) {
>  		printf("Additional erase regions:       %d\n", mtd.oob_size);
> +		if (args.node)
> +			fd = open(args.node, O_RDONLY | O_CLOEXEC);

We do want to print error message if open fails. E.g., I use -M and I do
not see any eraseblock map - because I am not root!

If open fails, we need to print something like "cannot fetch information
about regions - error blah (blah blah)". And may be we can just
continue.

> +		if (fd != -1) {
> +			int r;
> +
> +			for (r = 0; r < mtd.region_cnt; ++r) {
> +				printf(" region %i: ", r);
> +				if (mtd_regioninfo(fd, r, &reginfo) == 0) {
> +					printf(" offset: %#x size: %#x numblocks: %#x\n",
> +						reginfo.offset, reginfo.erasesize,
> +						reginfo.numblocks);
> +					if (args.map)
> +						print_map(libmtd, &mtd, fd, &reginfo);
> +				} else
> +					printf(" info is unavailable\n");
> +			}
> +		}
> +	}

OK, this is not very consistent. If we have more than one region and use
-M - we print sectors map _before_ things like "Bad blocks are allowed"
etc.

But if we have zero regions and use -M - we print the map at the very
end.

Not nice. Please, let's not call print_map here at all.


>  	if (mtd_info->sysfs_supported)
>  		printf("Character device major/minor:   %d:%d\n",
>  		       mtd.major, mtd.minor);
> @@ -225,6 +282,21 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
>  	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
>  
>  out:
> +	if (args.map && mtd.region_cnt == 0 && args.node) {
> +		if (fd == -1)
> +			fd = open(args.node, O_RDONLY | O_CLOEXEC);
> +		if (fd != -1) {
> +			reginfo.offset = 0;
> +			reginfo.erasesize = mtd.eb_size;
> +			reginfo.numblocks = mtd.eb_cnt;
> +			reginfo.regionindex = 0;
> +			print_map(libmtd, &mtd, fd, &reginfo);
> +		}
> +	}
> +
> +	if (fd != -1)
> +		close(fd);
> +

Let's print the map here for all situations, not only  mtd.region_cnt ==
0.

I'd created one functions:

int print_regions(mtd, map).

The 'map' parameter makes it also print the map. So you call this
function twice:

above:
if (mtd.region_cnt > 0
	print_regions(mtd, 0);

and here:
print_regions(mtd, 1);

Hide the file opening there. For -M if we cannot open the file - we have
to die. For just regions printing - we can continue if the file cannot
be opened.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
