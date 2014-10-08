Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbiAU-0002gN-GE
 for linux-mtd@lists.infradead.org; Wed, 08 Oct 2014 03:44:03 +0000
Message-ID: <5434B2CA.4010607@huawei.com>
Date: Wed, 8 Oct 2014 11:43:06 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v4 1/4] ubi-utils: ubidump: add ubifs-media
References: <542A2C57.3090401@huawei.com>
 <1412347489.3795.68.camel@sauron.fi.intel.com>
In-Reply-To: <1412347489.3795.68.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On 2014/10/3 22:44, Artem Bityutskiy wrote:
> On Tue, 2014-09-30 at 12:06 +0800, hujianyang wrote:
>> @@ -0,0 +1,298 @@
>> +/*
>> + * Copyright (c) International Business Machines Corp., 2006
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>> + * the GNU General Public License for more details.
>> + */
> 
> Hu,
> 
> probably I was not clear enough when commenting on the previous version
> of your patches.
> 
> Bu this is a copy of the kernel fs/ubifs/ubifs-media.h file.I see you
> stripped it down a little bit. But nevertheless, this is still a
> _copy_. 
> 
> You _absolutely_ must preserve the original license and copyright.
> 
> In this patch you just threw away original license and the copyright and
> put a different license and copyright. You cannot do this.
> 
> Please, preserve the original header from fs/ubifs/ubifs-media.h intact,
> as it is. Do not change it.
> 
> 
> .
> 

Oh, I'm sorry!

I used to think I've copied the whole copyright from fs/ubifs/ubifs-media.h.
Maybe I copied it from a wrong file.. Sorry for that, I should be more
careful.

I'll first moving "ALIGN" and "min_t" to common.h and then resend these
patches.
