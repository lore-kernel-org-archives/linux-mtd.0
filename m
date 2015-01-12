Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAaTq-0004BA-Bt
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 08:36:11 +0000
Message-ID: <54B386C9.7050401@atmel.com>
Date: Mon, 12 Jan 2015 16:33:13 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>	<54A359AE.3080105@atmel.com>	<CALupW3D=q9wSTUxCAp9EVDjd5LwPOhJOYbV9OL0QVJd4G1nH2A@mail.gmail.com>	<54A8B91B.1090604@atmel.com>
 <CALupW3B13bd+oPgXL2oZ7ECTjYE0-q6uj8Y-WZA-ggjwLtCgoQ@mail.gmail.com>
In-Reply-To: <CALupW3B13bd+oPgXL2oZ7ECTjYE0-q6uj8Y-WZA-ggjwLtCgoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: ricard.wanderlof@axis.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 ezequiel@vanguardiasur.com.ar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Steve

On 1/9/2015 1:05 PM, Steve deRosier wrote:
> Hi Josh,
>
> On Sat, Jan 3, 2015 at 7:52 PM, Josh Wu <josh.wu@atmel.com> wrote:
>> Hi, Steve
>>
>> On 1/3/2015 2:06 AM, Steve deRosier wrote:
>> There seems has some UBI fix on 3.8.x stable tree. It is better if you can
>> apply these fixes.
>>
>> ➜  mainline git:(99f3cd5) ✗  git log --oneline v3.8..v3.8.13 | grep -i UBI
>> 1afae69 UBIFS: make space fixup work in the remount case
>> d90dc15 UBIFS: fix double free of ubifs_orphan objects
>> ce7f4e8 UBIFS: fix use of freed ubifs_orphan objects
> Will do!  I had pulled in a number of other upstreamed fixes but these
> must be newer than last time I looked. Thanks!
>
>
>
>> For at91sam9x5ek PMECC, we cannot do pmecc correction for the erased
>> page(all 0xff) if there has some bit flips.
>> The reason is 9x5ek PMECC will generate non-0xff ecc code for the erased
>> page(all 0xff in the page).
>>
>> This will case issues:
>> 1. if there is any bitflip happen in erased page's oob area, that will cause
>> PMECC error.
>> 2. if there is any bitflip happen in erased pages' data area, This bitflip
>> cannot be correct. And driver won't report any ECC error. I am not sure
>> whether this can cause problem? As the UBI  may record the erased page, so
>> the data corruption maybe doesn't matter. When UBI write data to this
>> bitfliped erased page, as the PMECC code will write correctly into oob area.
>> So this bitflip can be corrected by PMECC hardware.
>>
>> I think you can manually insert bitflip into the erased page to see whether
>> this cause your issue.
> Well, our issue is clearly caused by the use of `nandflash -n`.
> Moving to ubiformat fixes it.
>
> But, what you pointed out made me interested in a few more problem scenarios:
>
> 1. Bitflip in ECC data of a valid data page
> 2. Bitflip in data area of an erased page
> 3. Bitflip in the ECC data of an erased page.
>
> So I tried them.  I was hoping for the best and fearing the worst.
> Thankfully I effectively got the best.
> 1. This was the scary one for me. But, it seems that this is handled
> nicely by the ECC process. dmesg printed:
>      atmel_nand 40000000.nand: Bit flip in OOB, oob_byte_pos: 48,
> bit_pos: 0, 0xec -> 0xed
> This is awesome, it found the flip, identified where it was and fixed it. Yay.
Yes. In this case, since ECC and data (512 bytes) sector or block 
combined into a code word.
any bitflip happened in the code word can be corrected.

So that means if only let PMECC driver to operate the oob, e.g. all used 
oob data is ECC and it's part of code word.
Then the bitflips in PMECC's capability can be corrected.

>
> Both 2 and 3 were non-events.  As near as I could tell, UBIFS and the
> MTD system ignored those. I have some special code that noticed it,
> but none of the stock stuff did.  Writing and reading data there
> worked fine.  And, I'd expect that if the flip caused a flip in data
> that was written and later corrected, it would be fine.
This test result sound good to me. Actually I am worry about this kind 
of situation.
I don't check the UBI code details, but I guess this is because the UBI 
will record the erased pages. So UBI don't read the erased page at all. 
UBI only write data into it.

Best Regards,
Josh Wu

>
>> These seems ok.
>> Be caution: if you use 1024 as sector size, you need apply the fix:
>> 2fa831f9db1f <mtd: atmel_nand: pmecc: fix failure to correct bit error in
>> 1024-bytes sector>
>>
> Thanks for the heads up on this fix.  We're using 512, but after
> reading some stuff, I'm thinking that going to 1024 might make some
> sense, so I might need that.
>
> Thanks,
> - Steve
