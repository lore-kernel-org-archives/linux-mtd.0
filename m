Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwVfl-0002Am-No
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 12:38:18 +0000
Message-ID: <548055A0.3020703@codeaurora.org>
Date: Thu, 04 Dec 2014 14:37:52 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 02/35] UBI: Fix stale pointers in ubi->lookuptbl
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-3-git-send-email-richard@nod.at>
 <54803EBF.9060609@codeaurora.org> <54803FC0.7080305@nod.at>
In-Reply-To: <54803FC0.7080305@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/4/2014 1:04 PM, Richard Weinberger wrote:
> Tanya,
>
> Am 04.12.2014 um 12:00 schrieb Tanya Brokhman:
>> Hi Richard
>>
>> On 10/29/2014 2:45 PM, Richard Weinberger wrote:
>>> In some error paths the WL sub-system gives up on a PEB
>>> and frees it's ubi_wl_entry struct but does not set
>>> the entry in ubi->lookuptbl to NULL.
>>> Fastmap can stumble over such a stale pointer as it uses
>>> ubi->lookuptbl to find all PEBs.
>>>
>>> Fix this by setting the pointers to free'd ubi_wl_entry to NULL.
>>
>> There are 2 more places:
>> tree_destroy() and protection_queue_destroy() where ubi_wl_entry is released. Both functions used on power down so all should be good as is, just wanted to make sure you didn't add
>> ubi->lookuptbl[e2->pnum] = NULL there on purpose.
>
> I fear you're looking at the old patch series.
> Please have a look at:
> "[PATCH 3/6] UBI: Fix stale pointers in ubi->lookuptbl" sent on 30.11.2014.
>
> Thanks,
> //richard
>

oh, you're right. Started from the oldest. now I see you released v2. 
Sorry. So I should be looking at "Fastmap update v2 (pile 1-7)", right?

Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
