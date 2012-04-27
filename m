Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNmHK-0000oM-3a
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 14:36:10 +0000
Message-ID: <4F9AAED7.2000800@grid-net.com>
Date: Fri, 27 Apr 2012 07:36:07 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Suggestion needed to set proper journal size
References: <4F91EA56.50803@grid-net.com> <1335535527.1910.6.camel@koala>
In-Reply-To: <1335535527.1910.6.camel@koala>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/27/2012 07:05 AM, Artem Bityutskiy wrote:
> On Fri, 2012-04-20 at 15:59 -0700, Subodh Nijsure wrote:
>> Hello,
>>
>> I know general implications of changing journal size on UBIFS -- bigger
>> the journal,
>> longer it may take to replay the journal, increasing time UBIFS takes to
>> mount. Smaller
>> journal means more re-writes to flash.
>>
>> We created 2 partitions 100MB and 45MB and we see that by default
>> mkfs.ubifs is reserving 8MB for journal.
>>
>> UBIFS: file system size:   101834752 bytes (99448 KiB, 97 MiB, 802 LEBs)
>> UBIFS: journal size:         9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
>>
>> UBIFS: file system size:     47996928 bytes (46872 KiB, 45 MiB, 378 LEBs)
>> UBIFS: journal size:          9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
>>
>> I know I can specify size of journal with -j option.
>>
>> Should the journal size be scaled in some proportion of size of UBIFS
>> partition?
> It does grow, but not infinitely. We have some heuristics in mkfs.ubifs,
> but those were mostly taken out of thin air. I do not remember us doing
> a lot of experimenting with that.
>
>> Should the journal size depend on how often you expect file-system to be
>> updated?
>>
>> Has anyone done experiments with setting really small (1MB/2MB) journal
>> size?
>> What side effects is one likely to encounter if the journal size is too
>> small.
>>
>> fwiw in my use case, file-system doesn't get updated that often, perhaps
>> 2K data in about 4 files once a week.
> I think you should do your own experiments. If you share the results -
> will be nice.
Yes, its on my to-do list once I am done resubmitting XATTR and integck 
patches.

-Subodh
