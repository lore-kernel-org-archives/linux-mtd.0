Received: from mail-qy0-f199.google.com ([209.85.221.199])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC69J-0006RB-Qi
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 07:14:35 +0000
Received: by qyk37 with SMTP id 37so9192382qyk.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 00:14:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikbzOXYazQnxvgJNURHDD6pcc78YUt1hXU908pK@mail.gmail.com>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<AANLkTikbzOXYazQnxvgJNURHDD6pcc78YUt1hXU908pK@mail.gmail.com>
Date: Wed, 12 May 2010 12:44:32 +0530
Message-ID: <AANLkTik91qd_TZIHyldHHkLRjbKfj353SfMJg2yZ26W_@mail.gmail.com>
Subject: Re: UBIL design doc
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: rohitvdongre@gmail.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 12, 2010 at 12:33 PM, Brijesh Singh
<brijesh.s.singh@gmail.com> wrote:
> Hi,
>
> On Wed, May 12, 2010 at 12:47 AM, Thomas Gleixner <tglx@linutronix.de> wr=
ote:
>> B1;2005;0cOn Mon, 10 May 2010, Artem Bityutskiy wrote:
>>
>>> On Sun, 2010-05-09 at 01:09 +0530, Brijesh Singh wrote:
>>> > Hi,
>>> > =A0 I am forwarding you the design document for ubi with log. Please
>>> > find the ubil document at
>>> > http://git.infradead.org/users/brijesh/ubil_results/blob_plain/HEAD:/=
UBIL
>>> > design document.pdf
>>
>> @Brijesh, thanks for tackling this !
>>
>>> Hi guys,
>>>
>>> I've read the document. Looks very promising. Here some feed-back.
>>>
>>> 1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
>>> erease cycles? Won't the SB PEB wear out very quickly? Why you did not
>>> go for the chaining approach which I described in the old JFFS3 design
>>> doc?
>>>
>>> If we do not implement chaining, we should at least design it and make
>>> sure UBIL can be extended later so that SB chaining could be added.
>>
>> The super block needs to be scanned for from the beginning of flash
>> anyway due to bad blocks. Putting it into a fixed position (first good
>> erase block) is a very bad design decision vs. wear leveling.
>
> This scan is minimal once the bad blocks are marked bad. Flash driver
> generally =A0returns error by reading oob area or in ram bbt table. In co=
mparison,
> keeping super block in first few blocks may become question of availabili=
ty or
> wear-leveling trade off. The scan time for super block itself will
> take lot of time.
> In fact, in that case we won't need the super block at all. Just scan
> to find first
> chained commit block. But this doesn't look like a very good idea.
>
>> The super block must be moveable like any other block, though we can
>> keep it as close to the start of flash as possible.
>
> The idea is to get rid of scanning. A fixed place super block can
> locate movable headers.
>
>> Also chaining has a tradeoff. The more chains you need to walk the
>> closer you get to the point where you are equally bad as a full scan.
>
> As artem suggested, chaining should help in minimizing writes to
> anchor block at fixed
> location. At first instance it looked promising. But this design also
> has single point of failure.
>
>>> 2. SB PEB at the end. I think this is a very bad idea. Imagine you have
>>> to do UBIL images for production on the factory. With your design you
>>> have the following bad drawbacks:
>>>
>>> =A0 a. NAND flash has initial bad blocks, and you do not know how many,
>>> =A0 =A0 =A0and where they sit. These may be the last 8 eraseblocks. So,=
 when
>>> =A0 =A0 =A0you prepare an image (say, with the ubinize user-space tool)=
, where
>>> =A0 =A0 =A0will you put the second SB PEB?
>>>
>>> =A0 b. Currently, UBI/UBIFS images are small. E.g., if you make an
>>> =A0 =A0 =A0UBI/UBIFS image for 1GiB flash, and you have just few KiB of=
 files,
>>> =A0 =A0 =A0your image will be few megs - it will contain the files, and=
 all
>>> =A0 =A0 =A0the needed UBI/UBIFS meta-data.
>>>
>>> =A0 =A0 =A0So now what will be image size for UBIL - 1GiB, and this is =
bad.
>>> =A0 =A0 =A0You then will transfer 1GiB of data to the devices during fl=
ashing
>>> =A0 =A0 =A0or you will have to invent ways to work around this. Do you =
need
>>> =A0 =A0 =A0these complexities?
>>>
>>> I think the second SB PEB should not be at the end.
>>
>> I think we do not need a second SB at all. UBI should not depend on
>> the super block in any way. The super block is an optimization for the
>> common case - nothing more.
>>
>>> 3. Backward-compatibility. In UBIL you removed EC anc VID headers in
>>> =A0 =A0PEBs. That's fine for optimization purposes. But it has draw-bac=
ks:
>>>
>>> =A0 =A0a. If any of the UBIL meta-data blocks like SB, CMT or log are
>>> =A0 =A0 =A0 corrupted - that's it - we are screwed. You cannot anymore
>>> =A0 =A0 =A0 re-consturct the data by scanning. The robustness goes down=
.
>>>
>>> =A0 =A0c. Backward compatibility - UBI will not be able to attach UBIL
>>> =A0 =A0 =A0 images. This is not very nice.
>>>
>>> So, I think you should keep EC and VID headers in PEBs. And you should
>>> make the SB/CMT/log blocks to be a new type of UBI volume with
>>> UBI_COMPAT_DELETE or UBI_COMPAT_PRESERVE or UBI_COMPAT_RO type. In this
>>> case UBI will attach UBIL volumes just fine.
>>>
>>> Then, you can add an _option_ to have no EC/VID headers in PEBs. This
>>> then can be used for performance, if one wants to sacrifice robustness.
>>> But this should be the second step. In this case, you will just need to
>>> put a VID header with UBI_COMPAT_REJECT flag to the first PEB.
>>
>> I don't think it's a good idea to kill the EC/VID headers. It not only
>> violates the backwards compability it also fundamentally weakens UBIs
>> reliability for no good reason and I doubt that the performance win is
>> big enough to make it worth.
>>
>> The performance gain is at attach time by getting rid of the flash
>> scan, but not by getting rid of writing the EC/VID headers.
>
> These flash headers have some more problems. Like, space wastage in MLC.
> Alignment problem for byte addressable memory. Backward compatibility
> is a good idea.
> But it is possible to implement these features and higher performance
> by getting rid of them.
> It seemed a fair trade off to me. But I am open for any better solution.
>
>> The logging is a speed up / optimization for the common case, but it
>> needs to preserve full reconstruction via scanning all eraseblocks and
>> checking the EC/VID headers. That also allows retrofitting on existing
>> devices.
>>
>> I'd rather see the super block / log volume as a checkpointing
>> mechanism which provides a snapshot of the EC/VID headers at a given
>> point and a list of eraseblocks which need to be scanned at attach
>> time.
>>
>> That has two main advantages:
>> =A01) It limits the number of log writes
>> =A02) It allows full backward and forward compatibility
>>
>> Looking at
>> http://git.infradead.org/users/brijesh/ubil_results/blob/HEAD:/nand_moun=
t_time.pdf
>> I still see a linear - though less steep - attach time. For the 1GB
>> flash size it's still 0.8s which is nice progress vs. the 2s for the
>> non logging case. But that's surprising as one would expect that
>> logging would provide a more aggressive and non linear gain.
>>
>> Just doing the simple math:
>>
>> 1GB FLASH with erase block size 128K and page size 2k, that
>> translates to 8192 erase blocks
>>
>> So UBI scans 8192 erase block EC/VID headers in 2 seconds. That
>> equals to 8192 FLASH pages.
>>
>> UBIL needs 0.8 seconds. That means that UBIL still scans ~3236 FLASH
>> pages (or spends the equivivalent time) to achieve the same result.
>>
>> That looks wrong. Care to explain ?
> Very good point. The calculations are confusing me. :-) I need to check t=
his.
Sorry, for email client alignment problem. :(
