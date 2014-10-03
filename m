Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa46l-0001lR-Ap
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 14:45:23 +0000
Message-ID: <1412347489.3795.68.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 1/4] ubi-utils: ubidump: add ubifs-media
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 03 Oct 2014 17:44:49 +0300
In-Reply-To: <542A2C57.3090401@huawei.com>
References: <542A2C57.3090401@huawei.com>
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

On Tue, 2014-09-30 at 12:06 +0800, hujianyang wrote:
> @@ -0,0 +1,298 @@
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
> + */

Hu,

probably I was not clear enough when commenting on the previous version
of your patches.

Bu this is a copy of the kernel fs/ubifs/ubifs-media.h file.I see you
stripped it down a little bit. But nevertheless, this is still a
_copy_. 

You _absolutely_ must preserve the original license and copyright.

In this patch you just threw away original license and the copyright and
put a different license and copyright. You cannot do this.

Please, preserve the original header from fs/ubifs/ubifs-media.h intact,
as it is. Do not change it.
