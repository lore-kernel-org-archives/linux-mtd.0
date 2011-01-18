Received: from mail-fx0-f67.google.com ([209.85.161.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf9BW-0007wL-Hx
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 10:53:15 +0000
Received: by fxm17 with SMTP id 17so2541828fxm.6
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 02:53:07 -0800 (PST)
Subject: Re: [PATCH 2/2] Add new tuneubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1295341465-2468-3-git-send-email-stefani@seibold.net>
References: <1295341465-2468-1-git-send-email-stefani@seibold.net>
	<1295341465-2468-3-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 12:53:04 +0200
Message-ID: <1295347984.2470.124.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 10:04 +0100, stefani@seibold.net wrote:
> +/*
> + * Copyright (C) 2007, 2008, 2010 Nokia Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; if not, write to the Free Software Foundation, Inc., 51
> + * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
> + */
> +
> +/*
> + * An utility to tune a UBI filesystem.
> + *
> + * Author: Stefani Seibold <stefani@seibold.net>
> + *         in order of NSN Nokia Siemens Networks Ulm/Germany
> + *         based on work by Artem Bityutskiy
> + *
> + */
> +
> +#define PROGRAM_VERSION "0.4"
> +#define PROGRAM_NAME "tuneubifs"
> +
> +#define _GNU_SOURCE
> +#define _LARGEFILE64_SOURCE
> +#include <getopt.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <stdint.h>
> +#include <endian.h>
> +#include <byteswap.h>
> +#include <linux/types.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +
> +#include <libubi.h>
> +#include <crc32.h>
> +#include "common.h"
> +#include "ubiutils-common.h"
> +#include "ubifs-media.h"
> +#include "defs.h"
> +
> +static void *super_buf;
> +struct ubi_dev_info dev_info;
> +
> +/* The variables below are set by command line arguments */
> +struct args {
> +	int devn;
> +	int vol_id;
> +	const char *node;
> +	const char *vol_name;
> +	int compr;
> +	long long reserved;
> +	int verbose;
> +};
> +
> +static struct args args = {
> +	.vol_id = -1,
> +	.devn = -1,
> +	.node = NULL,
> +	.vol_name = NULL,
> +	.compr = -1,
> +	.reserved = -1,
> +	.verbose = 0,
> +};
> +
> +static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
> +			 " - a tool for UBI filesystem tuning.";
> +
> +static const char optionsstr[] =
> +"-d, --devn=<UBI device number>  UBI device number to tune\n"
> +"-n, --vol_id=<volume ID>        ID of UBI volume to tune\n"

These two options should go away. In the past, all UBI utils had these
options, and we had something like you did:

sprintf(devname, "/dev/ubi%d_%d", args.devn, args.vol_id);

which is wrong because the character device name may be anything, users
can name them, say, as

/dev/ubi_rootfs
/dev/ubi_home

etc. It is up to the user and his udev rules and we should not force
users to use /dev/ubiX_Y naming.

I think we fixed all utilities at some point and now just specifying the
volume character device should be enough.

So please, let's kill these 2 options. We have 'ubi_get_dev_info()'
which will give you devn and voli_id by the character device. This
should be easy to change and should make the code smaller and simpler.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
