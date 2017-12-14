Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePQBa-0007FW-HJ
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 09:52:26 +0000
Subject: Re: Mounting issue with old uboot and new rootfs
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <5001344.Umix9c0TK6@blindfold>
 <548ecb18-722c-f919-b245-d1b1c15c1697@nedap.com>
 <1850520.5cNxzxR8i7@blindfold>
 <6db62c4b-653d-e224-283f-288a765899c5@nedap.com>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <015beb4d-70d3-9d0f-119b-c94ab969f702@nedap.com>
Date: Thu, 14 Dec 2017 10:51:36 +0100
MIME-Version: 1.0
In-Reply-To: <6db62c4b-653d-e224-283f-288a765899c5@nedap.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 14-12-17 08:28, Jaap de Jong wrote:
> 
> 
> On 13-12-17 17:42, Richard Weinberger wrote:
>> Am Mittwoch, 13. Dezember 2017, 11:18:02 CET schrieb Jaap de Jong:
>>>> Does everything work as expected if you don't set the resize flag in
>>>> ubinize? Maybe this is the culprit.
>>>
>>> Yes, that was my last experiment and that works. It turns off the code
>>> in the old uboot that modifies the volume in such a way that the new
>>> kernel is not able to deal with it.
>>> The strange thing is, that an old kernel doesn't mind.
>>
>> Can you please rule out U-Boot first?
>> IOW don't attach UBI from U-Boot and load the kernel via TFTP/NFS, etc...
>> I'm still not sure whether this is a regression in Linux or U-Boot.
> Sure. Did that and then there is no corruption. The old version uboot 
> modifies the volume in a way that the new kernel can't handle. The old 
> kernel on the other hand is able to mount that 'mangled' volume.
In addition to this: In the situation where you replace the old kernel 
with a new kernel, the filesystem is damaged by the new kernel in a way 
that it is unusable. The way I reproduce this is by flashing a unit with 
an old uboot/kernel/filesystem. Start it: the old uboot resizes the fs 
and the old kernel also changes something with it. Restart with a new 
kernel. Bricked.
The first run of the new kernel shows:
  ubi0 error: ubi_read_volume_table: the layout volume was not found
  ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22
  UBI error: cannot attach mtd3
  Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(0,0)
  Rebooting in 1 seconds..

The last run of uboot:
  Creating 1 MTD partitions on "nand0":
  0x000000100000-0x000020000000 : "mtd=3"
  UBI: attaching mtd1 to ubi0
  UBI: physical eraseblock size:   131072 bytes (128 KiB)
  UBI: logical eraseblock size:    129024 bytes
  UBI: smallest flash I/O unit:    2048
  UBI: sub-page size:              512
  UBI: VID header offset:          512 (aligned 512)
  UBI: data offset:                2048
  UBI error: ubi_read_volume_table: the layout volume was not found
  UBI error: ubi_init: cannot attach mtd1
  UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
  UBI init error -22
  UBIFS not mounted, use ubifs mount to mount volume first!
  UBIFS not mounted, use ubifs mount to mount volume first!
  UBIFS not mounted, use ubifs mount to mount volume first!
  UBIFS not mounted, use ubifs mount to mount volume first!

Same setup but bypassing the first uboot run: no issues.

To put my experiments in a table:

uboot kernel  kernel  result
       1st run 2nd run
-     old     old     fine
old   old     old     fine
new   old     old     fine

-     old     new     fine
old   old     new     bricked
new   old     new     bricked

-     new     new     fine
old   new     new     bricked
new   new     new     fine

So I see 2 issues...
