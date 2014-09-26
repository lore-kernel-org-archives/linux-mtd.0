Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXSlj-0002Yj-E8
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 10:28:55 +0000
Message-ID: <1411727311.23429.54.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] ubi-utils: ubidump add libdump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 26 Sep 2014 13:28:31 +0300
In-Reply-To: <541D0B12.9050703@huawei.com>
References: <541D09C9.4080004@huawei.com> <541D0B12.9050703@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-09-20 at 13:05 +0800, hujianyang wrote:
> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
>  ubi-utils/include/libdump.h |   72 ++++++++
>  ubi-utils/libdump.c         |  414 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 486 insertions(+), 0 deletions(-)
>  create mode 100644 ubi-utils/include/libdump.h
>  create mode 100644 ubi-utils/libdump.c
> 
> diff --git a/ubi-utils/include/libdump.h b/ubi-utils/include/libdump.h
> new file mode 100644
> index 0000000..ee0ff77
> --- /dev/null
> +++ b/ubi-utils/include/libdump.h
> @@ -0,0 +1,72 @@
> +/*
> + * Copyright (c) International Business Machines Corp., 2006
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> + * the GNU General Public License for more details.
> + *
> + * Author: Hu Jianyang <hujianyang@huawei.com>

If you did not write this code, you should not add yourself as author.
Instead, please, preserve the kernel header comment as it is.

If you mad significant changes, you may add a comment about this with
the attribution to yourself.

> + *
> + * UBIFS library.
> + */

Am I right that this is almost an exact copy of the kernel header (after
'make headersinstall')?

If yes, please, add a comment telling this here, just to make sure the
reader knows that he/she is dealing with a copy, and the original is in
the kernel.

> +/*
> + * Copyright (c) International Business Machines Corp., 2006
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> + * the GNU General Public License for more details.
> + *
> + * Author: Hu Jianyang <hujianyang@huawei.com>
> + *
> + * UBIFS library.
> + */

And the same requests apply here.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
