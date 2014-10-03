Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa4FF-0006nZ-El
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 14:54:09 +0000
Message-ID: <1412348025.3795.73.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 2/4] ubi-utils: ubidump: add libdump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 03 Oct 2014 17:53:45 +0300
In-Reply-To: <542A2CBE.1050304@huawei.com>
References: <542A2C57.3090401@huawei.com> <542A2CBE.1050304@huawei.com>
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

A small nit-pick.

On Tue, 2014-09-30 at 12:08 +0800, hujianyang wrote:
> +#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
> +#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
> +
> +#define min_t(t,x,y) ({ \
> +	typeof((x)) _x = (x); \
> +	typeof((y)) _y = (y); \
> +	(_x < _y) ? _x : _y; \
> +})

These ones do not look like they are in any way specific to the UBI
dumping library.

In fact, we already have these in mkfs.ubifs/defs.h, which is also not
very good.

Would you please instead use "include/common.h". Put the ALIGN and min_t
definitions there, and include that file from "libdump.h"?

As a completely independent patch, you could also clean things up by
removing the definitions from 'mkfs.ubifs/defs.h' and using
'include/common.h' in mkfs.ubifs too.
