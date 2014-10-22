Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgr9R-0000wk-GH
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:20:14 +0000
Message-ID: <544768A5.5000505@codeaurora.org>
Date: Wed, 22 Oct 2014 11:19:49 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
 <54476785.5020603@nod.at>
In-Reply-To: <54476785.5020603@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/2014 11:15 AM, Richard Weinberger wrote:
> Am 22.10.2014 um 09:48 schrieb Sascha Hauer:
>> The fastmap code needs a free eraseblock in the first 64 erasblocks
>> to write a fastmap anchor. Since ubiformat continuously writes the
>> image to the flash the fastmap code won't find a free block and
>> fastmap will be disabled.
>
> If UBI is unable to write a fastmap it will try again later.
> So, it will be not disabled.
>
>> With this patch ubiformat skips flashing
>> a block at the beginning thus allowing the fastmap code to write
>> an anchor.
>
> Hmm, this is a bit hacky. What prevents UBI itself from using this free PEB
> after the first attach? I.e. if a bitflip happens?
> The in kernel code has already a mechanism to move used PEBs < 64 to make space
> for the anchor.
> IMHO the only sane approach is to create a fastmap enabled image directly with ubiformat.
> While creating the initial fastmap code I had the plan to make mtd-tools fastmap aware
> but simply run out of budget and so far nobody cared enough.

I care :) Its in my TODO to update ubinize to leave space for fastmap 
anchor (and perhaps generate a fastmap data as well but this is just a 
thought).


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
