Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xkvci-0006o1-8x
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 13:55:17 +0000
Message-ID: <545637AA.7080906@nod.at>
Date: Sun, 02 Nov 2014 14:54:50 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <54563059.1080405@codeaurora.org>
In-Reply-To: <54563059.1080405@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.11.2014 um 14:23 schrieb Tanya Brokhman:
>> Okay, read-disturb will only happen if you read blocks *very* often. Do you have numbers, datasheets, etc...?
> 
> Yes. In 0001-mtd-ubi-Read-disturb-infrastructure.patch you'll find:
> #define UBI_RD_THRESHOLD 100000
> Can't share more than that. This value is defined by card manufacturer and configurable by this define.

Somehow I managed to oversee that value. It is as large as I expected.
But is is *very* sad that you can't share more details.
We'd have make this value configurable at runtime.
Other manufacturers may have other magical values...

>>
>> Let's recap.
>>
>> We need to address two issues:
>> a) If a PEB is ready very often we need to scrub it.
> 
> right. this is what the read-counter is for.
> 
>> b) PEBs which are not read for a very long time need to be re-read/scrubbed to detect bit-rot
> 
> it need to be scrubbed. this is for data retention and these pebs are found by last_erase_timestamp. I referred to them as "pebs that are rarely accessed. "
> 
>>
>> Solving b) is easy, just re-read every PEB from time to time. No persistent data at all is needed.
> 
> That isn't good enough. Because if we just re-read the peb we will find the "problematic" once only when the read produces ecc errors. But if we relay on that we may be too late
> because we might hit ecc errors that we just wont be able to fix and data will be lost. So the goal is *to prevent* ecc errors on read. That's why we need both the read-counter
> (for heavily read pebs) and the last_erase_timestamp (for once that are rarely accessed).
> 
>> To solve a) you suggest adding the read-counter to the UBI on-disk layout like the erase-counter values.
> 
> No, not on disk layout. You're mixing the read-counter with the last_erase_timestamp.
> read-counter: maintained only at RAM, saved *only* as part of fastmap data. If fastmap data is lost: read counters are lost too
> last-erase-timestamp: part of ec_header, maintained on disk

You're right I mixed that up. Sorry.

Copy&Pasting from your other mail:

>> Another point:
>> What if we scrub every PEB once a week?
>> Why would that not work?
>
> It will work but it's an overkill because we don't want to scrub (and erase) pebs that don't need this because this way we will ware out the device in terms on wear-leveling.
> Besides, scrubbing all pebs will also be a performance hit.

A year has 52 weeks. So, in 10 (!) years we would scrub each PEB only 520 times.
Even if we scrub every day we'd only scrub each PEB 3650 times in 10 years.
I don't see any overhead at all. Of course only a stupid implementation would scrub them at once, this would
be a performance issue.

Back to topic.
Storing the read-counters into fastmap also not a good idea because the fastmap can get lost completely (by design).
Better store the read-counter lazily into a new internal UBI volume (use UBI_COMPAT_PRESERVE).
This way you can make sure that they are not lost.

I suggest the following:
a) Maintain the erase-counters in RAM
b) From time to time write them to an internal UBI volume. (e.g. at detach time and once a day).
c) Implement a logic in UBI which scrubs a PEB if it got a lot of reads.
You could do c) even in userspace.

And for bit-rot detection you can do the same, but with timestamps instead of read-counters...

Artem, what do you think?

Thanks,
//richard
