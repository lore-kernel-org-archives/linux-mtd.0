Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY9mv-00034e-WF
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 08:25:02 +0000
Message-ID: <5427C5C4.40508@codeaurora.org>
Date: Sun, 28 Sep 2014 11:24:36 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: ubi: Extend UBI layer debug/messaging capabilities
References: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
 <5427C046.5030608@nod.at>
In-Reply-To: <5427C046.5030608@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/28/2014 11:01 AM, Richard Weinberger wrote:
> Tanya,
>
> Am 28.09.2014 08:36, schrieb Tanya Brokhman:
>> If there is more then one UBI device mounted, there is no way to
>> distinguish between messages from different UBI devices.
>> Add device number to all ubi layer message types.
>>
>>
>> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>
> Artem's mail is dedekind1@ not dedeking1@. :)

oops.... sorry about that. thanks for the fix.

> Anyway, instead of passing ubi->ubi_num down to every log function you can
> just pass the ubi object itself and let the log function access ->ubi_num.

This is how I first implemented this patch. But then I cam across some 
ubi_err prints during the init process (in build.c ubi_init()) when we 
still don't have the ubi structure, so we need to pass some number to 
the message. I overcame this by using UBI_MAX_DEVICES.


-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
