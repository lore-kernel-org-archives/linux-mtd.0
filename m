Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe2Gs-0003I5-W6
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 13:36:15 +0000
Message-ID: <543D26B6.9020506@codeaurora.org>
Date: Tue, 14 Oct 2014 16:35:50 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>	
 <1412029248-22454-4-git-send-email-richard@nod.at>	
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>	
 <1413206263.7906.18.camel@sauron.fi.intel.com> <543BE21F.5020504@nod.at>	
 <1413213803.7906.45.camel@sauron.fi.intel.com> <543C3E60.4080507@nod.at>	
 <1413282203.7906.72.camel@sauron.fi.intel.com>	
 <543D1545.8090209@codeaurora.org>
 <1413291739.7906.88.camel@sauron.fi.intel.com>
In-Reply-To: <1413291739.7906.88.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/14/2014 4:02 PM, Artem Bityutskiy wrote:
> On Tue, 2014-10-14 at 15:21 +0300, Tanya Brokhman wrote:
>> Hi Artem/Richard
>>
>> I think your discussion here stopped being relevant to this specific
>> patch but went on to the fastmap feature design in general :)
>> This patch fixes a real bug in the current implementation of the
>> feature. What you're discussing requires a re-writing and re-design of
>> the feature. Perhaps this one can be merged and will be "fixed" later on
>> when you agree on how you would like FM to access WL data structures in
>> general?
>
> First of all, "re-writing and re-design of the feature" is an
> overstatement. So far this is on the "cleaning things up" side of the
> spectrum, closer to the "re-factoring" area.
>
> WRT "merge the fix now and improve later" - this is a good argument for
> an "inside a company" discussion, where the primary TTM is the driving
> factor.
>
> For the community TTM is a good thing, but quality comes first.
>
> Now, if this was about a regression, one could apply time pressure on
> the maintainer. But we are talking about a problem which was there from
> day 0.
>
> It is completely normal for the maintainer to push back various
> hot-fixes for the problem and request some reasonable re-factoring
> first. This is what I do. This is very very usual thing in the Linux
> community.
>
> So far I did not ask anything huge and unreasonable, I think. Just
> cleaner inter-subsystem APIs, less of the "fastmap uses the other
> subsystems' internals" kind of things.
>
> --
> Artem.
>

Ok, accepted. It was just a suggestion. I'm all for quality coming 
first, even if you were asking for something "huge".

Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
