Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTEVh-0006fa-4M
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 18:59:10 +0000
Received: by paceu11 with SMTP id eu11so21786952pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 10:58:48 -0800 (PST)
Date: Wed, 4 Mar 2015 10:58:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Nam T. Nguyen" <namnguyen@chromium.org>
Subject: Re: [PATCH v2] mtd-utils: Add nandpart to add/delete partition
Message-ID: <20150304185838.GM18140@ld-irv-0074>
References: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
Cc: vapier@chromium.org, linux-mtd@lists.infradead.org, dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 09, 2015 at 02:13:46PM -0800, Nam T. Nguyen wrote:
> Add a simple utility to exercise BLKPG ioctl.
> 
> Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
> ---
> Change from v1:
>   * Fix coding style
> 
>  Makefile   |   2 +-
>  nandpart.c | 196 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 nandpart.c
> 
> diff --git a/Makefile b/Makefile
> index eade234..712ff14 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -20,7 +20,7 @@ MTD_BINS = \
>  	ftl_format flash_erase nanddump doc_loadbios \
>  	ftl_check mkfs.jffs2 flash_lock flash_unlock \
>  	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
> -	mtd_debug flashcp nandwrite nandtest \
> +	mtd_debug flashcp nandwrite nandtest nandpart \
>  	jffs2dump \
>  	nftldump nftl_format docfdisk \
>  	rfddump rfdformat \
> diff --git a/nandpart.c b/nandpart.c
> new file mode 100644
> index 0000000..63c4cea
> --- /dev/null
> +++ b/nandpart.c
> @@ -0,0 +1,196 @@
> +/*
> + *  nandpart.c
> + *
> + *  Copyright 2015 The Chromium OS Authors.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + *  Overview:
> + *   This utility adds or removes a partition from an MTD device.
> + */
> +
> +#define PROGRAM_NAME "nandpart"
> +
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <linux/blkpg.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "common.h"
> +
> +static void display_help(int status)
> +{
> +	fprintf(status == EXIT_SUCCESS ? stdout : stderr,
> +"Usage: %1$s add MTD-device part-name start size\n"
> +"       %1$s del MTD-device part-number\n"

I feel like this help text doesn't match the other tools very well. Take
a look at nandwrite/nanddump/flash_erase/mtdinfo for examples, though
they are not all 100% consistent. (Consider capitalization, <brackets>,
etc.)

> +"Adds a partition to an MTD device, or remove an existing partition from it.\n"
> +"\n"
> +"-h         --help               Display this help and exit\n"
> +"           --version            Output version information and exit\n"
> +"\n"
> +"start location and size of the partition are in bytes. They should align on\n"
> +"eraseblock size.\n",
> +	PROGRAM_NAME
> +	);
> +	exit(status);
> +}
> +
> +static void display_version(void)
> +{
> +	printf("%1$s " VERSION "\n"
> +			"\n"
> +			"%1$s comes with NO WARRANTY\n"
> +			"to the extent permitted by law.\n"
> +			"\n"
> +			"You may redistribute copies of %1$s\n"
> +			"under the terms of the GNU General Public Licence.\n"
> +			"See the file `COPYING' for more information.\n",
> +			PROGRAM_NAME);
> +	exit(EXIT_SUCCESS);
> +}
> +
> +/* Command arguments */
> +
> +typedef enum {
> +	COMMAND_ADD,
> +	COMMAND_DEL
> +} command_type;
> +
> +static command_type		command;		/* add or del */
> +static const char		*mtddev;		/* mtd device name */
> +static const char		*part_name;		/* partition name */
> +static int			part_no;		/* partition number */
> +static long long		start_addr;		/* start address */
> +static long long		length;			/* partition size */
> +
> +static void process_options(int argc, char * const argv[])
> +{
> +	int error = 0;
> +
> +	for (;;) {
> +		int option_index = 0;
> +		static const char short_options[] = "h";
> +		static const struct option long_options[] = {
> +			{"version", no_argument, 0, 0},
> +			{"help", no_argument, 0, 'h'},
> +			{0, 0, 0, 0},
> +		};
> +
> +		int c = getopt_long(argc, argv, short_options,
> +				long_options, &option_index);
> +		if (c == EOF) {
> +			break;
> +		}
> +
> +		switch (c) {
> +			case 0:
> +				display_version();
> +				break;
> +			case 'h':
> +				display_help(EXIT_SUCCESS);
> +				break;
> +			case '?':
> +				error++;
> +				break;
> +		}
> +	}
> +
> +	if ((argc - optind) < 3 || error)
> +		display_help(EXIT_FAILURE);
> +
> +	const char *s_command = argv[optind++];
> +	mtddev = argv[optind++];
> +
> +	if (strcmp(s_command, "del") == 0 && (argc - optind) == 1) {
> +		const char *s_part_no = argv[optind++];
> +
> +		part_no = simple_strtol(s_part_no, &error);
> +		if (part_no < 0) {
> +		       errmsg_die("Can't specify negative partition number: %d",
> +				  part_no);
> +		}
> +
> +		command = COMMAND_DEL;
> +	} else if (strcmp(s_command, "add") == 0 && (argc - optind) == 3) {
> +		part_name = argv[optind++];
> +		const char *s_start = argv[optind++];
> +		const char *s_length = argv[optind++];
> +
> +		if (strlen(part_name) >= BLKPG_DEVNAMELTH)
> +			errmsg_die("Partition name (%s) should be less than %d "
> +				   "characters", part_name, BLKPG_DEVNAMELTH);

It's best not to break up error strings just for the 80-char style.

> +
> +		start_addr = simple_strtoll(s_start, &error);
> +		if (start_addr < 0)
> +		       errmsg_die("Can't specify negative start offset: %lld",
> +				  start_addr);
> +
> +		length = simple_strtoll(s_length, &error);
> +		if (length < 0)
> +		       errmsg_die("Can't specify negative length: %lld",
> +				  length);
> +
> +		command = COMMAND_ADD;
> +	} else
> +		display_help(EXIT_FAILURE);
> +
> +	if (error)
> +		display_help(EXIT_FAILURE);
> +}
> +
> +
> +/*
> + * Main program
> + */
> +int main(int argc, char * const argv[])
> +{
> +	process_options(argc, argv);
> +
> +	/* Open MTD device */
> +	int fd = open(mtddev, O_RDWR | O_CLOEXEC);

The preferred style is to put declarations at the top of the function,
not mixed with code.

> +	if (fd == -1) {

Unnecessary braces.

> +		sys_errmsg_die("Cannot open %s", mtddev);
> +	}
> +
> +	struct blkpg_partition part;

Move to top of main().

> +	memset(&part, 0, sizeof(part));
> +
> +	struct blkpg_ioctl_arg arg;

Ditto.

> +	memset(&arg, 0, sizeof(arg));
> +	arg.datalen = sizeof(part);
> +	arg.data = &part;
> +
> +	switch (command) {
> +		case COMMAND_ADD:
> +			part.start = start_addr;
> +			part.length = length;
> +			strncpy(part.devname, part_name, sizeof(part.devname));
> +			arg.op = BLKPG_ADD_PARTITION;
> +			break;
> +		case COMMAND_DEL:
> +			part.pno = part_no;
> +			arg.op = BLKPG_DEL_PARTITION;
> +			break;
> +	}
> +
> +	if (ioctl(fd, BLKPG, &arg)) {
> +		errmsg("Failed to issue BLKPG ioctl");

sys_errmsg(). Or just sys_errmsg_die(), since exit() would clean up our
resources anyway.

> +		goto closeall;
> +	}
> +
> +	close(fd);
> +
> +	/* Exit happy */
> +	return EXIT_SUCCESS;
> +
> +closeall:
> +	close(fd);
> +	exit(EXIT_FAILURE);
> +}

Brian
