Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGA9N-0008GU-Nj
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 19:18:54 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mnViaWZzOlF1ZXN0aW9ucyBBYm91dCBHYXJiYWdl?=
 =?UTF-8?Q?_Collection?=
To: Michal Suchanek <hramrach@gmail.com>
References: <tencent_6E3BACF519D6BE3A72292C36@qq.com>
 <CAFLxGvxbmUqFAq7QS=S3n0_yO4tsUHdbbL3-Fq4bHuJTBmEpPA@mail.gmail.com>
 <tencent_7ADEA65732A2B069166D1A41@qq.com> <5766D0CA.3090404@nod.at>
 <CAOMqctT4Ftef-TTX+cC9HK5Fg4TTe9MDodGbSrJDBmsKBj_NWA@mail.gmail.com>
 <576C1DB1.1080002@nod.at>
 <CAOMqctTpTsTHd8tbVeA+X8bR0KQ77mufw4koDtwZV7rFquQ5xw@mail.gmail.com>
Cc: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576C3604.1050401@nod.at>
Date: Thu, 23 Jun 2016 21:18:28 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMqctTpTsTHd8tbVeA+X8bR0KQ77mufw4koDtwZV7rFquQ5xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.06.2016 um 19:55 schrieb Michal Suchanek:
> On 23 June 2016 at 19:34, Richard Weinberger <richard@nod.at> wrote:
>> Am 23.06.2016 um 19:20 schrieb Michal Suchanek:
>>> Hello,
>>>
>>> On 19 June 2016 at 19:05, Richard Weinberger <richard@nod.at> wrote:
>>>> Am 19.06.2016 um 18:14 schrieb 辉少:
>>>>> Thanks for your kind reply！Do you mean that in synchronous/asynchronous mode GC is also finished in synchronous
>>>>> /asynchronous way as writting is? A more question is，are all dirty spaces collected in the same time in synchronous mode(at this point the caller will be blocked for a long time) while in asynchronous mode dirty spaces will be collected little by little in asynchronous mode when i do not  notice？Thank you！
>>>>
>>>> Hmm, I don't fully understand your first question, can you elaborate?
>>>> As for dirty space, GC will not collect all dirty space. UBIFS tells GC how much free space an operation
>>>> will take. UBIFS calls this budget. The GC will try to produce as much free space as needed.
>>>>
>>>
>>> I guess the issue here is that UBIFS appears to do this
>>>
>>>  1) write files while there is space
>>>  2) when space is 0 perform a GC run as part of write operation
>>>
>>> when writes are synchronous the GC run is timed as part of the write.
>>
>> Exactly. :-)
>>
>>> If GC was asynchronous it would not appear as part of the synchronous
>>> write operation and would not cause as much write time jitter. When
>>> mounting a filesystem synchronous having GC synchronous is likely not
>>> what the user asked for. It's part of the internal fs bookkeeping and
>>> not part of the operation the user wants to perform synchronously.
>>>
>>> For GC to run asynchronously it would have to start before the
>>> available space is 0 so writes can still happen.
>>
>> How would the GC know how much space you need in future?
>> Sure, we would run the GC every X seconds/minutes/whatever but then the flash will wear out
>> faster since GC will always run and not only when you really need space.
> 
> I would collect garbage when the unusable space is some % of free
> space or when the free space is less than a few blocks rather than
> based on time. Nonetheless, it can happen that some of the data the GC
> copied to fresh blocks gets deleted before new blocks are written.
> 
>>
>>> Is it possible to set a parameter somewhere that would make UBIFS do this?
>>
>> Do we really need this?
> 
> Waiting until the space is 0 probably hurts performance in general and
> not only in the specific case of synchronous writes. I did not
> benchmark flash writing, though.

Well, changing the semantics when GC runs is rather easy.
So feel free to do experiments. If we can do better, we'll find
a way to implement it.

Thanks,
//richard
