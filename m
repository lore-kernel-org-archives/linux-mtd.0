Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1Ns-0000Ii-97
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:00:14 +0000
Date: Thu, 6 Sep 2018 22:59:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/3] Virtual MTD concat device driver
Message-ID: <20180906225949.48497cb5@bbrezillon>
In-Reply-To: <20180906161413.6335-1-kernel@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
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

Hi Bernhard,

On Thu,  6 Sep 2018 18:14:10 +0200
Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:

> Hi everybody,
> 
> when porting my router board from a mach-file based OpenWRT target to a
> device-tree based target, I found that there is no generic way to create
> a mtd_concat device from within the dts. The following patches attempt
> to provide that possibility.

There's a fundamental issue with this patch series: DT is supposed to
represent the hardware, not how you want to use it, and clearly, your
concatenated MTD dev is a virtual device, not a real one, so I doubt it
will pass DT maintainers' review.

> 
> According to [1], patches should be provided in a git tree if possible,
> but to me it was a bit unclear whether repositories outside of
> git.infradead.org are also acceptable. If this is the case, the changes
> can be pulled from branch 'mtd_concat' at [2] (web view at [3]. The
> commits are based on mtd/next even though the repository says forked
> from torvalds/linux). In addition I'm sending the patches to the mailing
> list.
> 
> Thanks for your feedback!
> 
> Best regards
> Bernhard Frauendienst
> 
> PS: This is my first submission to this mailing list and the linux
> kernel in general. I've tried to meet all requirements, but please
> let me know if I have made any rookie mistakes.

Congrats (and welcome)! From a process PoV you did a good job. You
just miss a commit message in patch 2, and you forgot to Cc the DT
maintainers, the DT ML and the MTD maintainers. Other than that, the
coding style looks good, and the code itself looks clean.

Regards,

Boris

> 
> [1] http://www.linux-mtd.infradead.org/source.html
> [2] https://github.com/oxc/linux.git
> [3] https://github.com/oxc/linux/commits/mtd_concat
> 
> 
> Bernhard Frauendienst (3):
>   mtd: core: add get_mtd_device_by_node
>   dt-bindings: add bindings for mtd-concat devices
>   mtd: mtdconcat: add dt driver for concat devices
> 
>  .../devicetree/bindings/mtd/mtd-concat.txt    |  21 +++
>  drivers/mtd/Kconfig                           |   2 +
>  drivers/mtd/Makefile                          |   3 +
>  drivers/mtd/composite/Kconfig                 |  12 ++
>  drivers/mtd/composite/Makefile                |   7 +
>  drivers/mtd/composite/virt_concat.c           | 123 ++++++++++++++++++
>  drivers/mtd/mtdcore.c                         |  39 ++++++
>  include/linux/mtd/mtd.h                       |   2 +
>  8 files changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt
>  create mode 100644 drivers/mtd/composite/Kconfig
>  create mode 100644 drivers/mtd/composite/Makefile
>  create mode 100644 drivers/mtd/composite/virt_concat.c
> 
