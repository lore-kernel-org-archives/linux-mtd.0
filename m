Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLs8a-0000de-VP
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 14:54:31 +0000
Subject: Re: Mounting issue with old rootfs and new kernel
To: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <CAFLxGvwW_1ydC9XHFG+-UvY_L=h9TLQ5Eh0jgcGBPFyU9qf0-w@mail.gmail.com>
 <e144d66c-c754-ad6d-bd0c-ef5384ae7a78@nedap.com>
 <6030766.nKoDj6T6s8@blindfold>
 <a69fc400-dea4-e3e9-9b86-423fdfd8289c@nedap.com>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <c08a36e5-10ac-29ae-46d7-d598068dd897@nedap.com>
Date: Mon, 4 Dec 2017 15:54:03 +0100
MIME-Version: 1.0
In-Reply-To: <a69fc400-dea4-e3e9-9b86-423fdfd8289c@nedap.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01-12-17 15:26, Jaap de Jong wrote:
> 
> 
> On 30-11-17 17:20, Richard Weinberger wrote:
>> Jaap,
>>
>> Am Donnerstag, 30. November 2017, 16:42:33 CET schrieb Jaap de Jong:
>>> Hi Richard,
>>>
>>> On 30-11-17 16:28, Richard Weinberger wrote:
>>>> Jaap,
>>>>
>>>> On Thu, Nov 30, 2017 at 4:22 PM, Jaap de Jong <jaap.dejong@nedap.com>
>> wrote:
>>>>> Hi
>>>>>
>>>>> I'm hoping for some pointers.
>>>>>
>>>>> I have this a created with openembedded classic.
>>>>>
>>>>> It works just fine when running with an old kernel (2.6.35)
>>>>>
>>>>> Now with the same rootfs and a newer kernel (4.9.28) it damages the 
>>>>> old
>>>>> rootfs in such a way that it becomes unusable.
>>>>>
>>>>> This is the error it shows:
>>>>>                           [    1.523437] ubi0 error:
>>>>>                           ubi_read_volume_table: the layout volume was
>>>>>                           not found [    1.531250] ubi0 error:
>>>>>                           ubi_attach_mtd_dev: failed to attach mtd3,
>>>>>                           error -22>
>>>> Are these really the only erros/warnings from UBI?
>>>
>>> Yes. Also ran it without 'quiet' as kernel parameter and that also does
>>> not show extra errors.
>>
>> Hm, but U-Boot comes first? Maybe it damaged the UBI image already.
> That is the same U-Boot as before which didn't damage the rootfs.
> Also U-boot is still able to mount and read files from it even after it 
> has been damaged by the new kernel.
> 
> So what do I have so far?
> 1) flash a unit with uboot, old kernel and old rootfs, boot it --> fine
> 2) flash a unit with uboot, new kernel and new rootfs, boot it --> fine
> 3) flash a unit with uboot, new kernel and old rootfs, boot it --> fine
> 4) as with 1) but afterwards boot it with new kernel --> rootfs damaged
> 
>>
>>> If I boot u-boot and try to mount it there, some other errors are show
>>> although basically the same
>>>
>>>      U-Boot> ubi part rootfs
>>>      UBI: mtd1 is detached from ubi0
>>>      Creating 1 MTD partitions on "nand0":
>>>      0x000000100000-0x000020000000 : "mtd=3"
>>>      UBI: attaching mtd1 to ubi0
>>>      UBI: physical eraseblock size:   131072 bytes (128 KiB)
>>>      UBI: logical eraseblock size:    129024 bytes
>>>      UBI: smallest flash I/O unit:    2048
>>>      UBI: sub-page size:              512
>>>      UBI: VID header offset:          512 (aligned 512)
>>>      UBI: data offset:                2048
>>>      UBI: attached mtd1 to ubi0
>>>      UBI: MTD device name:            "mtd=3"
>>>      UBI: MTD device size:            511 MiB
>>>      UBI: number of good PEBs:        4088
>>>      UBI: number of bad PEBs:         0
>>>      UBI: max. allowed volumes:       128
>>>      UBI: wear-leveling threshold:    4096
>>>      UBI: number of internal volumes: 1
>>>      UBI: number of user volumes:     1
>>>      UBI: available PEBs:             40
>>>      UBI: total number of reserved PEBs: 4048
>>>      UBI: number of PEBs reserved for bad PEB handling: 40
>>>      UBI: max/mean erase counter: 2/0
>>>
>>>      U-Boot> ubifsmount rootfs
>>>      UBIFS error (pid 0): ubifs_read_node: bad node type (255 but 
>>> expected 6)
>>> UBIFS error (pid 0): ubifs_read_node: bad node at LEB 0:0
>>>      Error reading superblock on volume 'ubi:rootfs'!
>>>
>>>>>                           [    1.539062] UBI error: cannot attach mtd3
>>>>>                           [    1.546875] Kernel panic - not 
>>>>> syncing: VFS:
>>>>>                           Unable to mount root fs on 
>>>>> unknown-block(0,0) [
>>>>>                              1.546875] Rebooting in 1 seconds..RomBOOT
>>>>>
>>>>> As far as I can see the kernel configuration seems to be ok.
>>>>>
>>>>> Any ideas?
>>>>
>>>> If the MTD layout had changed I'd expect more errors from UBI.
>>>> Is this NAND?
>>>
>>> Yes nandflash
>>>
>>>> Did you compare the MTD partition layout and number of bad blocks?
>>>
>>> Do you mean before and after?
>>
>> Yes. Something must be different.
>> Page size? Sub pages? Number or erase blocks, etc...
> Will come back on this, need some more time...
Ok mtd partition is the same for both
	kernel cmdline:
root=ubi0 rw ubi.mtd=3 rootfstype=ubifs 
mtdparts=atmel_nand:128K(bootstrap),256K(u-boot-env),640K(u-boot),-(rootfs)

As mentioned before (all with the saem parameters)
1) old kernel and old rootfs, boot it --> fine
2) new kernel and new rootfs, boot it --> fine
3) new kernel and old rootfs, boot it --> fine
If I run 1) and then boot the old rootfs with a new kernel --> rootfs 
damaged



	
