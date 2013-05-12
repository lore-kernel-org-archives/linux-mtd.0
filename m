Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbV7p-0002Wb-WA
 for linux-mtd@lists.infradead.org; Sun, 12 May 2013 12:11:38 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc8so1878573pbc.18
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 05:11:06 -0700 (PDT)
Message-ID: <518F86CE.6060408@gmail.com>
Date: Sun, 12 May 2013 17:40:54 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
In-Reply-To: <518C91AA.8040107@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Stefan,

On 5/10/2013 11:50 AM, Stefan Roese wrote:
> Hi Vikram,
>
> On 05/09/2013 02:30 PM, Vikram Narayanan wrote:
>>> I might be seeing something similar on my iMX6 board. Here
>>> mtd_subpagetest sometimes fails.
>>
>> AFAIR, subpagetest passed for me when I tested.
>>
>> BTW, What kind of errors are you getting? Any logs?
>
> Sure. Here 2 logs with v3.9.1:
>
> # insmod mtd_subpagetest.ko dev=3
> [  315.947734] mtd_subpagetest: verified up to eraseblock 0
> [  317.140658] mtd_subpagetest: error: read failed at 0xd60800

> [ 2561.996470] mtd_subpagetest: error: read failed at 0xe380800

Looks like it is happening at random. Two different physical locations 
on two different runs.

>>>
>>> What is the current status on your platform? Did you resolve this
>>> problem? If yes, what did you have to change/fix?
>>
>> Unfortunately no. I haven't got enough time to look into this.
>
> Too bad. Could you please explain again, how you first noticed
> that the you might have a problem with NAND on your imx6 board?

For me, the error (-74) happened when the kernel is finally trying to 
mount the rootfs. It is random as well.

<http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error>
As suggested in the above link, I tried to run the oobtest and it was 
failing due to the missing ecc_layout structure. That's how this thread 
was born.

> We noticed a problem first in U-Boot by using the following
> commands:
>
> => nand erase.part ubi; ubi part ubi
>
> This works the first time without any problem. But the 2nd time
> it leads to "uncorrectable errors" (0xfe) while reading from some
> blocks. And those failing blocks tend to be the same (more or less).

> Perhaps you might want to test this in U-Boot (if you use it)
> as well.

I'm using u-boot v2012.10, with no extra patches for mtd/ubi layers.

I tried in both the ways. Issued "nand erase; ubi part" and "ubi part" 
alone. For me, It didn't give any "uncorrectable errors" error you've 
mentioned.

The only error I came across in u-boot is "fixable bit-flip" issue. My 
colleagues have reported it sometime back. But I couldn't reproduce it 
and neither could they.

Can you please post the logs for the "uncorrectable errors" in u-boot?
That might give some hints to Huang.

Thanks,
Vikram
