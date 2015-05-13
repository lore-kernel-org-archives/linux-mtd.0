Received: from mail-vn0-x236.google.com ([2607:f8b0:400c:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsQUE-0002J4-7O
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 06:49:48 +0000
Received: by vnbg129 with SMTP id g129so2289163vnb.4
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 23:49:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5552EE77.8050202@gmail.com>
References: <5552EE30.8060203@gmail.com>
	<5552EE77.8050202@gmail.com>
Date: Wed, 13 May 2015 08:49:21 +0200
Message-ID: <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
Subject: Re: Cannot mount ubifs partition
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Michael Niarchos <michael.niarchos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 13, 2015 at 8:25 AM, Michael Niarchos
<michael.niarchos@gmail.com> wrote:
> On 13-May-15 06:05, Brian Norris wrote:
>>
>> On Tue, May 12, 2015 at 10:38:31PM +0300, Michael N wrote:
>>>
>>> I am using a Zynq7000 with NAND 512MB and I am trying to deploy Linux on
>>> NAND
>>> memory. I use a custom built kernel with minimal features (UBI and UBIFS
>>> support are enabled and mtd-utils installed). I can ubiformat an mtd
>>> partition, I
>>> can ubiattach and ubidetach it but whenever I try to mount the
>>> partition I get this error.
>>>
>>>             mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
>>> No such device
>>
>> What's the exact mount command you're running? Did you take a look at
>> the MTD FAQ?
>>
>> http://linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubif
>
>
> I am running this command:
>
> $ mount -t ubifs ubi0:ubi-rootfs /mnt/ubifs

Does it work if you use the device node? i.e. /dev/ubi0_X?
Is it attached?

-- 
Thanks,
//richard
