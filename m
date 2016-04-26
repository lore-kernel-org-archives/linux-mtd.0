Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxhJ-0004Yy-9r
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:46:18 +0000
Date: Tue, 26 Apr 2016 09:45:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Subject: Re: [RFC] Porting kernel MTD tests to user space
Message-ID: <20160426094555.5f10c4e4@bbrezillon>
In-Reply-To: <1461622409-14970-1-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 26 Apr 2016 00:13:21 +0200
Richard Weinberger <richard@nod.at> wrote:

> David was so kind and did an initial port of Linux's MTD tests to user space.
> He took most tests as-is and massaged them to work in user space using libmtd.
> In the long run the goal is giving up the kernel tests as much as possible
> and improve the tests present in mtd-utils.
> 
> Feedback is very welcome!

Oh, nice move!
I'll try to review those patches.

BTW, I agree with Artem: we should remove in-kernel tests at some point
(maybe not immediately though).

Best Regards,

Boris

> 
> Thanks,
> //richard
> 
> [PATCH 1/8] mtd-utils: Fix return status in mtd_torture test function
> [PATCH 2/8] mtd-utils: Add multi-block erase function
> [PATCH 3/8] mtd-utils: Add flash torture test utility
> [PATCH 4/8] mtd-utils: Add flash stress test Utility
> [PATCH 5/8] mtd-utils: Add flash speed test Utility
> [PATCH 6/8] mtd-utils: Add nand flash bit errors test
> [PATCH 7/8] mtd-utils: Add flash read test utility
> [PATCH 8/8] mtd-utils: Add nand page test utility
> 
>  .gitignore                  |   6 +
>  Makefile                    |   7 +-
>  include/libmtd.h            |  14 ++
>  lib/libmtd.c                |  28 ++-
>  misc-utils/flash_readtest.c | 263 ++++++++++++++++++++
>  misc-utils/flash_speed.c    | 463 +++++++++++++++++++++++++++++++++++
>  misc-utils/flash_stress.c   | 276 +++++++++++++++++++++
>  misc-utils/flash_torture.c  | 240 ++++++++++++++++++
>  nand-utils/nandbiterrs.c    | 497 +++++++++++++++++++++++++++++++++++++
>  nand-utils/nandpagetest.c   | 579 ++++++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 2362 insertions(+), 11 deletions(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
