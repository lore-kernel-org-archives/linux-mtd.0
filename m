Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsSTO-0003UY-UZ
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 08:57:04 +0000
Received: by wicmc15 with SMTP id mc15so73152350wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 01:56:40 -0700 (PDT)
Message-ID: <555311C7.8060601@gmail.com>
Date: Wed, 13 May 2015 11:56:39 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at>
In-Reply-To: <55531046.80304@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/13/2015 11:50 AM, Richard Weinberger wrote:
> Am 13.05.2015 um 10:48 schrieb Michael Niarchos:
>>
>>
>> On 05/13/2015 09:49 AM, Richard Weinberger wrote:
>>> On Wed, May 13, 2015 at 8:25 AM, Michael Niarchos
>>> <michael.niarchos@gmail.com> wrote:
>>>> On 13-May-15 06:05, Brian Norris wrote:
>>>>>
>>>>> On Tue, May 12, 2015 at 10:38:31PM +0300, Michael N wrote:
>>>>>>
>>>>>> I am using a Zynq7000 with NAND 512MB and I am trying to deploy Linux on
>>>>>> NAND
>>>>>> memory. I use a custom built kernel with minimal features (UBI and UBIFS
>>>>>> support are enabled and mtd-utils installed). I can ubiformat an mtd
>>>>>> partition, I
>>>>>> can ubiattach and ubidetach it but whenever I try to mount the
>>>>>> partition I get this error.
>>>>>>
>>>>>>               mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
>>>>>> No such device
>>>>>
>>>>> What's the exact mount command you're running? Did you take a look at
>>>>> the MTD FAQ?
>>>>>
>>>>> http://linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubif
>>>>
>>>>
>>>> I am running this command:
>>>>
>>>> $ mount -t ubifs ubi0:ubi-rootfs /mnt/ubifs
>>>
>>> Does it work if you use the device node? i.e. /dev/ubi0_X?
>>> Is it attached?
>>
>> root@zx3-pm3-zynq7:~# ubiattach /dev/ubi_ctrl -m 2
>> [  115.549805] UBI: attaching mtd2 to ubi0
>> [  115.787102] mmc0: Card removed during transfer!
>> [  115.791560] mmc0: Resetting controller.
>> [  115.803396] mmc0: Card removed during transfer!
>> [  115.807853] mmc0: Resetting controller.
>> [  119.024116] UBI: scanning is finished
>> [  119.056419] UBI: attached mtd2 (name "nand-rootfs", size 506 MiB) to ubi0
>> [  119.063272] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [  119.070053] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [  119.076670] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [  119.083579] UBI: good PEBs: 4044, bad PEBs: 4, corrupted PEBs: 0
>> [  119.089580] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>> [  119.096636] UBI: max/mean erase counter: 6/2, WL threshold: 4096, image sequence number: 1208887967
>> [  119.105709] UBI: available PEBs: 0, total reserved PEBs: 4044, PEBs reserved for bad PEB handling: 76
>> [  119.115500] UBI: background thread "ubi_bgt0d" started, PID 933
>> UBI device number 0, total 4044 LEBs (513490944 bytes, 489.7 MiB), available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
>> root@zx3-pm3-zynq7:~# mount -t ubifs /dev/ubi0_0 /mnt/
>> mount: mounting /dev/ubi0_0 on /mnt/ failed: No such device
>
> Ahh, -m 2...
> What does ubinfo -a print?
>
> Thanks,
> //richard
>
root@zx3-pm3-zynq7:~# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:59
Present UBI devices:            ubi0

ubi0
Volumes count:                           1
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     4044 (513490944 bytes, 489.7 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       4
Count of reserved physical eraseblocks:  76
Current maximum erase counter value:     6
Minimum input/output unit size:          2048 bytes
Character device major/minor:            246:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        3964 LEBs (503332864 bytes, 480.0 MiB)
State:       OK
Name:        ubi-rootfs
Character device major/minor: 246:1
