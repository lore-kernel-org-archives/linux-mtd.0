Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2xiy-00031I-ET
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 09:25:05 +0000
Received: by mail-lf0-x244.google.com with SMTP id y84so2802398lfc.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2016 02:24:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
Date: Wed, 18 May 2016 10:24:42 +0100
Message-ID: <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 17, 2016 at 5:13 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Tue, May 17, 2016 at 5:19 PM, Martin Townsend
> <mtownsend1973@gmail.com> wrote:
>> Hi,
>>
>> I've just seen the following UBIFS assert which relates to
>> ubifs_remount_fs in fs/ubifs/super.c
>> We have a read only root filesystem and it looks like this problem
>> occurs after rebooting the board when the root filesystem has been
>> remounted as as r/w, I use the following command to do this in case
>> I'm doing this incorrectly.
>> mount -o remount,rw /
>> The only way to stop it is to login and run
>> mount -o remount,rw /
>> mount -o remount,ro /
>> and then reboots do not assert.
>>
>> I've tried a few times now and can happily reproduce it.
>>
>> Any ideas on how to fix this?
>
> Let's analyze the root cause first.
> Can you please reproduce with the attached debug patch applied?
> I wonder what the value of c->lst.taken_empty_lebs is.
>
> --
> Thanks,
> //richard

Here's the output
[    3.185429] UBIFS error (ubi0:0 pid 106): ubifs_remount_fs:
taken_empty_lebs is 0

A bit info:
I booted the board over the network using TFTP/NFS and then mounting
the UBIFS partition using
ubiattach /dev/ubi_ctrl -m 12 -O 2048
mount -o ro -t ubifs /dev/ubi0_0 /mnt/ubifs/
but this never triggered the assert. So I thought maybe it was
something to do with U-Boot mounting the rootfs to load the kernel and
device tree which are in the UBIFS so I loaded the kernel and device
tree from a TFTP server and then booted from NAND but this still
triggered the assert so this kind of rules out U-Boot.

-Martin
