Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEkRX-0002f1-Ce
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 15:44:52 +0000
Received: by iyb39 with SMTP id 39so751232iyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 08:44:49 -0700 (PDT)
Date: Tue, 26 Apr 2011 08:44:38 -0700
Subject: Re: ubiformat: libmt error (side effect from last Large Buffer
	Allocations patch)
From: Grant Erickson <marathon96@gmail.com>
To: <dedekind1@gmail.com>,
	Stefano Babic <sbabic@denx.de>
Message-ID: <C9DC3676.28755%marathon96@gmail.com>
In-Reply-To: <1303807043.2778.45.camel@localhost>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bastian Ruppert <bastian.ruppert@sewerin.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/26/11 1:37 AM, Artem Bityutskiy wrote:
> On Tue, 2011-04-26 at 08:56 +0200, Stefano Babic wrote:
>> I have seen a side effect introduced with Grant's patch. I have applied
>> the patchset and this fix the allocation problem in kernel.
> 
> I think it would be great to actually CC grant :-) So, this e-mail is
> about this patch:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/034818.html
> 
> Grant, the original e-mail from Stefano:
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/035190.html
> 
>> However, the result lenght can be an odd multiple of the minimum I/O
>> size, and when there is not enough memory available, the introduced
>> mtd_malloc_up_to_size() tries to allocate half the amount of requested
>> size, getting a buffer not aligned with the minimum I/O size. The result
>> is that the test in nand_base.c for the alignment fails:
> 
> Good catch! Shame on me to not foresee this issue. Thanks for reporting!
> 
>> IMHO mtd_malloc_up_to_size() must allocate a buffer aligned with the
>> minimum I/O size. What about adding the I/O size as parameter to
>> mtd_malloc_up_to_size, so the function will return always an aligned
>> buffer ?
> 
> Yes, I think this is the right solution. I've cooked the following
> patch, compile-tested only - please review and test.
> 
> 
> From 18d93dac176025defd5711b429acd91ef8563a9a Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Tue, 26 Apr 2011 11:42:10 +0300
> Subject: [PATCH] mtd: a fix candidate for mtd_kmalloc_up_to

Artem:

Thanks for adding me to the thread. Agree that the proposed patch seems like
a good solution.

Best,

Grant
