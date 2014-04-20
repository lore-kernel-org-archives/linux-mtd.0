Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbzKU-00041M-KS
 for linux-mtd@lists.infradead.org; Sun, 20 Apr 2014 21:31:15 +0000
Message-ID: <53543C7B.5000202@nod.at>
Date: Sun, 20 Apr 2014 23:30:35 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: UBIFS CRC error, calculated from ubifs_check_node
References: <53541449.9080308@codeaurora.org>
 <CAFLxGvwTa3RMjxwONXyYwt5LGfAP1oLk906usw6-nana=MUNFQ@mail.gmail.com>
 <53543AFC.7050202@codeaurora.org>
In-Reply-To: <53543AFC.7050202@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.04.2014 23:24, schrieb Tanya Brokhman:
> On 4/20/2014 11:55 PM, Richard Weinberger wrote:
>> On Sun, Apr 20, 2014 at 8:39 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
>>> Hi All
>>>
>>> I'm hitting "UBIFS error (pid 1026): ubifs_check_node: bad CRC: calculated
>>> 0x79dbca01, read 0x31afb5d7" and as a result the partition is remounted as
>>> RO.
>>>
>>> I'm using 3.10 based kernel.
>>> The test scenario to reproduce this is:
>>> 1. fill the partition tested using dd
>>> 2. try to write some more data
>>>
>>> There are no errors in the log from the ubi layer or from the underlying
>>> nand driver, both also testing crc.
>>>
>>> I've tried disabling compression, mounting the partition as sync and issuing
>>> the write command with sync param. None of the former has any effect on this
>>> crash.
>>> I tried disabling crc on data nodes. This lowered the possibility of hitting
>>> the above error but eventually, with stress test of concurrent read and
>>> write we hit the same error with a different node type.
>>>
>>> Has any one encountered similar behavior? I'm not that much familiar with
>>> ubifs so any help will be highly apritiated!
>>
>> Before we start digging into this, do mtd-tests and ubi-tests pass?
>>
> 
> 
> mtd-tests: yes.

Good. :)

> ubi-tests: never run those. Where can I find them? I see only debug.c at mtd/ubi with helping functions but no tests.
> 
> We're just switching to ubifs from yaffs2. I looked at the diff between linux-next and our branch (3.10 based) and tried to bring in all of the fixes in mtd and ubi layers.
> I'll try running ubi-tests and update on the result.
> 
> Do you think we should run ubifs tests as well? Are there such tests?

Yes. Fetch mtd-utils source.
See tests/ubi-tests directory.
It contains UBI and UBIFS tests.

Please run first ubi tests (runtests.sh).

Thanks,
//richard
