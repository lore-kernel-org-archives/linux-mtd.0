Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb3pa-0001t5-MF
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 09:12:04 +0000
Message-ID: <5513CD49.30803@nod.at>
Date: Thu, 26 Mar 2015 10:11:37 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/5] UBI: Coverity-inspired fixes
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
 <54F830EA.4080106@nod.at> <20150306020442.GP18140@ld-irv-0074>
In-Reply-To: <20150306020442.GP18140@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.03.2015 um 03:04 schrieb Brian Norris:
> On Thu, Mar 05, 2015 at 11:33:14AM +0100, Richard Weinberger wrote:
>> Brian,
>>
>> Am 28.02.2015 um 11:23 schrieb Brian Norris:
>>> Except for the last one, these were inspired by Coverity Scan results.
>>>
>>> These fixes have barely been tested, but they are pretty straightforward
>>> logically. As they've been sitting in my dust pile too long, I thought I'd at
>>> least get them out there.
>>>
>>> Brian Norris (5):
>>>   UBI: account for bitflips in both the VID header and data
>>>   UBI: fix out of bounds write
>>>   UBI: initialize LEB number variable
>>>   UBI: fix check for "too many bytes"
>>>   UBI: align comment for readability
>>
>> Nice work!
>> I'll test them later today.
>> Just a quick question, no patch has a stable tag, is this by design?
>> From a first look most of them look like stable material.
> 
> Two reasons:
> 
>  1. I hadn't tested them heavily, and I definitely didn't try to target
>  their codepaths much.
> 
>  2. Given #1 and the fact that these were just found by static analysis,
>  I don't think they pass this test from
>  Documentation/stable_kernel_rules.txt:
> 
>  " - It must fix a real bug that bothers people (not a, "This could be a
>     problem..." type thing)."
> 
> So, I expected they would only be sent to stable if somebody (perhaps
> me) is able to trigger something real, or at least gets some significant
> testing on them.
> 
> Maybe this is a case where you send the fixes, and then send the commit
> IDs to Greg after they have been proven stable and/or can be exploited
> in some way through testing. (Option 2 in the updated
> stable_kernel_rules.txt.)
> 
> But really, it's your/Artem's call.

Applied, thanks a lot Brian!
I've marked patches 1 to 4 as stable material.

Thanks,
//richard
