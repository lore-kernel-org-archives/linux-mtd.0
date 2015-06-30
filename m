Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9rrH-0007g9-3P
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 09:29:40 +0000
Message-ID: <5592616B.9060106@nod.at>
Date: Tue, 30 Jun 2015 11:29:15 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dedekind1@gmail.com
Subject: Re: [RFC PATCH RESEND] mtd-utils: Restructure the mtd-utils source.
References: <1435647022-7318-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <559242F7.1020701@nod.at> <559244FB.8080507@cn.fujitsu.com>
 <55924762.5010408@nod.at> <55924835.7060601@cn.fujitsu.com>
In-Reply-To: <55924835.7060601@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.06.2015 um 09:41 schrieb Dongsheng Yang:
> On 06/30/2015 03:38 PM, Richard Weinberger wrote:
>> Am 30.06.2015 um 09:27 schrieb Dongsheng Yang:
>>> On 06/30/2015 03:19 PM, Richard Weinberger wrote:
>>>> Am 30.06.2015 um 08:50 schrieb Dongsheng Yang:
>>>>> * There is no code modification in this commit, only moving
>>>>> * the files to proper place.
>>>>>
>>>>> The user tools looks a little messy as we place almost
>>>>> the all tools in the root directory of mtd-utils. To make
>>>>> it more clear, I propose to introduce the following structure
>>>>> for our source code.
>>>>>
>>>>> mtd-utils/
>>>>>      |-- lib
>>>>>      |-- include
>>>>>      |-- misc-utils
>>>>>      |-- flash-utils
>>>>>      |-- jffsX-utils
>>>>>      |-- nand-utils
>>>>>      |-- nor-utils
>>>>>      |-- ubi-utils
>>>>>      |-- ubifs-utils
>>>>>      `-- tests
>>>>>
>>>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>>>
>>>> Hmm, while I agree with you that the current directory structure is not perfect
>>>> I'm not sure if it is worth the hassle. Because your patch hurts git blame.
>>>
>>> Good point. But seems the git currently is smart enough to show the
>>> right history in blame after a rename commit.
>>
>> Does it also after you've applied the patch file? i.e. git am your.patch.
>> IIRC git is able to deal with that only if you keep the patch in git.
> 
> I tried to reset --hard and apply it. That works too. And then I tried
> to apply this patch to another repo. I got the expected result in blame.

Oh, nice. :-)

>> BTW: Your patch does not apply to mtd-utils.git as of today.
> 
> Sorry about it. This patch does not apply to latest mtd-utils, I made it
> in a local repo. As my working network can not access:
> https://git.infradead.org/srv/git/mtd-utils.git/
> 
> You know, there are some strange limits about network in lots of china
> companies. :(
> 
> So, I marked it as RFC to see the opinions about this idea. I have to
> wait to go home this night to update my repo and rebase this patch.

I can feel your pain.

Thanks,
//richard
