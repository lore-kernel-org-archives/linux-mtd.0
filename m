Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y5lcD-0007Yd-7O
 for linux-mtd@lists.infradead.org; Tue, 30 Dec 2014 01:28:54 +0000
Message-ID: <54A1FF8D.4010301@huawei.com>
Date: Tue, 30 Dec 2014 09:27:41 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <54A0C70D.7040706@huawei.com> <54A16217.1060006@codeaurora.org>
In-Reply-To: <54A16217.1060006@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/29 22:15, Tanya Brokhman wrote:
> Hi Hu,
> 
> On 12/29/2014 5:14 AM, hujianyang wrote:
>> On 2014/11/3 21:58, Tanya Brokhman wrote:
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
>>> ---
>>> Changes from V1:
>>
>>
>> Hi Artem and Tanya,
>>
>> Do you think the similar effort is worth to be done on ubifs-level?
> 
> We already did this for UBIFS as well and have been working with this patch for some time now. Its in our todo to share it, just got pulled into some urgent staff unfortunately.
> 

Got it~!

I'd like to wait for your patch, thanks for your work.

Hu

> 
> Thanks,
> Tanya Brokhman
