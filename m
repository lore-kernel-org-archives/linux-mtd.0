Received: from mx0b-00003501.pphosted.com ([67.231.152.68]
 helo=mx0a-000cda01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bV6Z7-0003jl-TY
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 00:31:15 +0000
Received: from pps.filterd (m0075034.ppops.net [127.0.0.1])
 by mx0b-00003501.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u740RTZd010496
 for <linux-mtd@lists.infradead.org>; Wed, 3 Aug 2016 20:30:51 -0400
Received: from mail-qt0-f198.google.com (mail-qt0-f198.google.com
 [209.85.216.198])
 by mx0b-00003501.pphosted.com with ESMTP id 24ktbr08uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 03 Aug 2016 20:30:51 -0400
Received: by mail-qt0-f198.google.com with SMTP id 93so386121880qtg.1
 for <linux-mtd@lists.infradead.org>; Wed, 03 Aug 2016 17:30:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fbe31f-27b3-ff7a-e381-34fc1aad337e@redhat.com>
References: <1465155145-10812-1-git-send-email-mchristi@redhat.com>
 <1465155145-10812-38-git-send-email-mchristi@redhat.com>
 <CAOxpaSUMsgfTYsL0bL6VCnwxz7bpgpKO-ZfC5J8dFG9PN-hzvg@mail.gmail.com>
 <87fbe31f-27b3-ff7a-e381-34fc1aad337e@redhat.com>
From: Shaun Tancheff <shaun.tancheff@seagate.com>
Date: Wed, 3 Aug 2016 19:30:29 -0500
Message-ID: <CAJVOszAd9Eu88P2=QoNVArd0jwDH7KRe=OB82tCNMpjfv9B4KA@mail.gmail.com>
Subject: Re: [PATCH 37/45] drivers: use req op accessor
To: Mike Christie <mchristi@redhat.com>
Cc: Ross Zwisler <zwisler@gmail.com>,
 Ross Zwisler <ross.zwisler@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, Jens Axboe <axboe@fb.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4 <linux-ext4@vger.kernel.org>, konrad.wilk@oracle.com,
 drbd-dev@lists.linbit.com, philipp.reisner@linbit.com,
 lars.ellenberg@linbit.com, linux-raid@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, osd-dev@open-osd.org,
 XFS Developers <xfs@oss.sgi.com>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 3, 2016 at 6:47 PM, Mike Christie <mchristi@redhat.com> wrote:
> On 08/03/2016 05:33 PM, Ross Zwisler wrote:
>> On Sun, Jun 5, 2016 at 1:32 PM,  <mchristi@redhat.com> wrote:
>>> From: Mike Christie <mchristi@redhat.com>
>>>
>>> The req operation REQ_OP is separated from the rq_flag_bits
>>> definition. This converts the block layer drivers to
>>> use req_op to get the op from the request struct.
>>>
>>> Signed-off-by: Mike Christie <mchristi@redhat.com>
>>> ---
>>>  drivers/block/loop.c              |  6 +++---
>>>  drivers/block/mtip32xx/mtip32xx.c |  2 +-
>>>  drivers/block/nbd.c               |  2 +-
>>>  drivers/block/rbd.c               |  4 ++--
>>>  drivers/block/xen-blkfront.c      |  8 +++++---
>>>  drivers/ide/ide-floppy.c          |  2 +-
>>>  drivers/md/dm.c                   |  2 +-
>>>  drivers/mmc/card/block.c          |  7 +++----
>>>  drivers/mmc/card/queue.c          |  6 ++----
>>
>> Dave Chinner reported a deadlock with XFS + DAX, which I reproduced
>> and bisected to this commit:
>>
>> commit c2df40dfb8c015211ec55f4b1dd0587f875c7b34
>> Author: Mike Christie <mchristi@redhat.com>
>> Date:   Sun Jun 5 14:32:17 2016 -0500
>> drivers: use req op accessor
>>
>> Here are the steps to reproduce the deadlock with a BRD ramdisk:
>>
>> mkfs.xfs -f /dev/ram0
>> mount -o dax /dev/ram0 /mnt/scratch
>
> When using ramdisks, we need the attached patch like in your other bug
> report. I think it will fix some hangs people are seeing.
>
> I do not think that it should cause the failure to run issue you saw
> when doing generic/008 and ext2.
>

I think the translation in loop.c is suspicious here:

    "if use DIO && not (a flush_flag or discard_flag)"
should translate to:
    "if use DIO && not ((a flush_flag) || op == discard)"

But in the patch I read:
    "if use DIO && ((not a flush_flag) || op == discard)

Which would have DIO && discards follow the AIO path?

So I would humbly suggest something like the following
    (on top of commit c2df40dfb8c015211ec55f4b1dd0587f875c7b34):
[Please excuse the messed up patch format ... gmail eats tabs]

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index b9b737c..0754d83 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1659,8 +1659,9 @@ static int loop_queue_rq(struct blk_mq_hw_ctx *hctx,
        if (lo->lo_state != Lo_bound)
                return -EIO;

-       if (lo->use_dio && (!(cmd->rq->cmd_flags & REQ_FLUSH) ||
-           req_op(cmd->rq) == REQ_OP_DISCARD))
+       if (lo->use_dio && !(
+           (cmd->rq->cmd_flags & REQ_FLUSH) ||
+            req_op(cmd->rq) == REQ_OP_DISCARD))
                cmd->use_aio = true;
        else
                cmd->use_aio = false;

-- 
Shaun Tancheff
