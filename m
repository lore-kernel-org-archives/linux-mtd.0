Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTm6N-0002FP-Nh
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 07:23:32 +0000
Message-ID: <55DAC4F6.2020808@cn.fujitsu.com>
Date: Mon, 24 Aug 2015 15:17:10 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>	
 <1440016553-26481-2-git-send-email-richard@nod.at>	
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>	
 <55D5BC92.8050903@nod.at> <1440074048.31419.204.camel@gmail.com>
 <1440400689.15510.30.camel@gmail.com>
In-Reply-To: <1440400689.15510.30.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2015 03:18 PM, Artem Bityutskiy wrote:
> On Thu, 2015-08-20 at 15:34 +0300, Artem Bityutskiy wrote:
>> On Thu, 2015-08-20 at 13:40 +0200, Richard Weinberger wrote:
>>>> Basically, we need to see what is the "common practice" here, and
>>>> follow it. This requires a small research. What would be the most
>>>> popular Linux FS which does not support direct I/O? Can we check
>>>> what
>>>> it does?
>>>
>>> All popular filesystems seem to support direct IO.
>>> That's the problem, application do not expect O_DIRECT to fail.
>>>
>>> My intention was to do it like exofs:
>>
>> Fair enough, thanks!
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
>
> Richard, you mention this was suggested by Dave, could you please pint
> to the discussion, if possible?

http://lists.infradead.org/pipermail/linux-mtd/2015-August/060702.html

That's in a discussion I want to introduce ubifs into xfstests.

Yang
>
> Artem.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
>
