Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcLdF-0004OT-B3
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 18:06:30 +0000
Received: by gyh4 with SMTP id 4so1173806gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 11:05:37 -0700 (PDT)
Message-ID: <4E0CBAE5.6050604@gmail.com>
Date: Thu, 30 Jun 2011 14:05:25 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Preventing JFFS2 partial page writes?
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>			
	<4E020A36.6070708@gmail.com> <1308943581.13493.15.camel@koala>		
	<4E089441.3010809@gmail.com> <1309253646.23597.58.camel@sauron>	
	<4E0A23D3.8060303@gmail.com> <1309329223.23597.116.camel@sauron>
In-Reply-To: <1309329223.23597.116.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/29/2011 02:33 AM, Artem Bityutskiy wrote:
> On Tue, 2011-06-28 at 14:56 -0400, Peter Barada wrote:
>> On 06/28/2011 05:34 AM, Artem Bityutskiy wrote:
>>> On Mon, 2011-06-27 at 10:31 -0400, Peter Barada wrote:
>>>> On 06/24/2011 03:26 PM, Artem Bityutskiy wrote:
>>>>> On Wed, 2011-06-22 at 11:28 -0400, Peter Barada wrote:
>>>>>> Thoughts?
>>>>> Sorry, could you please define the problem you are trying to solve?
>>>>> Sorry if you did define it in your long post, but I could not easily
>>>>> find it.
>>>> The problem I'm trying to solve is that the Micron NAND  I'm using has
>>>> an internal 4-bit ECC engine and uses four 8-byte ECCs that provide
>>>> 4-bit protection per 512 data bytes + four OOB bytes.  The ecclayout I'm
>>>> using is:
>>>>
>>>> ecclayout = {
>>>>            eccbytes = 32,
>>>>            eccpos = { 8, 9, 10, 11, 12, 13, 14, 15, /* ECC data bytes
>>>> 0-511 + OOB bytes 4-7 */
>>>>                    24, 25, 26, 27, 28, 19, 30, 31, /* ECC data bytes
>>>> 512-1023 + OOB bytes 20-23 */
>>>>                    40, 41, 42, 43, 44, 45, 46, 47,  /* ECC data bytes
>>>> 1024-1535 + OOB bytes 36-39 */
>>>>                    56, 57, 58, 59, 60, 61, 62, 63},  /* ECC data bytes
>>>> 1536-2047 + OOB bytes 52-55 */
>>>>            .oobfree = {
>>>>                    { .offset = 4,
>>>>                      .length = 4},
>>>>                    { .offset = 20,
>>>>                      .length = 4},
>>>>                    { .offset = 36,
>>>>                      .length = 4},
>>>>                    { .offset = 52,
>>>>                      .length = 4},
>>>>            },
>>>> };
>>>>
>>>> After the JFFS2 cleanmarker is written into bytes 4-7 and 16-23 of the
>>>> OOB, nanddump shows:
>>>>
>>>>      OOB Data: ff ff ff ff 85 19 03 20 5a e3 da 69 01 40 f1 36
>>>>      OOB Data: ff ff ff ff 08 00 00 00 91 99 3c 05 01 d0 5d b3
>>>>      OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>>>      OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>>>
>>>> Note that the ECC bytes 8-15 and 24-31 are no longer FF due to bytes 4-7
>>>> and bytes 20-23 being written with non-zero data.
>>>>
>>>> When data is later written to this same page (w/o an intervening erase
>>>> of its block) reading the page causes an uncorrectable ECC error.
>>>>
>>>> There are eight additional bytes of OOB space available for writing, but
>>>> they are not ECC'd.
>>>>
>>>> The issue I'm trying to solve is how to communicate from MTD to JFFS2
>>>> that some bytes of the oobfree array perturb the data ECC and can not be
>>>> used to write the cleanmarker.
>>> OK, thanks for explanation. I am not very good in this area as I do not
>>> have much experience dealing with OOB, but here is what I thing.
>>>
>>> 1. Linux MTD code was _not_ designed for "ECC'ed OOB".
>>> 2. I do not really know what MTD_OOB_RAW is, and the comment in mtd.h
>>>      is not very verbose.
>>> 3. But in my opinion MTD_OOB_AUTO makes most sense and should be used
>>>      everywhere except for some tricky cases when you want to test things
>>>      by writing incorrect ECC, or you have an image with ECC and you want
>>>      to flash it as is.
>>> 4. In general, OOB should be considered as belonging to the driver, and
>>>      modern software should not rely on OOB at all.
>>> 5. So MTD_OOB_AUTO make free bytes in OOB look like a contiguous buffer
>>>      which the _user_ can freely and _independently_ use.
>>> 6. In your case only this assumption does not work and your ecclayout is
>>>      incorrect because the OOB areas you expose are not independent.
>>> 7. So in your case your ecclayout should be changed and you should
>>>      expose only independent ECC bytes.
>> The independent ECC bytes available only total to eight, which makes it
>> impossible to use YAFFS (which needs at least 16 bytes to stor e its
>> metadata in).
> Are you sure YAFFS can use the dependent bytes? I am not sure, but I
> thought YAFFS wants OOB to be independently writable, no?
YAFFS2 only writes a page once so it can use dependent bytes.  I have 
YAFFS2 working with the current ECC
layout where it *only* uses the dependent bytes, and units are already 
in the field.  YAFFS1 would delete a page by writing into the OOB area a 
2nd time.
>>   I can add the independent bytes at the end of the layout
>> (and tweak YAFFS to ignore them since it needs only 16 bytes if the
>> metadata is ECC'ed), but I still need to create a fix in JFFS2 (and
>> u-boot and utilities) to skip the first 16 bytes of oobfree area.
> As I said, I think you need to take a good look at MTD and think how you
> can teach it to distinguish with dependent and independent OOB bytes.
I assume you imply that the mtd-utils need to be changed in addition to 
MTD (to at least communicate to MTD not to write OOB data into dependent 
bytes).
>> That's why I think another ioctl call (GETOOBLAYOUT?) would be useful to
>> describe the oobfree list, as well as lists(or bitfields) that indicates
>> which bytes in oobfree are either ECC'ed as part of the data ECC, or
>> ECC'ed independently.
> Why new ioctl? Why not add another OOB access type (like MTD_OOB_AUTO)?
> Or may be one of the existing can be re-use? This should be carefully
> analyzed.
Grepping through a current 2.6 kernel I don't see any way to set the OOB 
method from usersapce.  MEMSETOOBSEL only exists in 
include/mtd/mtd-abi.h and nowhere in driver/mtd.  It looks like it was 
removed way back by Vitaly Wool back in 11/2005.  The current 
MEMWRITEOOB only uses MTD_OOB_PLACE in the kernel (see mtd_do_writeoob() 
in drivers/mtd/mtdchar.c).  Would adding a field (oobtype) in struct 
mtd_oob_buf be the way to go?
>> Another issue this exposes is that JFFS2 reads/compares the cleanmarker
>> w/o any ECC in the marker data to verify its validity - if a bitflip in
>> an unECC'd cleanmarker is read back, then I think JFFS2 will fail to use
>> that block.
> No, I think what JFFS2 should do is just assume the eraseblock needs
> erasure and just erase it. The whole purpose of clean markers is to
> erase less. If it is corrupted - we just do an extra erase - not big
> deal.
How's the best way to do this?  That would make this whole problem just 
go away, and make MLC devices much more happy with JFFS2.
>> Also, from what I can find, MTD does not provide a method of programming
>> OOB NAND data using MTD_OOB_AUTO as mtd_do_writeoob (called in mtdchar.c
>> from the MTDWRITEOOB ioctl) uses only MTD_OOB_PLACE.
> Probably MTD_OOB_AUTO is just a layer on top of MTD_OOB_PLACE? Anyway,
> this whole area of OOB is complex and needs some analysis, and even
> better documentation, and then you can choose the best way to solve your
> issue.
MTD_OOB_PLACE and MTD_OOB_AUTO follow the same path and use 
nand_fill_oob() and nand_transfer_oob() to write/extract the OOB buffer 
used in the actual write.


-- 
Peter Barada
peter.barada@gmail.com
