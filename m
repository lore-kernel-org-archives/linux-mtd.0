Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo89A-0001eH-Gs
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 09:54:01 +0000
Received: from [10.18.168.100] (unknown [185.23.60.4])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tlinder@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E3D1140064
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 09:53:38 +0000 (UTC)
Message-ID: <5461DCA0.5040108@codeaurora.org>
Date: Tue, 11 Nov 2014 11:53:36 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>	
 <5460F7D8.2030100@nod.at> <1415642273.8868.8.camel@perches.com>	
 <5461C7C6.6060604@codeaurora.org> <1415694886.16070.3.camel@perches.com>
 <5461CF56.5010407@nod.at>
In-Reply-To: <5461CF56.5010407@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/11/2014 10:56 AM, Richard Weinberger wrote:
> Am 11.11.2014 um 09:34 schrieb Joe Perches:
>> On Tue, 2014-11-11 at 10:24 +0200, Tanya Brokhman wrote:
>>> On 11/10/2014 7:57 PM, Joe Perches wrote:
>>>> On Mon, 2014-11-10 at 18:37 +0100, Richard Weinberger wrote:
>>>>> Am 03.11.2014 um 14:58 schrieb Tanya Brokhman:
>>>>>> If there is more then one UBI device mounted, there is no way to
>>>>>> distinguish between messages from different UBI devices.
>>>>>> Add device number to all ubi layer message types.
>>>>
>>>> Adding "error" and "warning" to the message logs is
>>>> duplicative to the KERN_<LEVEL> logging information.
>>>>
>>>>>> Changes from V5:
>>>>>> 	- Added ptr verification @ ubi_err/ubi_msg/ubi_warn
>>>>>> 	Removed extra printing of ubi number
>>>>>> 	Removed new messages.
>>>>
>>>> Did you all ever look at what I posted?
>>>
>>> I did. Its not my place to re-post your change in my patch. I personally
>>> prefer it the way I've done it but it's just a matter of opinion and
>>> personal preference.
>>
>> Don't forget object code size.
>
> That's a good point.
> Tanya's patch is already in linux-ubifs.git (http://git.infradead.org/linux-ubifs.git).
> Later we could patch ubi.h to use Joe's log functions.

I'm sorry, but I think I'm giving up on all attempts to make everyone 
happy with "fixes" on top of the merged patch since I like it the way it 
is and there are just too many opinions on this. It should have been 
just a small patch to help everyone in debugging just as it helped me....
And I do think function name is useful. You don't have to agree with me, 
I can keep this internal in my code.

Artem - since you're the final call on this please list what you would 
like me to upload in regards to this and I'll post another version.

>
> But first I'd like to fix the logging style.
> I'm really unhappy with it.
>
> The patch does much more that the commit messages says:
> "If there is more then one UBI device mounted, there is no way to
> distinguish between messages from different UBI devices.
> Add device number to all ubi layer message types.
>
> The R/O block driver messages were replaced by pr_* since
> ubi_device structure is not used by it."
>
> There is no hint that it adds the function name to every log message.
> If so, I'd have nack'ed the patch.
>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
