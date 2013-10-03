Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRlDd-0007l8-Ao
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 15:53:37 +0000
Message-ID: <524D92E8.1030704@nod.at>
Date: Thu, 03 Oct 2013 17:53:12 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] UBI: fix refill_wl_user_pool()
References: <1380376516-30144-1-git-send-email-richard@nod.at>
 <1380376516-30144-2-git-send-email-richard@nod.at>
 <1380812414.27358.440.camel@sauron.fi.intel.com> <524D8879.1030203@nod.at>
 <1380814071.27358.444.camel@sauron.fi.intel.com>
In-Reply-To: <1380814071.27358.444.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.10.2013 17:27, schrieb Artem Bityutskiy:
> On Thu, 2013-10-03 at 17:08 +0200, Richard Weinberger wrote:
>> Am 03.10.2013 17:00, schrieb Artem Bityutskiy:
>>> On Sat, 2013-09-28 at 15:55 +0200, Richard Weinberger wrote:
>>>> If no free PEBs are available refill_wl_user_pool() must not
>>>> return with -ENOSPC immediately.
>>>> It has to block till produce_free_peb() produced a free PEB.
>>>>
>>>> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>
>>> What is pool size, I wonder?
>>
>> Currently it's 25 (UBI_FM_WL_POOL_SIZE).
>> If experience shows that 25 is too low/big we can change this constant.
>> Maybe it's also worth making them configurable...
> 
> I if it is a possible scenario that this function will not return until
> 25 (or even 10) PEBs are erased? 
> 

Sure. It will try to gain up to 25 PEBs but return if it gets less.
That's why a pool has a current and a max size.

Thanks,
//richard
