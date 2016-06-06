Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9oMz-0000mz-2e
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 06:50:41 +0000
Subject: Re: [PATCH 37/45] drivers: use req op accessor
To: mchristi@redhat.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, konrad.wilk@oracle.com,
 drbd-dev@lists.linbit.com, philipp.reisner@linbit.com,
 lars.ellenberg@linbit.com, linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 osd-dev@open-osd.org, xfs@oss.sgi.com, ocfs2-devel@oss.oracle.com
References: <1465155145-10812-1-git-send-email-mchristi@redhat.com>
 <1465155145-10812-38-git-send-email-mchristi@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <57551D2B.1090707@suse.de>
Date: Mon, 6 Jun 2016 08:50:19 +0200
MIME-Version: 1.0
In-Reply-To: <1465155145-10812-38-git-send-email-mchristi@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/05/2016 09:32 PM, mchristi@redhat.com wrote:
> From: Mike Christie <mchristi@redhat.com>
> 
> The req operation REQ_OP is separated from the rq_flag_bits
> definition. This converts the block layer drivers to
> use req_op to get the op from the request struct.
> 
> Signed-off-by: Mike Christie <mchristi@redhat.com>
> ---
>  drivers/block/loop.c              |  6 +++---
>  drivers/block/mtip32xx/mtip32xx.c |  2 +-
>  drivers/block/nbd.c               |  2 +-
>  drivers/block/rbd.c               |  4 ++--
>  drivers/block/xen-blkfront.c      |  8 +++++---
>  drivers/ide/ide-floppy.c          |  2 +-
>  drivers/md/dm.c                   |  2 +-
>  drivers/mmc/card/block.c          |  7 +++----
>  drivers/mmc/card/queue.c          |  6 ++----
>  drivers/mmc/card/queue.h          |  5 ++++-
>  drivers/mtd/mtd_blkdevs.c         |  2 +-
>  drivers/nvme/host/core.c          |  2 +-
>  drivers/nvme/host/nvme.h          |  4 ++--
>  drivers/scsi/sd.c                 | 25 ++++++++++++++++---------
>  14 files changed, 43 insertions(+), 34 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		   Teamlead Storage & Networking
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: F. Imendörffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG Nürnberg)
