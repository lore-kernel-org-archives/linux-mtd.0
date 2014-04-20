Received: from mail-ve0-x229.google.com ([2607:f8b0:400c:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbymJ-00054L-R7
 for linux-mtd@lists.infradead.org; Sun, 20 Apr 2014 20:55:58 +0000
Received: by mail-ve0-f169.google.com with SMTP id pa12so6872237veb.28
 for <linux-mtd@lists.infradead.org>; Sun, 20 Apr 2014 13:55:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53541449.9080308@codeaurora.org>
References: <53541449.9080308@codeaurora.org>
Date: Sun, 20 Apr 2014 22:55:33 +0200
Message-ID: <CAFLxGvwTa3RMjxwONXyYwt5LGfAP1oLk906usw6-nana=MUNFQ@mail.gmail.com>
Subject: Re: UBIFS CRC error, calculated from ubifs_check_node
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Cc: Dolev Raviv <draviv@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 20, 2014 at 8:39 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> Hi All
>
> I'm hitting "UBIFS error (pid 1026): ubifs_check_node: bad CRC: calculated
> 0x79dbca01, read 0x31afb5d7" and as a result the partition is remounted as
> RO.
>
> I'm using 3.10 based kernel.
> The test scenario to reproduce this is:
> 1. fill the partition tested using dd
> 2. try to write some more data
>
> There are no errors in the log from the ubi layer or from the underlying
> nand driver, both also testing crc.
>
> I've tried disabling compression, mounting the partition as sync and issuing
> the write command with sync param. None of the former has any effect on this
> crash.
> I tried disabling crc on data nodes. This lowered the possibility of hitting
> the above error but eventually, with stress test of concurrent read and
> write we hit the same error with a different node type.
>
> Has any one encountered similar behavior? I'm not that much familiar with
> ubifs so any help will be highly apritiated!

Before we start digging into this, do mtd-tests and ubi-tests pass?

-- 
Thanks,
//richard
