Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsSix-0000Pb-5S
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 09:13:07 +0000
Received: by wgnd10 with SMTP id d10so34197026wgn.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 02:12:42 -0700 (PDT)
Message-ID: <55531421.1030700@gmail.com>
Date: Wed, 13 May 2015 12:06:41 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at>
In-Reply-To: <55531263.5060908@nod.at>
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



On 05/13/2015 11:59 AM, Richard Weinberger wrote:
> Am 13.05.2015 um 10:56 schrieb Michael Niarchos:
>> Volume ID:   0 (on ubi0)
>> Type:        dynamic
>> Alignment:   1
>> Size:        3964 LEBs (503332864 bytes, 480.0 MiB)
>> State:       OK
>> Name:        ubi-rootfs
>> Character device major/minor: 246:1
>
> Is the device node present?
>
> Thanks,
> //richard
>
Yes, it is present

root@zx3-pm3-zynq7:~# find /dev -name "ubi*"
/dev/ubi0_0
/dev/ubi0
/dev/ubi_ctrl

Thanks,
Michael
