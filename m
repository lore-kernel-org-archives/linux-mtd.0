Received: from lime.solrad.nl ([213.193.238.107])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MR1OY-0003ui-7Z
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 10:07:32 +0000
Message-ID: <4A5DAA5A.3010101@youcom.nl>
Date: Wed, 15 Jul 2009 12:07:22 +0200
From: Jelle Martijn Kok <jmkok@youcom.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBI resizing
References: <4A5B4EC7.9010605@youcom.nl>
	<1247565935.3828.136.camel@localhost.localdomain>
In-Reply-To: <1247565935.3828.136.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the reply,

Note that it will not be a real issue if (automatic) resizing is not 
possible the way I would prefer. It would waste 2-4 MB of flash, but 
that would be wasted also if I would not use UBI to place the kernel in 
(but as raw image on the nand flash). UBI and UBIFS itself work like a 
sunshine on my CPU and nand flash.

I just pull a piece of your reply to the front as this best describes my 
need for the (automatic) resizing.
 > create a special temporary throw-away volume, write stuff there, then 
re-name it to an existing one.

I create a "temporary throw-away volume" with the following command: 
'ubimkvol /dev/ubi0 -n 2 -N "temp" -t static -s 2MiB'
However for this to succeed I would need to have 17 available PEBs. I 
would only ever need those during the upgrade, so during the rest of the 
time I could not (easily) use these PEBs.
I also have to predefine the maximum size of the kernel. What will the 
size be at the time we are on "kernel 2.8.90" ? Will it still fit the 
2MB I appoint at this moment.

I do actually see the following scenario viable:
- ubimkvol /dev/ubi0 -n 2 -N "temp" -t static
(so I do not set the size)
- wget http://server.com/kernel.bin -O /dev/ubi0_2
(I do realize that this opens another discussion of not using 
ubiupdatevol at all, let's place that in a seperate thread)

 > But what exactly would you like to have? Would you like to have UBI
 > volumes with no size at all - unbounded / unlimited? Or you would like
 > to have UBI volumes with size, but larger than the amount of available
 > PEBs?

Ultimately all volumes would be able to access all available PEBs. So 
all UBI volumes mention the same amount of available PEBs (and not more 
than the total amount).
However an application might thus not assume that all data is truly 
available. (see below)
I do realize that UBI itself is not a filesystem, and UBIFS might have 
other requirements and expectations of UBI. (as you mention "UBI 
guarantees that all LEBs may be written to at the same time").

 > Still not sure how would this all work. What df would show? If we do not
 > guarantee we have enough PEBs for each LEB, so UBI would basically does
 > overcommitments, how do we handle situations when users want to write
 > more but we do not have PEBs left?

This is the same as your own machine does, assuming you are using a 
"correct" operating system ;-). In my case I have several mounted NFS 
partitions, which actually also "lie" about their available space. But I 
also do not trust the  of total amount of available space in the ram 
drives (tempfs / udev etc...) as this is much more than the amount of 
RAM in my machine.

 > So your boot-loader understands UBI?

Yes, I could sent it to you (in due time) as a code snippet. The code 
itself always needs to be tailored a bit for nice integration into a 
bootloader.
The UBI loader uses currently around 800 bytes (ARM9) excluding the 
crc32 code (which contains a large table) and the nand code (which is 
boorloader specific). This code could still made somewhat smaller if 
your remove some things, or much smaller if you do not use "ubi volume 
names" but "ubi volume ids" directly. But it might grow if I'll add a 
cached scan table (I currently scan the whole MTD twice).

 > So you want atomic volume upgrade. You could implement a new ioctl for
 > this and do something like: create a special temporary throw-away 
volume, write stuff there, then re-name it to an existing one. I think
 > this is doable. But of course, you would need to carefully think about
 > accounting: if the volume becomes larger after upgrade, you need to make
 > sure you have spare PEBs.

Indeed, I currently do this in a simple shell script. "ubimkvol" => 
"wget" => "ubiupdatevol" => "ubirename" => "ubirmvol"
The "temporary throw-away volume" becomes the true volume after the 
rename. That is also the reason that our bootloader loads a specific 
volume name (and not simply loads a volume id)

Jelle Martijn Kok


On 14-07-09 12:05, Artem Bityutskiy wrote:
> Hi,
>
> On Mon, 2009-07-13 at 17:12 +0200, Jelle Martijn Kok wrote:
>> I have made an "ubirsvol" application (actually it are just some very 
>> simple changes to your ubimkvol/ubirmvol). If you would like to have it, 
>> I could sent it.
>>     
>
> Sure, why not to have it in ubi-utils?
I'll sent it to you, so you can drop it in.
>
>> Question 1: Why do UBI volumes have fixed sizes ?
>>     
>
> Hmm, we just designed it this way. We wanted to guarantee that the total
> about of LEBs on UBI device is not larger that the amount of available
> PEB, so that you could write data to all LEBs.
>
>> As far as I can see, all unused PEBs only have their EC headers are 
>> written in the MTD. The volume headers are left unwritten.
>>     
>
> Right.
>
>> Only PEBs which are attached to a specific volume have their volume 
>> header set.
>>     
>
> Yes. Some LEBs are mapped and contain data, so the corresponding PEBs
> have the VID header. The unmapped LEBs are not associated with any
> PEBs. So there are PEBs which do not have VID header.
>
> But UBI guarantees that all LEBs may be written to at the same time -
> there are enough PEBs reserved.
>
>> Is it correct that all unused PEBS are in a pool for the whole ubi 
>> device, and not in a pool per ubi volume ?
>>     
>
> Correct. Every PEB may be used for any LEB in any volume. When you write
> to an un-mapped LEB, the wear-levelling subsystem will pick an
> appropriate PEB.
>
>> I do understand that this might make it much harder for UBIFS to 
>> determine its available space as it could actually mean that two UBIFS 
>> filesystems which are mounted on the same ubi (eg. ubi0_0 and ubi0_1) 
>> might see the same amount of available LEBs, and thus UBIFS shows twice 
>> as much space. However this might be very similar as mounting the same 
>> harddrive on your system twice.
>>     
>
> UBIFS really needs to know size of the volume it sits on. UBIFS has
> per-LEB data (lprops, or LEB properties) stored in LPT (lprops tree).
> The size of the tree depends on volume size. And we reserve certain
> amount of LEBs for LPT at the beginning of the volume.
>
> But what exactly would you like to have? Would you like to have UBI
> volumes with no size at all - unbounded / unlimited? Or you would like
> to have UBI volumes with size, but larger than the amount of available
> PEBs?
>
>> Question 2: Can UBIFS handle UBI resizes easier ?
>>     
>
> Somewhat, but we did not pay much attention to this feature, because
> we did not need it.
>
> In UBIFS we have LPT which is a B-tree. We try to keep it as small as
> possible, because it is changed a lot. The tree nodes are packed very
> nicely, so that we use bit-fields as pointers there. UBIFS has to
> reserve some space for this tree. And the amount of space it reserves
> limits the LPT limits its maximum size. Here is text which tells
> about this a bit.
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
>
> Note, small LPT area also means faster LPT handling, because in this
> case the keys in the LPT nodes are shorter.
>
>> I have not looked at all at the inner working of UBIFS, so I do not dare 
>> to say anything sensible.
>>     
>
> Well, in short:
>
>   * it is easy to enlarge UBIFS. Just select proper -c option.
>   * to shrink UBIFS, you need a special user-space utility, or you
>     need to implement a special UBIFS "shrink" ioctl. When shrinking,
>     you need to ask UBIFS to move data from last LEBs closer to the
>     beginning of the volume (or do this with a user-space utility,
>     but this is more difficult to implement).
>
>> However making the UBI volume smaller, makes UBIFS complain that the 
>> amount of LEBs is incorrect.
>>     
>
> Yes, because UBIFS stores the volume size in the super-block. And 
> actually in master node. For sure this redundancy is insane, and
> I wanted to fix this, but then I realized it is too late to change
> the on-flash format.
>
> Anyway, a small ioctl which asks UBIFS to shrink needs to be done.
> But I think it must not be too difficult to implement. It is about:
>
> 1. Garbage-collecting as much as possible to get rid of dirty space.
> 2. When garbage collect, do this a little differently than usually,
>    and you should move data to the beginning. Even LEBs with no dirt
>    but which sit at the end should be moved to the beginning with GC.
>
> I mean, most of the code to do this is there already.
>
>> I encountered (in ubidesign.pdf) "Note, that by default UBI will not 
>> reduce the size of dynamic volumes unless the number range of logical 
>> erase blocks which will be removed from the volume contains only unused 
>> blocks. A specical parameter allows to override this default.".
>> What is this "special parameter" ?
>>     
>
> I'm not sure. Probably Adrian knows?
>
>> If UBI (and UBIFS) sizes would become non-fixed, it would prevent the 
>> need for resizing at all. 
>>     
>
> Not sure what exactly you mean. UBI volumes are re-sizable. UBIFS may
> be shrinked with some tricks.
>
>> It might ease the usage of ubi, for example:
>> - When creating ubi images (for production) the ubi size does not 
>> matter. (UBI_VTBL_AUTORESIZE_FLG could ultimately be removed)
>> - ubimkvol, can be called without specifying any size.
>> - no more wasted space in static volumes.
>> - bad blocks may be handled easier, as it can simply access the complete 
>> pool. No block have to be reserved on front (UBI might however best not 
>> hand out those last 10 PEBs)
>>     
>
> Still not sure how would this all work. What df would show? If we do not
> guarantee we have enough PEBs for each LEB, so UBI would basically does
> overcommitments, how do we handle situations when users want to write
> more but we do not have PEBs left?
>
>> We currently have the following (working) setup (similar like 
>> ubidesign.pdf - chapter 8):
>> - We are using a 1024 blocks 128MB nand flash.
>> - MTD in 2 partitions
>>     - MTD0 contains the bootloader (1 block)
>>     - MTD1 contains 1023 blocks in ubi0 (actually 1022 blocks as we are 
>> blessed with a bad erase block)
>>     
>
> Well, on other silicons you may be blessed with more :-)
>
>> - ubi0 contains 2 volumes.
>>     - ubi0_0 which is the root file system (UBIFS on a dynamic volume)
>>     - ubi0_1 is the kernel (static volume)
>> - The bootloader loads the kernel from the mtd (ubi0). Note: it 
>> explicitly uses the volume name ("kernel") and not the volume_id to find 
>> the static volume containg
>>     
>
> So your boot-loader understands UBI?
>
>> However the limitations currently are:
>> - I cannot place the kernel in the rootfs as I do under no circumstance 
>> want to implement UBIFS in the bootloader.
>>     
>
> Well, u-boot has R/O UBIFS support. But they basically copied UBIFS
> from the kernel. Implementing this from scratch is not easy.
>
>> - I do not simply want to run ubiupdatevol on the kernel volume (ubi0_1) 
>> as this might leave the kernel unusable
>> - For this to be safely possible I want to write the new kernel into 
>> ubi0_2 (named: "new").
>> - I could then do an (atomic) "ubirename /dev/ubi0 new kernel kernel 
>> old" and the new kernel is active
>> - I do not wish to have that volume always present (and waste space)
>> - I do at this moment not yet know the size of future kernels.
>>     
>   
> So you want atomic volume upgrade. You could implement a new ioctl for
> this and do something like: create a special temporary throw-away 
> volume, write stuff there, then re-name it to an existing one. I think
> this is doable. But of course, you would need to carefully think about
> accounting: if the volume becomes larger after upgrade, you need to make
> sure you have spare PEBs.
>
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
>         
>
> ------------------------------------------------------------------------
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
