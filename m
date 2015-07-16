Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFdgM-0005kf-GP
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 07:34:15 +0000
Received: by pdrg1 with SMTP id g1so39614430pdr.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2015 00:33:52 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <55A75E5C.5040605@gmail.com>
Date: Thu, 16 Jul 2015 13:03:48 +0530
MIME-Version: 1.0
In-Reply-To: <55A75A05.7040603@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/16/2015 12:45 PM, Richard Weinberger wrote:

> Am 16.07.2015 um 09:11 schrieb Bhuvanchandra DV:
>> On 07/16/2015 12:19 PM, Richard Weinberger wrote:
>>
>>> Am 16.07.2015 um 08:09 schrieb Richard Weinberger:
>>>> Am 16.07.2015 um 07:58 schrieb Bhuvanchandra DV:
>>>>> Power cut test with 4.1.2 kernel:
>>>>>
>>>>> Preparing UBI image using mkfs.ubifs utility:
>>>>>
>>>>> $ mkfs.ubifs -c 8112 -e 124KiB -m 2KiB -o ubifs.img -r rootfs/ -v
>>>>>
>>>>>
>>>>> Flashing UBI image from U-Boot:
>>>>>
>>>>> # fatload ${interface} 0:1 ${loadaddr} ubifs.img
>>>>> reading ubifs.img
>>>>> 108691456 bytes read in 7139 ms (14.5 MiB/s)
>>>>> # ubi part ubi && ubi check rootfs || ubi create rootfs
>>>>> UBI: default fastmap pool size: 50
>>>>> UBI: default fastmap WL pool size: 25
>>>>> UBI: attaching mtd1 to ubi0
>>>>> UBI: attached by fastmap
>>>>> UBI: fastmap pool size: 50
>>>>> UBI: fastmap WL pool size: 25
>>>>> UBI: attached mtd1 (name "mtd=3", size 126 MiB) to ubi0
>>>>> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>>>>> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>>>>> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>>>>> UBI: good PEBs: 1003, bad PEBs: 5, corrupted PEBs: 0
>>>>> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>>>>> UBI: max/mean erase counter: 14/4, WL threshold: 4096, image sequence number: 0
>>>>> UBI: available PEBs: 0, total reserved PEBs: 1003, PEBs reserved for bad PEB handling: 15
>>>>> # ubi write ${loadaddr} rootfs ${filesize}
>>>>> 108691456 bytes written to volume rootfs
>>>>>
>>>>> With 4.1.2 kernel after ~600 power cut cycles, no issues with mounting the ubifs,
>>>>> but observed few stack traces.
>>>> But your kernel log shows an issue. It is not clear whether it comes from fastmap.
>>> BTW: I forgot to ask one thing, did you test using fm_debug?
>> No, if needed i can do the test again with fm_debug enabled.
>> Enabled fm_debug now with the corrupted ubifs, no addiditional debug logs observed.
> Okay. So far it does not really sound like a fastmap issue.
> But please double check using fm_debug.

Ok

>
> P.s: Why are you writing me privately?

My bad! some how in one my reply to previous mail i missed reply-all.
Will forward previous conversations to ML.

>
> Thanks,
> //richard
>
Best regards,
Bhuvan
