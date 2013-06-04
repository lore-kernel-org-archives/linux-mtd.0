Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjsQz-0007Fz-1s
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 14:42:01 +0000
Received: by mail-ie0-f173.google.com with SMTP id k13so623279iea.4
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2013 07:41:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Tue, 4 Jun 2013 11:41:39 -0300
Message-ID: <CALF0-+UMTK0jCOXqvR7LAHSFbqsFTgh8kh-wtT=FctrcHtbD_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ubi: Introduce block devices for UBI volumes
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Sat, May 18, 2013 at 11:31 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Block device emulation on top of ubi volumes with read/write support.
>
> Given UBI takes care of wear leveling and bad block management it's possible
> to add a thin layer to enable block device access to UBI volumes.
> This allows to use a block-oriented filesystem on a flash device.
>
> In a similar fashion to mtdblock, two 1-LEB size caches have been implemented:
> one for reading and one for writing.
>
> Every read and every write goes through one of these caches.
> Read requests can be satisfied through the read cache or the write cache.
> Write requests always fill the write cache (possibly flushing it).
> This fill is done through the read cache, if this is possible.
> If the requested leb is not cached, it's loaded to the associated cache.
>
> The flash device is written when the write cache is flushed on:
> * block device release (detach)
> * a different than cached leb is accessed
> * io-barrier is received through a REQ_FLUSH request
>
> By creating two caches we decouple read access from write access,
> in an effort to improve wear leveling.
>
> Despite this efforts, it's very important to remember that regular
> block-oriented filesystems have no care at all about wear leveling;
> they will access the block device randomly, only caring for performance.
> Therefore, write support should be selected only for development and
> with extreme caution.
>
> Both caches are 1-LEB bytes, vmalloced at open() and freed at release();
> in addition, each block device has a workqueue associated.
>
> Block devices are created upon user request through new ioctls:
> UBI_IOCVOLATTBLK to attach and UBI_IOCVOLDETBLK to detach.
> Also, a new UBI module parameter is added 'ubi.block'. This parameter is
> needed in order to attach a block device on boot-up time, allowing to
> mount the rootfs on a ubiblock device.
> For instance, you could have these kernel parameters:
>
>   ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0
>
> Or, if you compile ubi as a module:
>
>   $ modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0
>
> Cc: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/ubi/Kconfig     |  24 ++
>  drivers/mtd/ubi/Makefile    |   1 +
>  drivers/mtd/ubi/block.c     | 894 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/build.c     |   5 +
>  drivers/mtd/ubi/cdev.c      |  20 +
>  drivers/mtd/ubi/ubi.h       |  14 +
>  include/uapi/mtd/ubi-user.h |  11 +
>  7 files changed, 969 insertions(+)
>  create mode 100644 drivers/mtd/ubi/block.c
>

Any feedback for this?

There were several users asking for this kind of UBI block support
(Mike Frysinger being among the most recent).

So if there are no objections, and given the patch is not really intrusive
on the UBI core, I think it's safe to merge it.

-- 
    Ezequiel
