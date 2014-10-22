Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgtT1-0002xf-E6
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 10:48:35 +0000
Message-ID: <54478B6A.4020106@codeaurora.org>
Date: Wed, 22 Oct 2014 13:48:10 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
 <54476785.5020603@nod.at> <544768A5.5000505@codeaurora.org>
 <54476C0F.4050603@nod.at>
In-Reply-To: <54476C0F.4050603@nod.at>
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

On 10/22/2014 11:34 AM, Richard Weinberger wrote:
> Am 22.10.2014 um 10:19 schrieb Tanya Brokhman:
>> I care :) Its in my TODO to update ubinize to leave space for fastmap anchor (and perhaps generate a fastmap data as well but this is just a thought).
>
> While talking about fastmap TODOs, here you can find my fastmap patch queue:
> https://git.kernel.org/cgit/linux/kernel/git/rw/misc.git/log/?h=ubi-current
>
> These patches are *not* ready for mainline, some of them need a rewrite
> to meet all design goals of UBI. But maybe the one or other fixes an issue
> which is on your TODO list. :-)
>
> Thanks,
> //richard
>

thanks! it's very helpful! and just to combine the reply in one email:

"Please generate the fastmap data such that upon the very first attach 
fastmap can be used."

This is what I was thinking. Its doable, right? since in ubinize we have 
all data required for constructing fastmap.

 From all your discussions with Artem I figure we can expect quite a few 
changes to the fastmap implementation. Is the layout also going to 
change? I remember you mentioning such idea in one of the emails.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
