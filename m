Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frh0F-0002V7-Nv
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 10:01:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id a108-v6so9808421wrc.13
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2018 03:01:29 -0700 (PDT)
Received: from [172.16.46.1] (ip-135.net-89-2-50.rev.numericable.fr.
 [89.2.50.135])
 by smtp.gmail.com with ESMTPSA id s13-v6sm2772865wrq.39.2018.08.20.03.01.26
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Aug 2018 03:01:26 -0700 (PDT)
Subject: Re: [RFC PATCH] UBI fixable bit-flip issue
To: linux-mtd@lists.infradead.org
References: <1bcbe82a-85e5-52f8-dc54-9d22e5b390fa@digivation.com.au>
 <20180817102559.7ab14fd9@bbrezillon>
 <227ad167-4e57-638d-a4cb-1e82613de2bc@digivation.com.au>
 <20180817165322.61958720@bbrezillon> <20180817172246.45fa784c@bbrezillon>
 <32f5f211-5ae3-6088-ba38-b7ebb7e24f8e@digivation.com.au>
 <20180820103614.3118ecb3@bbrezillon>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <afb8ad28-38fb-6695-c661-0a719dc604ce@gmail.com>
Date: Mon, 20 Aug 2018 12:01:25 +0200
MIME-Version: 1.0
In-Reply-To: <20180820103614.3118ecb3@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

This issue reminds me a similar one I had, also with Macronix devices.
Quickly:
- some blocks are prone to bit errors just after writing.
- those PEB are frequently queued for torture, but torture always pass.
- In fact, the torture test pass mostly because errors appear on some 
page when writing other pages of the same PEB. Since the patterns used 
for testing are too simple (same patterns for every page), the torture 
test doesn't catch the issue.

Details here:
http://lists.infradead.org/pipermail/linux-mtd/2016-April/066628.html

Since my projects have changes I didn't get a chance to work again on 
the subject.... :-(

Arnaud

On 20/08/2018 10:36, Boris Brezillon wrote:
> Hi Mark,
>
> On Mon, 20 Aug 2018 10:40:14 +1000
> Mark Spieth <mspieth@digivation.com.au> wrote:
>
>> On 18/08/18 01:22, Boris Brezillon wrote:
>>> On Fri, 17 Aug 2018 16:53:22 +0200
>>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>>>   
>>>> On Sat, 18 Aug 2018 00:33:25 +1000
>>>> Mark Spieth <mspieth@digivation.com.au> wrote:
>>>>   
>>>>>>> I hope this description is clear enough.
>>>>>> Well, I think selecting the bitflip threshold properly is really
>>>>>> important, simply because some NANDs (including SLC NANDs) are showing
>>>>>> bitflips even on blocks that have a low EC. Check the NAND ECC
>>>>>> requirements, and if it's something like 8bit/512bytes, I guess that's
>>>>>> more or less expected (it all depends on how many bitflips you have in
>>>>>> the faulty block). It's less likely on NANDs requiring 1bit/512bytes
>>>>>> ECC, and if that happens on such NANDs, you may have a problem in the
>>>>>> controller driver.
>>>>> 4 bits ECC per 512 bytes, from memory 28 bytes in OOB, using software
>>>>> ECC in the MTD driver.
>>>>> As I said, I believe the better threshold is hiding the root cause. It
>>>>> is only a band-aid.
>>>> What you describe will anyway happen sooner or later: if you're using
>>>> almost al LEBs, and the remaining free ones are all impacted by the
>>>> correctable bit-flip issue you'll have to use them anyway. So, yes,
>>>> this is a band-aid, just like your solution is just improving things
>>>> but not really solving the issue. This being said, if the blocks
>>>> really show too many bitflips, they should be marked bad at some point,
>>>> because during the scrubbing process we do write a pattern and check
>>>> that we can read it back. I'll have to double check, but I think we're
>>>> also checking for EUCLEAN and mark the block bad when that happens.
>>> Hm, actually we're not torturing the source PEB when moving a LEB
>>> because of bitflips (probably because it's expensive and tends to wear
>>> the block even faster) :-/. The destination PEB is tortured if we fail
>>> to read the VID header back, which is definitely not a guarantee that
>>> other data are readable or do not contain too much bitflips.
>>>
>>> There's definitely something to improve there.
>> Hi Boris,
>>
>> The flash in use is a Macronix MX30LF1G18AC and uses ONFI mode.
>>
>> My understanding of the problem is that when a block is read (say
>> kernel+initrd) and one of the PEBs reads ok but with corrected bit
>> errors, scrub mode is enabled.
>> It then finds a suitable PEB to copy it to which it does. It then
>> verifies this copy and also detects a corrected bit error, and frees the
>> PEB it copied it from as it read ok, but with corrected errors. It then
>> finds a suitable PEB to copy it to, and finds the original PEB that it
>> moved it from! Does the whole copy and readback verify with corrected
>> errors.
> You're correct, but it seems Linux is no longer reading back the data
> since commit 1e0a74f10d76 ("UBI: Don't read back all data in
> ubi_eba_copy_leb()"). Not sure this was such a good idea to drop this
> test :-/.
>
>> This continues forever (or until the PEB does not verify which
>> could be a while). Naturally the block read never completes.
> Well, Linux and uboot are a bit different in this regard. When you
> schedule a block for erasure, the real erase operation is done in a
> separate thread in Linux. Since uboot has no thread support, the erase
> operation is done right away, and the block goes back in the free map
> immediately, thus leading to an infinite loop if the first 2 PEBs in the
> map are prone to bitflips.
>
> Note that I'm not saying we shouldn't make things better for Linux too,
> just trying to explain why the infinite loop issue should not happen in
> Linux. Still, even Linux would keep moving LEBs around which we
> definitely don't want.
>
>> This is the behaviour I observed in the older driver with lots of print
>> debugging. This may not be the behaviour in the current master, but I
>> suspect it is.
> The problem seems to be present in mainline (uboot).
>
>> Some way of detecting this loop in a scrubbing session would be optimal,
>> but seems complex to do from my examination of the UBI scrubber. But it
>> shouldnt require a persisted header change.
> Except you're only fixing the case where you still have blocks without
> such inherent bitflips (probably stuck bits), but what if all the
> blocks in the free pool are subject to this symptom.
>
> Really, we have the bitflip threshold concept for a reason, and setting
> it to 1 when your engine is capable of fixing 4 bitflips sounds a bit
> too extreme.
>
> Also, when we realize the block we're trying to use shows too many
> bitflips (above the threshold) just after writing something into it,
> then it's probably time to stop using it (and mark it bad). That's what
> the torture_peb() function is supposed to do.
>
> Regards,
>
> Boris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
