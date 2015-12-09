Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6jRP-0004gC-CH
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 18:26:15 +0000
Received: by pacwq6 with SMTP id wq6so33420871pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 10:25:54 -0800 (PST)
Date: Wed, 9 Dec 2015 10:25:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 0/6] mtd: partitions: support cleanup callback for
 parsers
Message-ID: <20151209182552.GA144338@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 03:25:12PM -0800, Brian Norris wrote:
> Hi,
> 
> Here's v2, which should address the comments made on v1.
> 
> Currently, we assume that all of the resources used by partition parsers can be
> cleaned up with a single kfree(), but that can be burdensome to work around.
> This series (particularly, patch 6) supports a cleanup() callback for parsers.
> 
> v1 -> v2:
>  * add "mtd_partitions" struct to hold info about the array of parsed partitions
>  * const-ify some arguments, which requires some small refactoring of the
>    existing partitions parsers
>  * remove the kmemdup() in mtd_device_parse_register()
>  * provide default cleanup routine for parsers that don't have one (all
>    parsers, ATM)
>  * put more common logic in mtd_part_parser_cleanup(), to avoid making the
>    caller worry about some of the reference counting
>  * (hopefully) less convoluted error handling in mtd_device_parse_register()
> 
> Brian
> 
> Brian Norris (6):
>   mtd: ofpart: assign return argument exactly once
>   mtd: partitions: make parsers return 'const' partition arrays
>   mtd: partitions: rename MTD parser get/put
>   mtd: partitions: remove kmemdup()
>   mtd: partitions: pass around 'mtd_partitions' wrapper struct

Pushed patch 1-5 to l2-mtd.git.

>   mtd: partitions: support a cleanup callback for parsers

Sent v3 of patch 6, with a small change.

Brian

> 
>  drivers/mtd/afs.c              |  2 +-
>  drivers/mtd/ar7part.c          |  2 +-
>  drivers/mtd/bcm47xxpart.c      |  2 +-
>  drivers/mtd/bcm63xxpart.c      |  2 +-
>  drivers/mtd/cmdlinepart.c      |  2 +-
>  drivers/mtd/mtdcore.c          | 39 +++++++++++++++-------------
>  drivers/mtd/mtdcore.h          |  7 ++++-
>  drivers/mtd/mtdpart.c          | 59 +++++++++++++++++++++++++++++++++---------
>  drivers/mtd/ofpart.c           | 39 +++++++++++++++-------------
>  drivers/mtd/redboot.c          |  2 +-
>  include/linux/mtd/partitions.h | 10 ++++++-
>  11 files changed, 110 insertions(+), 56 deletions(-)
> 
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
