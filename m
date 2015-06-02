Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzkIg-0007rU-GV
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 11:24:07 +0000
Message-ID: <556D923E.1020503@nod.at>
Date: Tue, 02 Jun 2015 13:23:42 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] UBI: Use static class and attribute groups
References: <1423057871-9928-1-git-send-email-tiwai@suse.de>	<54EEE32F.2000001@huawei.com>	<54EEE52D.9000906@nod.at>	<5555AC35.60906@huawei.com>	<s5hegmd10j3.wl-tiwai@suse.de>	<555AE8AD.6070205@nod.at>	<556D7A29.8040201@nod.at>
 <s5hwpzme6hb.wl-tiwai@suse.de>
In-Reply-To: <s5hwpzme6hb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Sheng Yong <shengyong1@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 hujianyang <hujianyang@huawei.com>, linux-mtd@lists.infradead.org,
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

Am 02.06.2015 um 12:42 schrieb Takashi Iwai:
> At Tue, 02 Jun 2015 11:40:57 +0200,
> Richard Weinberger wrote:
>>
>> Am 19.05.2015 um 09:39 schrieb Richard Weinberger:
>>> Am 19.05.2015 um 09:36 schrieb Takashi Iwai:
>>>> At Fri, 15 May 2015 16:20:05 +0800,
>>>> hujianyang wrote:
>>>>>
>>>>> On 2015/2/26 17:19, Richard Weinberger wrote:
>>>>>> Am 26.02.2015 um 10:11 schrieb hujianyang:
>>>>>>> Hi Takashi,
>>>>>>>
>>>>>>> I think it's a good attempt. Did you test this patch on your environment
>>>>>>> or just changing the code?
>>>>>>>
>>>>>>> How do you feel about this patch, Richard?
>>>>>>
>>>>>> I like the patch but had no time to look at it in detail and test it but this will happen soon. :)
>>>>>>
>>>>>> Thanks,
>>>>>> //richard
>>>>>>
>>>>>> ______________________________________________________
>>>>>> Linux MTD discussion mailing list
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>>>>
>>>>>>
>>>>>
>>>>> Hi Richard,
>>>>>
>>>>> I've amended this patch a bit and Sheng Yong helped me test a little.
>>>>> Could you please review and do some test on it?
>>>>>
>>>>> Thanks,
>>>>> Hu
>>>>
>>>> Thanks Hu!  I must have overlooked the post from Richard.
>>>>
>>>> My patch wasn't tested with the real hardware, mostly compile-tested
>>>> only.  So, yes, if anyone could test it, it'd be greatly appreciated.
>>>
>>> You can test it using the nandsim module. :-)
>>
>> Can I have a Tested-by?
> 
> I quickly tested with nandsim and the latest patch seems working, so
> feel free to put me to tested-by, if needed.
> (Though, not sure whether tested-by tag by the patch author makes much
>  sense :)

Patch applied. Thanks everyone!
//richard
