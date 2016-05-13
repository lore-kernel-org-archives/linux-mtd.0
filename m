Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b198g-0006fJ-3X
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 09:12:06 +0000
Received: by mail-oi0-x234.google.com with SMTP id x201so161250193oif.3
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2016 02:11:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
References: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
Date: Fri, 13 May 2016 11:11:44 +0200
Message-ID: <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
Subject: Re: UBIFS automatic recovery
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Johan Borkhuis <maillist@borkhuis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 13, 2016 at 10:47 AM, Johan Borkhuis <maillist@borkhuis.com> wrote:
> However, when I continue to pull the power on a system with a broken
> partition (without running the test-application, this is only started when
> all partitions are mounted correctly) after some time (this can be a few
> reboots, or a couple of 100 reboots) the system fixes the partition
> itself, and I can access the data again, without any indications in the
> log.

This should not happen. Either the UBIFS is broken and not mountable
or it can recover.
Something else seems to interact here.

> When it fails it shows the following during a mount (also shown sometimes
> for LEB 3 and 6):
> UBIFS: recovery needed
> UBIFS error (pid 640): ubifs_recover_log_leb: unrecoverable log corruption
> in LEB 5
>
> Another UBIFS message I see during a failed mount is:
> UBIFS error (pid 637): ubifs_recover_master_node: dumping first master node
>
> As long the mount fails the same message is repeated.

UBIFS must not break due to power cuts.
So, something else is broken.
Do both MTD and UBI tests pass?

> But the first time it succeeds again I get the following output when
> mounting:
> UBIFS: recovery needed
> UBIFS: recovery completed

This is perfectly fine and only indicates that UBIFS recovered
from an unclean shutdown.
i.e. replayed the journal.

> Now my question is if there is a process in the background that fixes the
> problem. If this is the case, how can I trigger or help this process, so
> that it will fix the problem on the first time the problem is detected.
>
> Or is there another way to fix/repair a broken partition without loosing
> the data that is stored on it?

No. What you need is figuring out *why* UBIFS breaks while doing
power cuts. Both UBI and UBIFS are power cut aware by design.
In most cases UBIFS suffers from MTD problems. May it a faulty driver
or bad hardware...

-- 
Thanks,
//richard
