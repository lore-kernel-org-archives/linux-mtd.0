Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWTPC-0007MV-EZ
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 18:02:06 +0000
Received: by padhy3 with SMTP id hy3so41876456pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 11:01:44 -0700 (PDT)
Date: Mon, 31 Aug 2015 11:01:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [RFC / BUG] mtd: provide proper 32/64-bit compat_ioctl() support
 for BLKPG
Message-ID: <20150831180142.GB81844@google.com>
References: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 28, 2015 at 07:12:36PM -0700, Brian Norris wrote:
> The same bug applies to block/ioctl.c

Actually I'll correct myself: it looks like block/ already has OK
compat_ioctl support for this. Block devices do a copy to/from user
space to marshal a new struct. Personally, I find my approach a little
clearer. 

> But then: which tree should it go in?

I guess since this is only an MTD bug, then it'd be fair to take via
MTD. I'll plan to do that eventually if there are no objections.

> Tested only on MTD, with an ARM32 user space on an ARM64 kernel.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/mtdchar.c      | 42 +++++++++++++++++++++++++++++++++---------
>  include/uapi/linux/blkpg.h | 10 ++++++++++
>  2 files changed, 43 insertions(+), 9 deletions(-)

I also suspect it might make more sense to move the compat definitions
to a new non-UAPI include/linux/blkpg.h. I'll probably put that in v2.

Brian
