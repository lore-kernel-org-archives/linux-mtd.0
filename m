Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11zuI4-0006HS-00
	for mtd-list@infradead.org; Mon, 20 Dec 1999 04:19:20 +0000
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=nero.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11zuI2-0006HM-00
	for mtd@infradead.org; Mon, 20 Dec 1999 04:19:19 +0000
Received: from news by nero.fireplug.net with local (Exim 2.04 #4)
	id 11zuLH-0002CD-00
	for mtd@infradead.org; Sun, 19 Dec 1999 20:22:39 -0800
To: mtd@infradead.org
From: sl@gateway.fireplug.net (Stuart Lynne)
Subject: Re: [Fwd: Power Down]
Date: 20 Dec 1999 04:22:39 GMT
Message-ID: <83kauf$87s$1@nero.fireplug.net>
References: <384FC311.1E57CBD6@go2fax.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

In article <384FC311.1E57CBD6@go2fax.com>, Bob Canup <rcanup@go2fax.com> wrote:
>Bob Canup wrote:
>
>> Vipin Malik wrote:
>>
>> > Bob Canup wrote:
>> > >
>> >
>> I can't see any difference between erasing a bad sector after the next power
>> up and the case of a slightly earlier power failure where the data was never
>> written in the first place; you wind up with an identical file system in both
>> cases.  If you can survive the case of the earlier power failure failing to
>> record the sector then you can survive the case of the bad sector being
>> erased.
>>
>> The only difference that I see is that in the case of the bad sector  you
>> know something happened, in the case of the data never being recorded you
>> don't.
>>
>> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>
>On the way home last night it occurred to me that if you are doing a
>read-modify-write cycle that it does make a difference where the error occurs.
>In this case if the sector is never written the old data is still valid.
>
>It seems to me the wear leveling necessary in a flash can be a benefit here; if
>I understand correctly we don't overwrite the physical pages - only when a page
>is 'committed' does the chip change its mapping so that it appears that the
>sector was overwritten.

The typical algorithm for writing new blocks into a flash system emulating a
disk device assumes that for each block you can store you have a logical
sector number and status.

    - find an empty block
    - write your data into it
    - update the old data block status to say the logical block is being moved
    - update the new data block status to show where the logical block now is
    - update the old data block status to invalidate the entry
    - start a sector erase if you need to

To read a block you look for a entry that shows the new location. If you can't find
one but did find one that was marked as being moved you fall back to that.

This gets complicated because you have to handle both sector erases and
block writes not completing from power failures. Which probably means that
you don't want to do anything to freshly erased sectors. I.e. a freshly
erased sector is identified simply because it is in its default erased
state. You can't dedicate sectors to any particular use (because you need to
load balance). 


-- 
Stuart Lynne <sl@fireplug.net>                __O 
<http://www.thinlinux.org>                  _-\<,_               604-461-7532
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00   (_)/ (_)   88 EC A3 EE 2D 1C 15 68


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
