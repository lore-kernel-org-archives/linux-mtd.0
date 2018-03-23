Received: from mail-he1eur01on0094.outbound.protection.outlook.com
 ([104.47.0.94] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezIyF-0000jB-Cx
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 09:26:50 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard@sigma-star.at>, linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <7511413.bof9RI5LLK@blindfold>
 <a6a77fba-9df1-2dac-25a7-c0d3d9bc5b42@exertus.fi>
 <2385502.GW1C2yTnO0@blindfold>
From: Timo Ketola <timo@exertus.fi>
Message-ID: <d154d30e-af96-007f-70cb-dafbbfd294ef@exertus.fi>
Date: Fri, 23 Mar 2018 11:26:30 +0200
MIME-Version: 1.0
In-Reply-To: <2385502.GW1C2yTnO0@blindfold>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22.03.2018 17:48, Richard Weinberger wrote:
> Am Donnerstag, 22. März 2018, 16:40:42 CET schrieb Timo Ketola:
>> I'm slightly confused though, because flash_erase reports total of eight
>> blocks:
>>
>> # flash_eraseall /dev/mtd1
>> Erasing 128 Kibyte @ 3bf60000 - 48% complete.
>> Skipping bad block at 0x3bf80000
>>
>> Skipping bad block at 0x3bfa0000
>>
>> Skipping bad block at 0x3bfc0000
>>
>> Skipping bad block at 0x3bfe0000
>> Erasing 128 Kibyte @ 7bf60000 - 99% complete.
>> Skipping bad block at 0x7bf80000
>>
>> Skipping bad block at 0x7bfa0000
>>
>> Skipping bad block at 0x7bfc0000
>>
>> Skipping bad block at 0x7bfe0000
>> Erasing 128 Kibyte @ 7c000000 - 100% complete.
>>
>>
>> but, log tells only about four blocks:
>>
>> [    1.549699] Bad block table found at page 524224, version 0x01
>> [    1.554241] Bad block table found at page 1048512, version 0x01
>> [    1.561314] Bad block table found at page 524160, version 0x01
>> [    1.565853] Bad block table found at page 1048448, version 0x01
>> [    1.573232] 2 ofpart partitions found on MTD device gpmi-nand
>> [    1.577688] Creating 2 MTD partitions on "gpmi-nand":
>> [    1.581499] 0x000000000000-0x000004000000 : "system"
>> [    1.595001] 0x000004000000-0x000080000000 : "user"
> 
> Now things get interesting.
> Can it be that the number of bad blocks is not stable?
> IOW sometimes 4 and sometimes 8 are reported?
> This would more or less explain what you see.

Dumps show that the two blocks per chip are really bad block tables. The
other two are empty. Could it be that the mtd reserves the other two for
bbt mirrors?

Anyway, I configured the bbt off and now there is full 15872 good PEBs
but the issue stays. Here is a dump after full erase ('nand scrub' from
U-Boot), ubiformat, ubiattach, ubimkvol -m -N user and a couple of reboots:

https://drive.google.com/open?id=1QGUIxarow3mGXbiJYgsLzc-a_Y5oN5XS

Is there any documents about the structure of fastmap blocks? google was
no friend for me...

> Fastmap does not care about bad block itself, all it cares about the total 
> number of good blocks.

How does it record the block references, absolute or relative to good
blocks?

| a | b | bad | c |

Would it record c as block 3 (as absolute) or 2 (as third good one)?

--

Timo
