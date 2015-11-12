Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwz2s-00075N-IT
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 21:04:40 +0000
Received: by pacdm15 with SMTP id dm15so75883696pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 13:04:17 -0800 (PST)
Date: Thu, 12 Nov 2015 13:04:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand: add nandflipbits tool
Message-ID: <20151112210414.GF8456@google.com>
References: <1417094958-20360-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417094958-20360-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Nov 27, 2014 at 02:29:18PM +0100, Boris Brezillon wrote:

^^ This patch hasn't quite reached its anniversary! Sorry :(

> The nandflipbits tool is intended to be used when one need to flip one or
> several specific bits on a NAND media.
> It can be useful to manually recover from an unexpected bit flip on a flash
> device, though the main purpose of this tool is to provide a way to test
> ECC algorithms robustness.
> 
> One typical example I used this tool for is testing HW ECC engines behavior
> when bitflips occur in an erased page: most HW engines do not correctly
> handle this case, because, most of the time, ECC bits generated for an
> empty page are not all 1s, and, empty page detection embedded in such
> engines is only validating that all bits are set to 1s (which is not true
> when a bit-flip has occurred).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  Makefile       |   2 +-
>  nandflipbits.c | 332 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

If you're going to resubmit this, please move it to nand-utils now. Or
would it be tests/?

>  2 files changed, 333 insertions(+), 1 deletion(-)
>  create mode 100644 nandflipbits.c
> 
> diff --git a/Makefile b/Makefile
> index eade234..55252f8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -20,7 +20,7 @@ MTD_BINS = \
>  	ftl_format flash_erase nanddump doc_loadbios \
>  	ftl_check mkfs.jffs2 flash_lock flash_unlock \
>  	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
> -	mtd_debug flashcp nandwrite nandtest \
> +	mtd_debug flashcp nandwrite nandtest nandflipbits \
>  	jffs2dump \
>  	nftldump nftl_format docfdisk \
>  	rfddump rfdformat \
> diff --git a/nandflipbits.c b/nandflipbits.c
> new file mode 100644
> index 0000000..9ec39cf
> --- /dev/null
> +++ b/nandflipbits.c
> @@ -0,0 +1,332 @@
> +/*
> + *  nandflipbits.c
> + *
> + *  Copyright (C) 2014 Free Electrons
> + *
> + *  Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Overview:
> + *   This utility manually flip specified bits in a NAND flash.

s/flip/flips/

> + *
> + */
> +
> +#define PROGRAM_NAME "nandwrite"

s/nandwrite/nandflipbits/

> +
> +#include <ctype.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>

Don't need this header? I bet you copied this from nandwrite, which also
probably doesn't need it.

> +#include <unistd.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +#include <getopt.h>
> +
> +#include <asm/types.h>
> +#include "mtd/mtd-user.h"
> +#include "common.h"
> +#include <libmtd.h>
> +
> +struct bit_flip {
> +	int block;
> +	off_t offset;
> +	int bit;
> +	bool done;
> +};
> +
> +static void display_help(int status)
> +{
> +	fprintf(status == EXIT_SUCCESS ? stdout : stderr,
> +"Usage: nandflipbits [OPTION] MTD_DEVICE <bit>@<address>[:<bit>@<address>]\n"

Why is the ':' separation chosen? Couldn't we just take extra args
(i.e., separated by ' ')? That might make the parsing a bit simpler too,
since you could just use argc to determine how many 'bit_flip's to
allocate.

> +"Writes to the specified MTD device.\n"

I have a few more related comments later on, but it seems like this help
text deserves a bit more substance. The minimal comment at the top of
the file is already more helpful than this text :) e.g.:

 1) What does this do? It does more than "write to the specified MTD
 device"...
 2) It requires RAW support, and not every driver implements this
 correctly
 3) It may not leave a block in a great state, if you're trying to flip
 bits in an erased block on a NOP=1 device, for testing purposes.
 4) What is it really *intended* for? e.g., testing the ECC engine to
 see if it matches the specified correction strength

Random thought related to #4: perhaps a simple test or two could be
derived from this. e.g., this could begin to replace
drivers/mtd/tests/nandbiterrs.c, I think.

> +"\n"
> +"  -o, --oob               Provided addresses take OOB area into account\n"
> +"  -q, --quiet             Don't display progress messages\n"
> +"  -h, --help              Display this help and exit\n"
> +"      --version           Output version information and exit\n"
> +	);
> +	exit(status);
> +}
> +
> +static void display_version(void)
> +{
> +	printf("%1$s " VERSION "\n"
> +			"\n"
> +			"Copyright (C) 2014 Free Electrons \n"
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
> +static const char	*mtd_device;
> +static bool		quiet = false;
> +static bool		oob_mode = false;
> +static struct bit_flip	*bits_to_flip;
> +static int		nbits_to_flip = 0;
> +
> +static void process_options(int argc, char * const argv[])
> +{
> +	char *bits_to_flip_iter;
> +	int bit_idx = 0;
> +	int error = 0;
> +
> +	for (;;) {
> +		int option_index = 0;
> +		static const char short_options[] = "hoq";
> +		static const struct option long_options[] = {
> +			/* Order of these args with val==0 matters; see option_index. */
> +			{"version", no_argument, 0, 0},

I see you're borrowing this from nanddump/nandwrite, but it seems kinda
hacky to rely on this being the first entry. Maybe you can put 'v' in
the 4th field, so we can just have a 'case 'v':' below, even if we don't
want to give it a shortopt of -v?

> +			{"help", no_argument, 0, 'h'},
> +			{"oob", no_argument, 0, 'o'},
> +			{"quiet", no_argument, 0, 'q'},
> +			{0, 0, 0, 0},
> +		};
> +
> +		int c = getopt_long(argc, argv, short_options,
> +				long_options, &option_index);
> +		if (c == EOF)
> +			break;
> +
> +		switch (c) {
> +		case 0:

^^ Then this could be a case 'v' instead.

> +			if (!option_index) {

Or if we don't do that, it might be clearer to say:

			if (option_index == 0)

To show that the value '0' means something more than just "nothing" (as
in, NULL checking).

> +				display_version();
> +				break;
> +			}
> +			break;
> +		case 'q':
> +			quiet = true;
> +			break;
> +		case 'o':
> +			oob_mode = true;
> +			break;
> +		case 'h':
> +			display_help(EXIT_SUCCESS);
> +			break;
> +		case '?':

Maybe put 'default:' here too, just in case we get some of the options
flags wrong in the future? e.g., we add to short_options[] and/or
long_options[] but forget to handle it in the switch/case?

> +			error++;
> +			break;
> +		}
> +	}
> +
> +	argc -= optind;
> +	argv += optind;
> +
> +	/*
> +	 * There must be at least the MTD device node path argument remaining
> +	 * and the 'bits-to-flip' description.
> +	 */
> +
> +	if (argc != 2 || error)
> +		display_help(EXIT_FAILURE);
> +
> +	mtd_device = argv[0];
> +	bits_to_flip_iter = argv[1];
> +	do {
> +		nbits_to_flip++;
> +		bits_to_flip_iter = strstr(bits_to_flip_iter, ":");
> +		if (bits_to_flip_iter)
> +			bits_to_flip_iter++;
> +	} while (bits_to_flip_iter);

If you change the argument input to avoid the ':' separation, you don't
need this loop. You can just compute the following xmalloc() size using
argc.

> +
> +	bits_to_flip = xmalloc(sizeof(*bits_to_flip) * nbits_to_flip);
> +	bits_to_flip_iter = argv[1];
> +
> +	do {

And then this would be a for loop, not a do-while.

> +		struct bit_flip	*bit_to_flip = &bits_to_flip[bit_idx++];
> +
> +		bit_to_flip->bit = strtol(bits_to_flip_iter,
> +					  &bits_to_flip_iter, 0);
> +		if (errno || bit_to_flip->bit > 7)

Hmm, is it valid to check errno before checking the return value? That's
not how I read the man page at least.

Once this is a loop over argv[], it should be pretty easy to use
strsep(arg, "@") and then simple_strtol() on each half. Makes the error
handling a bit simpler and more obvious, I think.

> +			goto err_invalid_bit_desc;
> +
> +		if (!bits_to_flip_iter || *bits_to_flip_iter++ != '@')
> +			goto err_invalid_bit_desc;
> +
> +		bit_to_flip->offset = strtol(bits_to_flip_iter,
> +					     &bits_to_flip_iter, 0);
> +
> +		if (!bits_to_flip_iter || errno)
> +			goto err_invalid_bit_desc;
> +
> +		bits_to_flip_iter = strstr(bits_to_flip_iter, ":");
> +		if (bits_to_flip_iter)
> +			bits_to_flip_iter++;
> +	} while (bits_to_flip_iter);
> +
> +	return;
> +
> +err_invalid_bit_desc:
> +	fprintf(stderr, "Invalid bit description\n");
> +	exit(EXIT_FAILURE);
> +}

Blank line here?

> +int main(int argc, char **argv)
> +{
> +	libmtd_t mtd_desc;
> +	struct mtd_dev_info mtd;
> +	int pagelen;
> +	int pages_per_blk;
> +	size_t blklen;
> +	long long mtdlen;
> +	int fd;
> +	int ret;
> +	uint8_t *buffer;
> +	int i;
> +
> +	process_options(argc, argv);
> +
> +	/* Open the device */
> +	if ((fd = open(mtd_device, O_RDWR)) == -1)
> +		sys_errmsg_die("%s", mtd_device);
> +
> +	mtd_desc = libmtd_open();
> +	if (!mtd_desc)
> +		errmsg_die("can't initialize libmtd");
> +
> +	ret = ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW);
> +	if (ret) {
> +		printf("Failed to set MTD in raw access mode\n");
> +		return -errno;
> +	}
> +
> +	/* Fill in MTD device capability structure */
> +	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
> +		errmsg_die("mtd_get_dev_info failed");
> +
> +	/* Select OOB write mode */
> +	ret = ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW);

Why do you need to do this twice?

Also, would this be helpful to add this to libmtd? We could do the
following error handling in one place (to handle for
nanddump/nandwrite/nandflipbits).

> +	if (ret) {
> +		switch (errno) {
> +		case ENOTTY:
> +			errmsg_die("ioctl MTDFILEMODE is missing");
> +		default:
> +			sys_errmsg_die("MTDFILEMODE");
> +		}
> +	}
> +
> +	pagelen = mtd.min_io_size + (oob_mode ? mtd.oob_size : 0);
> +	pages_per_blk = mtd.eb_size / mtd.min_io_size;
> +	blklen = pages_per_blk * pagelen;
> +	mtdlen = blklen * mtd.eb_cnt;
> +	buffer = xmalloc((mtd.min_io_size + mtd.oob_size) * pages_per_blk);
> +
> +	for (i = 0; i < nbits_to_flip; i++) {
> +		int page;
> +
> +		if (bits_to_flip[i].offset >= mtdlen)
> +			errmsg_die("Invalid bit offset");
> +
> +		bits_to_flip[i].block = bits_to_flip[i].offset / blklen;
> +		bits_to_flip[i].offset %= blklen;
> +		page = bits_to_flip[i].offset / pagelen;
> +		bits_to_flip[i].offset = (page *
> +					  (mtd.min_io_size + mtd.oob_size)) +
> +					 (bits_to_flip[i].offset % pagelen);
> +
> +	}
> +
> +	while (1) {
> +		struct bit_flip	*bit_to_flip = NULL;
> +		int blkoffs;
> +		int bufoffs;
> +
> +		for (i = 0; i < nbits_to_flip; i++) {
> +			if (bits_to_flip[i].done == false) {
> +				bit_to_flip = &bits_to_flip[i];
> +				break;
> +			}
> +		}
> +
> +		if (!bit_to_flip)
> +			break;
> +
> +		blkoffs = 0;
> +		bufoffs = 0;
> +		for (i = 0; i < pages_per_blk; i++) {
> +			ret = mtd_read(&mtd, fd, bit_to_flip->block, blkoffs,
> +				       buffer + bufoffs, mtd.min_io_size);
> +			if (ret) {
> +				sys_errmsg("%s: MTD Read failure", mtd_device);
> +				goto closeall;
> +			}
> +
> +			bufoffs += mtd.min_io_size;
> +
> +			ret = mtd_read_oob(mtd_desc, &mtd, fd, blkoffs,
> +					   mtd.oob_size, buffer + bufoffs);
> +			if (ret) {
> +				sys_errmsg("%s: MTD Read OOB failure", mtd_device);
> +				goto closeall;
> +			}
> +
> +			bufoffs += mtd.oob_size;
> +			blkoffs += mtd.min_io_size;
> +		}
> +
> +		for (i = 0; i < nbits_to_flip; i++) {
> +			unsigned char val, mask;
> +
> +			if (bits_to_flip[i].block != bit_to_flip->block)
> +				continue;
> +
> +			mask = 1 << bits_to_flip[i].bit;
> +			val = buffer[bits_to_flip[i].offset] & mask;
> +			if (val)
> +				buffer[bits_to_flip[i].offset] &= ~mask;
> +			else
> +				buffer[bits_to_flip[i].offset] |= mask;
> +		}
> +
> +		ret = mtd_erase(mtd_desc, &mtd, fd, bit_to_flip->block);
> +		if (ret) {
> +			sys_errmsg("%s: MTD Erase failure", mtd_device);
> +			goto closeall;
> +		}
> +
> +		blkoffs = 0;
> +		bufoffs = 0;
> +		for (i = 0; i < pages_per_blk; i++) {
> +			ret = mtd_write(mtd_desc, &mtd, fd, bit_to_flip->block,
> +					blkoffs, buffer + bufoffs, mtd.min_io_size,
> +					buffer + bufoffs + mtd.min_io_size,
> +					mtd.oob_size,
> +					MTD_OPS_RAW);

How effective is this in practice? You're doing a read/modify/write on
the whole block, and that seems a bit error prone if you assume it can
still allow, e.g., further writes to an MLC/NOP=1 device when you're
flipping an erased block.

Perhaps the caveats should be better documented in the help message.
Don't want people getting the wrong idea about this tool.

Regards,
Brian

> +			if (ret) {
> +				sys_errmsg("%s: MTD Write failure", mtd_device);
> +				goto closeall;
> +			}
> +
> +			blkoffs += mtd.min_io_size;
> +			bufoffs += mtd.min_io_size + mtd.oob_size;
> +		}
> +
> +		for (i = 0; i < nbits_to_flip; i++) {
> +			if (bits_to_flip[i].block == bit_to_flip->block)
> +				bits_to_flip[i].done = true;
> +		}
> +	}
> +
> +	return 0;
> +
> +closeall:
> +	libmtd_close(mtd_desc);
> +	close(fd);
> +	free(buffer);
> +	exit(EXIT_FAILURE);
> +}
> -- 
> 1.9.1
> 
