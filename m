Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1kwo-0005l3-H7
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 19:07:11 +0000
Received: by bwz19 with SMTP id 19so3256523bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 12:06:19 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: fix MTD_MODE_RAW writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <jon.povey@racelogic.co.uk>
In-Reply-To: <1285846894-4479-1-git-send-email-jon.povey@racelogic.co.uk>
References: <1285846894-4479-1-git-send-email-jon.povey@racelogic.co.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 22:06:15 +0300
Message-ID: <1285959975.32172.9.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-30 at 20:41 +0900, Jon Povey wrote:
> RAW writes were broken by 782ce79a45b3b850b108896fcf7da26754061c8f
> which introduced a check of ops->ooboffs in nand_do_write_ops().
> 
> When writing in RAW mode this is called with an ops struct on the stack
> of mtdchar.c:mtd_write() which does not initialise ops->ooboffs, so it
> is garbage and fails this test.
> 
> This test does not make sense if ops->oobbuf is NULL, which it is in the
> RAW write path, so include that in the test.
> 
> Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
> CC: Maxim Levitsky <maximlevitsky@gmail.com>
> CC: David Woodhouse <David.Woodhouse@intel.com>
> ---
> I am not sure this is the right way to fix this, as I don't really understand
> what the test was trying to fix/prevent.
> 
> This is really just me showing my shotgun debugging solution that seems to
> work for me, and see what people have to say about it / how to fix properly.
> 
> This was an unpleasant regression for me: I use MTD_MODE_RAW to write a
> bootloader, and this got close to being a field update bricker..

I already have something similar in my l2-mtd-2.6.git / for-2.6.36 and I
was bugging David to send it upstream.

But I've pushed your patch to the same branch and added Cc: stable
<stable@kernel.org>

But I think ideally these 2 patches should be folded into one patch.
I'll leave this for David to do and possibly decide who would be the
author of the resulting patch :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
