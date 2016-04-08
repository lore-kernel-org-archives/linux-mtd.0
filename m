Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoSJK-0004Rs-Li
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 09:02:39 +0000
Received: by mail-wm0-x229.google.com with SMTP id u206so14071848wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 02:02:18 -0700 (PDT)
Subject: Re: [RFC] UBI torture test fails to detect some bad blocks.
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 peterpansjtu@gmail.com
References: <1460100214-31298-1-git-send-email-arnaud.mouiche@invoxia.com>
 <57076AAB.7050008@nod.at>
From: "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>
Message-ID: <57077396.1010009@invoxia.com>
Date: Fri, 8 Apr 2016 11:02:14 +0200
MIME-Version: 1.0
In-Reply-To: <57076AAB.7050008@nod.at>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Le 08/04/2016 10:24, Richard Weinberger a écrit :
> Hi!
>
> Am 08.04.2016 um 09:23 schrieb Arnaud Mouiche:
>> Hi all.
>>
>> Just some details about what I experience recently with some bad blocs on
>> a MX35LF1GE4AB spinand device (SLC, 1Gb, 4bits ECC per 512 sub-page),
>> where a UBI partition is attached to manage rootfs & co  (as usual).
>>
>> I get the hand on some devices refusing to boot.
>> The analyse of the Erase Counters shows that some of them where erased
>> more than 100K, while the majority have an EC below 20 !
> Ouch.
>
>> Looking at the bad one, they run the following scenario nearly in loop:
>> - linux read some file inside the rootfs
>> - a bitflip is detected
>> - scrubbing is scheduled.
>> - the scrubbing target a PEB with a pretty high EC,
>> - this high EC is also due to frequent bitflip in the target PEB in the past.
>> - while the PEB data are moved, a bitflip is detected scheduling a torture test.
>> - the torture test *ALWAYS* pass (whereas bitflip are *VERY* frequent for
>>    the same PEB when the read comes filesystem read).
>>
>> So, it seems obvious the PEBs in question are bad PEBs.
>> The question is now why the torture test pass.
>>
>> Reproducing the pattern test by hand on this block shows the same result.
>> But applying different patterns on different pages within the block shows that
>> the content of some pages are affected by the content of the other pages.
>> In particularly, for this block, if the first page is full of FF and the rest
>> of the block is full of 00, I can count  more than 100 bitflips (!)
> 100 flips per ECC step? Shouldn't this lead to a uncorrectable ECC error?
yes, the hardware ECC obviously says "I can't manage".
I just compare the expected pattern (FF) with the page content when read 
without ECC.
> I have no idea how much bits your ECC can fix..
4 bits per 512 bytes. which looks large enough for SLC. And since the 
ECC hardware is embedded inside the spinand chip, we can expect the 
manufacturer to have correctly chosen its strength.
> Which bitflip threshold do you have? UBI sees bitflips only after a threshold
Yes I noticed that.
In the early Nand datasheet, the ECC status register just says "no 
errors" or "1-4 corrected bits" or "uncorrectables bits".
So the threshold was set to 1 at this time.
Then I change the driver implementation in case of "1-4 corrected bits" 
to read back the page without ECC and count the exact numbers of errors.
So now, the threshold is set to 3.

> is reached. If it is too low, UBI scrubs too often, which seems to be the case here.
> It is perfectly fine to have bitflips.
>
> So, we need dig a bit deeper first.
>
>> What kind of pattern should be added to detect those kind of issues ?
> This is a very hard question and almost impossible to answer as it is vendor
> specific.
>
>> We can think of testing every page one by one, but given the relatively large
>> number of pages in a block, it doesn't sound realistic.
>> The easiest way could be to use a random pattern, and try it a relative low
>> number of times.
>> Indeed, this simple random test is efficient to detect every bad block of this device.
>> If the random test pass once (because this is a random test), there are chances
>> that the next bit flip detection will trigger a new torture test, and at the end,
>> it will be finally detected as bad.
> Having an additional random pattern is not a bad idea.
> This is definitively something we can consider adding to UBI.
> But I'm not happy with your implementation.
>
> peb_rnd_buff = kmalloc(ubi->peb_size, GFP_KERNEL);
> ... is a big no-no. peb_size can be a few megabytes.
>
> What about repeating a few random bytes over and over?
You must not repeat the same page content, otherwise, pages don't affect 
the others.
But is is true we can fill ubi->peb with a repeated random pattern of a 
prime length (eg. 353 bytes). so it is short enough to do a small kmalloc.

Otherwise what we can do is to simply:
- fill ubi->peb_buf with our random pattern
- ubi_io_write(ubi, ubi->peb
- ubi_io_read(ubi, ubi->peb...
- and just trust the ubi_io_read result
The memcmp is actually a paranoid check isn't it ?

Regards,
Arnaud

>
>> And the implementation is pretty obvious...
> ;-)
>
> Thanks,
> //richard
