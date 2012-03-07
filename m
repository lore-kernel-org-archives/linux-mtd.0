Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5JlX-0001JB-VX
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:31:04 +0000
Message-ID: <1331138007.3463.16.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Wed, 07 Mar 2012 18:33:27 +0200
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just basic questions to make sure I understand things correctly.

Do you have plans to also change the user-space tools?

On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
> 1) A primary checkpoint block, which contains merily a pointer to the
>    erase block(s) which hold the real checkpointing data.
> 
>    This primary block is guaranteed to be held within the first N
>    eraseblocks of a device. N is momentarily set to 16, but it might
>    be necessary to make this configurable in some way.

Does it mean that you reserve the first 16 PEBs for the primary block? 

I guess we need to carefully look an this number and make the default to
be good enough for the general case.

> 2) The secondary checkpoint blocks, which contain the real
>    checkpointing data (physical to logical eraseblock relations,
>    erase counts, sequence numbers ...)

>    Aside of that the checkpointing data contains a list of blocks
>    which belong to the active working pool. The active working pool is
>    a fixed number of blocks for shortterm, longterm and unknown
>    storage time, which can be modified before the next checkpoint set
>    is written to FLASH. These blocks need to be scanned in the
>    conventional UBI scan mode.

BTW, WRT short-term etc - how about just killing these concepts? I am
really not sure they make much sense anyway and give any improvements. 

I guess this would simplify things for you as well. I'd vote for
removing them.

>    The reason for these pool blocks is to reduce the checkpoint
>    updates to the necessary minimum to avoid accelerated device
>    wearout in scenarios where data changes rapidly. The checkpoint
>    data is updated whenever a working pool runs out of blocks.
> 
>    The number of pool blocks can be defined with a config option at
>    the moment, but this could also be done at runtime via sysfs. In
>    case of a change the checkpointing data would be reconstructed.

Id suggest to introduce as few configuration knob as possible. My
experience show that they usually only hurt. I'd stick to this rule for
most cases: no user, no knob.

> So the checkpoint scan consists of the following steps:
> 
>    1) Find the primary checkpoint block by scanning the start of the
>       device.
> 
>    2) Read the real checkpoint data and construct the UBI device info
>       structures.
> 
>    3) Scan the pool blocks.
> 
> All these operations scan a limited number of erase blocks which makes
> the UBI init O(1) and independent of the device size.

Well, is it really true? The larger is the flash the more you read and
process anyway, and it is still linear, but the multiplier becomes very
small, so this is a huge improvement.

> The checkpoint functionality is fully compatible with existing UBI
> deployments. If no checkpoint blocks can be found then the device is
> scanned and the checkpoint blocks are created from the scanned
> information.
> 
> Aside of review and testing it needs to be decided, whether the number
> of pool blocks should be deduced from the device size (number of
> physical eraseblocks) or made configurable at compile or runtime.

I would go for automatic decisions. Manual configuration can always be
added later if needed.

> Thanks to the folks at CELF who sponsored this work!

Indeed thanks! And thank you Richard!

-- 
Best Regards,
Artem Bityutskiy
