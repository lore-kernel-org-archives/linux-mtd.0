Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLIkV-0000Gt-Ty
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 21:53:40 +0000
Message-ID: <54DA7D3F.9060306@imgtec.com>
Date: Tue, 10 Feb 2015 18:50:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>, <linux-mtd@lists.infradead.org>,
 <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtdpart: More flexible dynamic partitioning
References: <1423162081-1734-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1423162081-1734-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: namnguyen@chromium.org, grundler@chromium.org, gwendal@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/05/2015 03:48 PM, Dan Ehrenberg wrote:
> MTD allows dynamic partitioning by the BLKPG ioctl.
> This patch makes dynamic partitioning more flexible by:
> - Allowing addition of a partition to be added on top of another
>   partition. The two partitions compose naturally: the offsets are added
>   and lengths are checked to be in bounds. This is useful when
>   repartitioning an existing partitioned device since the underlying
>   device doesn't exist to add partitions to.

IMHO, this explanation is not that clear. In particular "Allowing
addition of a partition to be added on top of another partition"
looks odd to me.

Maybe you can say something like: "The current code restricts partition
dynamic addition to work only on the master MTD device. This doesn't
make a lot of sense, and is impossible to meet if the device is already
partitioned (since the master MTD device is not visible). This commit
removes the restriction."

> - Removing overlap checks for dynamic partitions. I don't see any
>   particular reason why overlapping dynamic partitions should be
>   prohibited while static partitions are allowed to overlap freely, and
>   this is useful for users who want one additional partition to span
>   over the whole device.

Makes sense.

> - Allowing partitions to be deleted by referencing any partition with
>   the same master. For example, if you have /dev/mtd0 and /dev/mtd1 both
>   partitions on the same underlying device, then you can call
>   BLKPG_DEL_PARTITION with an fd of /dev/mtd0 and pno of /dev/mtd1, and
>   /dev/mtd1 will be deleted (as opposed to returning EINVAL to signal a
>   missing partition, which it did previously).
> 

Should we split this in two or three patches? Don't have a strong opinion.
-- 
Ezequiel
