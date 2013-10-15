Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9WR-00016H-Rx
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 18:39:14 +0000
Received: by mail-vb0-f41.google.com with SMTP id g17so5400340vbg.14
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 11:38:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131015174031.E52CF380420@gemini.denx.de>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <1381393038.7875.83.camel@sauron.fi.intel.com>
 <20131015174031.E52CF380420@gemini.denx.de>
Date: Tue, 15 Oct 2013 20:38:47 +0200
Message-ID: <CAFLxGvzSdQUxPNK6Wxv=maPv0w-mpNGE7M18CyinS9CP+r2yqg@mail.gmail.com>
Subject: Re: Grow UBI device?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Wolfgang Denk <wd@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 7:40 PM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Artem,
>
> In message <1381393038.7875.83.camel@sauron.fi.intel.com> you wrote:
>> Wolfgang, people already answered you, and frankly I did not read all
>> the answers :-) But here is my brief version.
>
> Thanks.
>
>> On Tue, 2013-10-08 at 21:28 +0200, Wolfgang Denk wrote:
>> > I'm looking for a clever way to migrate devices (in the field) from
>> > JFFS2 to UBI/UBIFS.  In the end result, I want to have single UBI
>> > device (which covers the whole NAND chip) with several volumes used
>> > with UBIFS.  Unfortunately I must keep some of the existing data.
>>
>> And I guess there is no temporary storage where you could copy JFFS2
>> files, re-format the flash, and copy the files back.
>
> Correct.
>
>> > It would be nice if I could start with a UBI device that is smaller
>> > than the NAND, so I can keep an existing MTD partition with a JFFS2
>> > file system.
>>
>> You mean that on the existing systems, you already have an extra MTD
>> partition, or you somehow can create one.
>>
>> Then you want to UBI/UBIFS-format the extra partition. Then copy
>> required JFFS2 files there. And then kill JFFS2 partitions and "merge"
>> them with the extra partition, and end up with UBI/UBIFS covering all
>> the space.
>
> Correct.
>
>> > Is there a way to "grow" the existing UBI device so that it now also
>> > covers the rest of the NAND chip?  Or is my only option to create a
>> > second UBI device?
>>
>> I think so, unless you use the fastmap feature. Suppose you don't.
>
> We don't.  We may want to do this later, but certainly not during this
> migration steps.
>
>> 1. Format mtd2 with UBI. Just erasing should be OK, or you can use
>> ubiformat: http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubierase
>>
>> Then you attach mtd2 (ubiattach) and you get an UBI device (/dev/ubiX).
>>
>> 2. Create a volume on /dev/ubiX which spans entire UBI device
>> (ubimkvol -t AFAIR). You end up with UBI volume /dev/ubiX_0.
>>
>> 3. And here is important part - you format /dev/ubiX_0 with JFFS2 but
>> correctly.
>
> With JFFS2?  I would expect to see "UBIFS" here?

Yes, UBIFS.

>> UBIFS has this "automatic expand" feature. Which means that if the UBI
>> volume underneath it becomes larger, UBIFS will expand automatically and
>> take the entire (larger) UBI volume.
>>
>> However, there is a _limit_ to how much UBIFS can expand from the
>> original size. And you want to watch this limit and make it big enough.
>>
>> The limit is connected with the "-c" option of mkfs.ubifs. Please, check
>> the docs - they explain what exactly -c controls and how it is related
>> to the maximum UBIFS file-system size:
>>
>> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
>>
>> So, select proper -c.
>
> Thanks for the poointer.  I would have missed this.
>
>> If you do not use mkfs.ubifs, but just attach /dev/ubiX_0, the UBIFS
>> kernel driver will format the volume automatically. It will select the
>> -c value itself. Since this value is power of 2, it will just take the
>> smallest power-of-2 value. It may be OK for your purposes, may be not.
>> It is safer to use mkfs.ubifs with explicit -c.
>
> Agreed.  It would have worked in our case, as mtd1 is 32 MB and mtd2
> is 96 MB on a 128 MB NAND device, but it's much better to have full
> control.
>
>> 4. Copy important files from JFFS2-mtd1 to UBIFS-UBI-mtd2.
>>
>> 5. Erase mtd1 (or you can do this later too)
>>
>> 6. I do not know how you do this, but kill mtd1, and resize mtd2.
>> Probably mtd2 will then be named mtd1 after reboot. If you always refer
>> your MTD partitions and UBI volumes by name, you should not suffer to
>> much from mtd2 becoming mtd1.
>
> The plan is to just have another mtd3 which covers the whole device.
> So I would detach UBI from mtd2 and re-attach to mtd3.
>
>> Lets suppose there is no rename, for simplicity.
>>
>> 7. Make sure former JFFS2-mtd1 eraseblocks are erased (unless you did
>> this at step 5).
>>
>> 8. Attach mtd2 to UBI. UBI will automatically "take" the new
>> eraseblocks, erase them and write UBI headers there, and make available.
>>
>> 9. Volume size will still be the same, and you need to re-size it using
>> ubiresize.
>>
>> 10. Mount the resized volume. UBI will enlarge itself.
>
> That's just amazing :-)
>
>> Problem solved.
>>
>> Surely you do not want power cuts during this operations. If you need to
>> survive power cuts, I guess it is possible, but more complex.
>
> Thanks a lot for all the help, it's highly appreciated!
>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> "At least they're __________EXPERIENCED incompetents"
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
