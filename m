Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkynJ-00085b-K4
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 17:18:25 +0000
Message-ID: <54566748.3020208@codeaurora.org>
Date: Sun, 02 Nov 2014 19:18:00 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <54563059.1080405@codeaurora.org>
 <545637AA.7080906@nod.at> <54563BD4.7050107@codeaurora.org>
 <54566396.1050209@nod.at>
In-Reply-To: <54566396.1050209@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/2/2014 7:02 PM, Richard Weinberger wrote:
> Am 02.11.2014 um 15:12 schrieb Tanya Brokhman:
>>> Back to topic.
>>> Storing the read-counters into fastmap also not a good idea because the fastmap can get lost completely (by design).
>>
>> yes,I'm aware of that. We have a default value for that case, and we're trying to avoid fastmap being invalid...
>
> Here be dragons. Can you please share these modifications?

nothing to share yet :) work in progress. more thought then code at this 
point. will share as soon as have something valid...

>
> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
