Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXSox-00053W-2c
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 10:32:16 +0000
Message-ID: <1411727510.23429.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] ubi-utils: introduce ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 26 Sep 2014 13:31:50 +0300
In-Reply-To: <541D0BD2.9080908@huawei.com>
References: <541D09C9.4080004@huawei.com> <541D0BD2.9080908@huawei.com>
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

On Sat, 2014-09-20 at 13:08 +0800, hujianyang wrote:
> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
>  ubi-utils/ubidump.c |  217 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 217 insertions(+), 0 deletions(-)
>  create mode 100644 ubi-utils/ubidump.c
> 
> diff --git a/ubi-utils/ubidump.c b/ubi-utils/ubidump.c
> new file mode 100644
> index 0000000..d96d7fb
> --- /dev/null
> +++ b/ubi-utils/ubidump.c
> @@ -0,0 +1,217 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> + * the GNU General Public License for more details.
> + */
> +
> +/*
> + * An utility to dump UBI/UBIFS format data in eraseblock
> + *
> + * Author: Hu Jianyang <hujianyang@huawei.com>
> + */

If what you did was you took and existing tool, and stripped it down,
and add few things, you should preserve the original copyright. And you
can also add your own copyright too, for the changes you made.


-- 
Best Regards,
Artem Bityutskiy
