Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEE7f-0001Bo-0C
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 08:27:47 +0000
Message-ID: <1392366441.12215.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 14 Feb 2014 10:27:21 +0200
In-Reply-To: <1392321486-18332-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392321486-18332-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the driver Ezequiel!

A couple of nit-pick below, though.

On Thu, 2014-02-13 at 16:58 -0300, Ezequiel Garcia wrote:
> +++ b/drivers/mtd/ubi/block.c
> @@ -0,0 +1,656 @@
> +/*
> + * Copyright (c) 2014 Ezequiel Garcia
> + * Copyright (c) 2011 Free Electrons
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, version 2.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> + * the GNU General Public License for more details.
> + *
> + * A block implementation on UBI volume
> + * ------------------------------------
> + *
> + * How to use this? A bunch of examples worth a thousand words:
> + *
> + * If you want to attach a block device on bootup time, e.g. in order
> + * to mount the rootfs on such a block device:
> + *
> + * Using the UBI volume path:
> + *  ubi.block=/dev/ubi0_0
> + *
> + * Using the UBI device, and the volume name:
> + *  ubi.block=0,rootfs
> + *
> + * Using both UBI device number and UBI volume number:
> + *  ubi.block=0,0
> + *
> + * In this case you would have such kernel parameters:
> + *  ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0
> + *
> + * Of course, if you compile ubi as a module you can use this
> + * parameter on module insertion time:
> + *  modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0
> + *
> + * For runtime block attaching/detaching, see mtd-utils' ubiblkvol tool.
> + */

Good comments is a great thing, very appreciated. However, you already
put a similar piece of documentation to "MODULE_PARM_DESC()", which is a
good place, because it is visible to the end-user via 'modinfo'.

Do you think it will make users of this driver understand the the usage
model better if you duplicate the documentation here? May be, not sure.

I'd say the risk is that people modifying this driver may change this
comment, but forget to change the modinfo output, or vice-versa.

I'd refactor this comment to make it look more like a piese of doc for
the developer, explaining how this module is related to the ubi module.
Rather than being a duplicate piece of doc for the end user explaining
how to use this module...

> +/* Linked list of all ubiblock instances */
> +static LIST_HEAD(ubiblock_devices);
> +static DEFINE_MUTEX(devices_mutex);
> +static int ubiblock_major;
> +
> +/* Ugh! this parameter parsing code is awful */

If it is awful, would you also expand the comment and explain why it is
awful, and what should be done to make it nice. Or better just do it! I
mean, generally, when criticizing something it is better to explain why
and point to the alternatives, no?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
