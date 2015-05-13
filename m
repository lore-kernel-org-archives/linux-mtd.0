Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsSx1-0004ws-Ul
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 09:27:40 +0000
Received: by wicnf17 with SMTP id nf17so47785752wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 02:27:16 -0700 (PDT)
Message-ID: <555318F3.6000507@gmail.com>
Date: Wed, 13 May 2015 12:27:15 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at> <55531421.1030700@gmail.com>
 <5553151B.3040504@nod.at>
In-Reply-To: <5553151B.3040504@nod.at>
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



On 05/13/2015 12:10 PM, Richard Weinberger wrote:
> Am 13.05.2015 um 11:06 schrieb Michael Niarchos:
>>
>>
>> On 05/13/2015 11:59 AM, Richard Weinberger wrote:
>>> Am 13.05.2015 um 10:56 schrieb Michael Niarchos:
>>>> Volume ID:   0 (on ubi0)
>>>> Type:        dynamic
>>>> Alignment:   1
>>>> Size:        3964 LEBs (503332864 bytes, 480.0 MiB)
>>>> State:       OK
>>>> Name:        ubi-rootfs
>>>> Character device major/minor: 246:1
>>>
>>> Is the device node present?
>>>
>>> Thanks,
>>> //richard
>>>
>> Yes, it is present
>>
>> root@zx3-pm3-zynq7:~# find /dev -name "ubi*"
>> /dev/ubi0_0
>> /dev/ubi0
>> /dev/ubi_ctrl
>
> Can you use them using ubiupdatevol, etc...?
>
> Something is fishy here or we're all missing something obvious. :)
>
> Thanks,
> //richard
>
root@zx3-pm3-zynq7:/var/volatile/tmp# ubiupdatevol /dev/ubi0_0 
/tmp/zx3-image.ubifs
[  272.730913] mmc0: Card removed during transfer!
[  272.735368] mmc0: Resetting controller.

This messages are been printed many times, but no error for
ubi updatevol is returned or something.

I 've been thinking the same thing :)

I don't know if this is going to help but when I first tried to load
root filesystem from NAND, kernel printed that the rootfs variable was
not set right and that the available options are:
mtdblock0
mtdblock1
mtdblock2

I get this when I run

root@zx3-pm3-zynq7:/var/volatile/tmp# cat /proc/partitions
major minor  #blocks  name

   31        0       5120 mtdblock0
   31        1       1024 mtdblock1
   31        2     518144 mtdblock2

Also,

root@zx3-pm3-zynq7:/var/volatile/tmp# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00500000 00020000 "nand-linux"
mtd1: 00100000 00020000 "nand-device-tree"
mtd2: 1fa00000 00020000 "nand-rootfs"

I don't know what's going on :)
