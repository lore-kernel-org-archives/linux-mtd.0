Received: from mail.kmu-office.ch ([178.209.48.109])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwbzo-0007Bo-3y
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 21:32:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Oct 2016 14:26:14 -0700
From: Stefan Agner <stefan@agner.ch>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: UBI assert failed in wl_tree_add at 168 using v4.9-rc1
In-Reply-To: <CAFLxGvxTgNm3H9NvOGVjA9=0yLTdnMQBW9UUFmsX7kLChCeo2A@mail.gmail.com>
References: <5d8e8bc09c75405a783990312dd1dc41@agner.ch>
 <CAFLxGvxTgNm3H9NvOGVjA9=0yLTdnMQBW9UUFmsX7kLChCeo2A@mail.gmail.com>
Message-ID: <54fa9ba04ec7310bdc520bb8db943de2@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 2016-10-18 13:09, Richard Weinberger wrote:
> Stefan,
> 
> On Tue, Oct 18, 2016 at 9:51 PM, Stefan Agner <stefan@agner.ch> wrote:
>> Hi All,
>>
>> After flashing and 2-3 hard resets (power-cut), I happen to get a lot of
>> the following stack traces:
>>
>> [   33.031951] UBI assert failed in wl_tree_add at 168 (pid 1)
<snip>
>>
>> The system successfully boots in the end (after printing out such traces
>> for a minute or so).
>>
>> This is on a NXP Vybrid using the vf610-nfc driver. The driver is
>> mainline since some releases now, and I haven't seen such a stack trace
>> before.
>>
>> I do use fastmap and a 2015.04 U-Boot to read the kernel/device tree
>> from a separate volume.
>>
>> Anybody else seen this?
> 
> Does this patch help?
> http://lists.infradead.org/pipermail/linux-mtd/2016-October/069702.html
> 
> I'm assuming that the problem first appeared in v4.9-rc1, right?

I've never seen it before, so yes looks like it appeared in v4.9-rc1.

I rebooted and power-cycled a bunch of times with that patch, it looks
stable now! So yes, the patch helps. I will do some more tests and
report in case I see it again.

Thanks!

--
Stefan
