Received: from m12-16.163.com ([220.181.12.16])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dHna5-0006Bw-Ox
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 08:41:52 +0000
Message-ID: <593519AD.4070901@163.com>
Date: Mon, 05 Jun 2017 16:43:25 +0800
From: Jia-Ju Bai <baijiaju1990@163.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Fix a sleep-in-atomic bug in ubifs_read_nnode
References: <1496633916-32362-1-git-send-email-baijiaju1990@163.com>
 <0687ba2f-f7d5-4632-eebb-50bbadd8a4b0@nod.at>
In-Reply-To: <0687ba2f-f7d5-4632-eebb-50bbadd8a4b0@nod.at>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/05/2017 04:25 PM, Richard Weinberger wrote:
> Jia-Ju Bai,
>
> Am 05.06.2017 um 05:38 schrieb Jia-Ju Bai:
>> The driver may sleep under a spin lock, and the function call path is:
>> ubifs_change_lp (acquire the lock by spin_lock)
>>    change_category
>>      ubifs_remove_from_cat
>>        remove_from_lpt_heap
>>          dbg_check_heap
>>            ubifs_lpt_lookup
>>              ubifs_read_nnode
>>                kzalloc(GFP_NOFS) -->  may sleep
>>
>> To fix it, "GFP_NOFS" is replaced with "GFP_ATOMIC".
> So, this happens only when dbg_check_heap() is activated, right?
>
> Thanks,
> //richard
Yes, I think so.

Thanks,
Jia-Ju Bai
