Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yso30-0003Zl-Cb
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 07:59:15 +0000
Message-ID: <555455B8.5010101@nod.at>
Date: Thu, 14 May 2015 09:58:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>,
 Michael Niarchos <michael.niarchos@gmail.com>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at> <55531421.1030700@gmail.com>
 <5553174C.6000000@nod.at> <55541A6B.6060406@huawei.com>
In-Reply-To: <55541A6B.6060406@huawei.com>
Content-Type: text/plain; charset=utf-8
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

Am 14.05.2015 um 05:45 schrieb Sheng Yong:
> Hi, folks,
> 
> On 5/13/2015 5:20 PM, Richard Weinberger wrote:
>> Am 13.05.2015 um 11:06 schrieb Michael Niarchos:
>>>
>>>
>>> On 05/13/2015 11:59 AM, Richard Weinberger wrote:
>>>> Am 13.05.2015 um 10:56 schrieb Michael Niarchos:
>>>>> Volume ID:   0 (on ubi0)
>>>>> Type:        dynamic
>>>>> Alignment:   1
>>>>> Size:        3964 LEBs (503332864 bytes, 480.0 MiB)
>>>>> State:       OK
>>>>> Name:        ubi-rootfs
>>>>> Character device major/minor: 246:1
>>>>
>>>> Is the device node present?
>>>>
>>>> Thanks,
>>>> //richard
>>>>
>>> Yes, it is present
>>>
>>> root@zx3-pm3-zynq7:~# find /dev -name "ubi*"
>>> /dev/ubi0_0
>>> /dev/ubi0
>>> /dev/ubi_ctrl
>>
>> BTW: Have you created the nodes by hand? Do major/minor numbers match?

Michael's problem was that ubifs was not loaded.
He confirmed that off-list.

> If we create the dev node by hand, it is hard for kernel to notice that.
> 
> UBI (and even driver base) seems doesn't know and doesn't care if device
> nodes already exist. UBI just checks the ubi_devices, registers devices,
> and tells udev to make node. Although everything seems ok, `mount' will
> fail because of wrong device node. However, the "device node" is removed
> when detaching without any warning or error message. In this way, UBI
> could delete the file without user's permission.
> 
> Is this appropriate? Shall we add some code in ubidetach to detect whether
> the "device node" to be removed is correct?

Isn't this the behavior that all device drivers have?
Maybe I miss something as my uptime is less than 15min. ;)

Thanks,
//richard
