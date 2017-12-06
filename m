Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMfdC-0002Nj-Nt
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 19:45:23 +0000
Received: by mail-wr0-x22f.google.com with SMTP id x49so5092837wrb.13
 for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2017 11:44:58 -0800 (PST)
Subject: Re: [PATCH 0/5] Add flight recorder to MTDRAM
To: Richard Weinberger <richard@nod.at>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 david.oberhollenzer@sigma-star.at
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
 <252100234.Y1JYG21Gen@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <8663ba73-5159-d1ac-5a3b-6d158dcf9923@colorfullife.com>
Date: Wed, 6 Dec 2017 20:44:55 +0100
MIME-Version: 1.0
In-Reply-To: <252100234.Y1JYG21Gen@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 12/06/2017 11:41 AM, Richard Weinberger wrote:
> Dirk, Manfred,
>
> Am Mittwoch, 6. Dezember 2017, 09:50:34 CET schrieb Dirk Behme:
>> From: Manfred Spraul <manfred@colorfullife.com>
>>
>> Hi,
>>
>> The series adds a flight recorder to MTDRAM.
> Thanks a lot for sharing your tool, this is highly appreciated.
>
>> This allows very efficient power fail testing:
>>  From the flight recorder output, it is possible to recreate every image
>> that might have existed between the start of the recording and the end.
>>
>> Obviously, a user space tool is required, it is attached as the last
>> mail in the series.
> So, to understand this approach better I need to recap.
> The "flight recorder" logs every single MTD operation (READ, ERASE, PROGRAM)
> to a file while the MTD is under load, right?
Only ERASE and PROGRAM. READ is not logged.
Would it help if READ is logged as well? (memory is cheap, ...)

What would be fairly simple is to add a backtrace for every ERASE and 
PROGRAM. I'll try to add that.

> Then you take the log, replay it to a _file_ but instead of replaying
> all N MTD operations only N - X operations are replayed?
Exactly.  Instead of replaying all N operations, only X operations are 
replayed.

image-168167.bin is after replaying 168167 operations.
image-168168.bin is after replaying one additional operation.
> The output file is later written back to MTDRAM to check how much UBIFS likes
> it?
Exactly.
> While having such a tool would be awesome, we have to be very sure that it
> behaves correctly.
> Yesterday I spent almost the whole night with staring at some of Manfred's
> images and I'm not sure whether what I see makes sense or can actually happen
> on a real NAND or NOR flash. But I'm still investigating.
 From my understand, the tool result is exactly identical to a powerfail 
immediately after PROGRAM.
What differs from realistic embedded systems is obviously performance:
RAM disk+2-core I3 is probably much faster & much more parallelism happens.

I have uploaded the initial image, the final image and the flight recording.

https://sourceforge.net/projects/calculix-rpm/files/ubifs/xattr/

--
     Manfred
