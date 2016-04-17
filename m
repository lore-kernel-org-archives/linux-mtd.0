Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ariMj-0007ub-Ko
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 08:47:38 +0000
Subject: Re: [PATCH 41/42] block: do not use REQ_FLUSH for tracking flush
 support
To: mchristi@redhat.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, konrad.wilk@oracle.com,
 drbd-dev@lists.linbit.com, philipp.reisner@linbit.com,
 lars.ellenberg@linbit.com, linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 osd-dev@open-osd.org, xfs@oss.sgi.com, ocfs2-devel@oss.oracle.com
References: <1460747777-8479-1-git-send-email-mchristi@redhat.com>
 <1460747777-8479-42-git-send-email-mchristi@redhat.com>
From: Juergen Gross <kernel@pfupf.net>
Message-ID: <57134D83.8020309@pfupf.net>
Date: Sun, 17 Apr 2016 10:46:59 +0200
MIME-Version: 1.0
In-Reply-To: <1460747777-8479-42-git-send-email-mchristi@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15/04/16 21:16, mchristi@redhat.com wrote:
> From: Mike Christie <mchristi@redhat.com>
> 
> The last patch added a REQ_OP_FLUSH for request_fn drivers
> and the next patch renames REQ_FLUSH to REQ_PREFLUSH which
> will be used by file systems and make_request_fn drivers so
> they can send a write/flush combo.
> 
> This patch drops xen's use of REQ_FLUSH to track if it supports
> REQ_OP_FLUSH requests, so REQ_FLUSH can be deleted.
> 
> v7:
> - Fix feature_flush/fua use.
> 
> v6:
> - Dropped parts of patch handled by Jens's QUEUE_FLAG_WC/FUA
> patches and modified patch to check feature_flush/fua bits.
> 
> Signed-off-by: Mike Christie <mchristi@redhat.com>
> Reviewed-by: Hannes Reinecke <hare@suse.com>
> Cc: Juergen Gross <kernel@pfupf.net>

Acked-by: Juergen Gross <jgross@suse.com>


Juergen
