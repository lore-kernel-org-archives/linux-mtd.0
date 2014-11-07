Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmiiu-0007X0-99
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 12:33:04 +0000
Message-ID: <545CBBE2.7000205@codeaurora.org>
Date: Fri, 07 Nov 2014 14:32:34 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, dedekind1@gmail.com
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <1415201733.958.121.camel@sauron.fi.intel.com> <545C9A1B.6020905@huawei.com>
In-Reply-To: <545C9A1B.6020905@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/7/2014 12:08 PM, hujianyang wrote:
> On 2014/11/5 23:35, Artem Bityutskiy wrote:
>> On Mon, 2014-11-03 at 15:58 +0200, Tanya Brokhman wrote:
>>> If there is more then one UBI device mounted, there is no way to
>>> distinguish between messages from different UBI devices.
>>> Add device number to all ubi layer message types.
>>>
>>> The R/O block driver messages were replaced by pr_* since
>>> ubi_device structure is not used by it.
>>>
>>> Amended a bit by Artem.
>>>
>>> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Oh, the entire patch-set again... this means we need to review it again!
>> Please, have a mercy! :-) It is huge! Please, send a small patch against
>> the one which I pushed already. Thanks!
>>

Oh :( and I did that on purpose.... For some reason I thought you would 
revert that one and push a new and updated one.
Ok, I'll upload a short version.

>
> That means I can't add a Reviewed-by on this huge one...

... and then you can add Reviewed-by! :)
>
> What a pity~! ^.^
>
>
>> Artem.
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
>
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
