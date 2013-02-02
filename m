Received: from mail-pa0-f47.google.com ([209.85.220.47])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1Wmv-00028m-Rz
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2013 06:41:23 +0000
Received: by mail-pa0-f47.google.com with SMTP id bj3so1419185pad.34
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2013 22:41:20 -0800 (PST)
Message-ID: <510CB507.4020105@gmail.com>
Date: Sat, 02 Feb 2013 12:11:11 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
In-Reply-To: <5108852C.5040002@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/30/2013 7:57 AM, Huang Shijie wrote:
> 于 2013年01月30日 00:28, Vikram Narayanan 写道:
>> On 1/29/2013 8:06 AM, Huang Shijie wrote:
>>>> May I know in what way the driver is restricted for using with other
>>>> boards?
>>> The devicetree. Please check the dts file in arch/arm/boot/dts/.
>>> If there is no dts file for your board, the gpmi will not works very
>>> well for your board.
>>> for example, there is arch/arm/boot/dts/imx6q-arm2.dts for the MX6Q-ARM2
>>> board.
>>
>> I've a valid dts file for my board which is good enough to probe the
>> Toshiba NAND on-board and mount a UBIFS filesystem.
> could you tell the dts file for your board?
> are you sure the pinmux settings are right?

I'm using the same pinumx settings mentioned in the file
"arch/arm/boot/dts/imx6q.dtsi". Hope that is right.

>>
>>>> You're right and we knew it earlier as the Kernel detects the OOB size
>>>> as 128 bytes. So, some remaining bytes become unused at the end of
>>>> each page. i.e., (224-128). Instead of supporting ecc strength as ECC9
>>>> we end up using ECC8. Should this be a cause for the -74 error?
>>> no. this is not the cause. even you get the wrong geometry of the nand
>>> chip. the gpmi still can works.
>>>
>>> I think the root cause is the devicetree issue as above.
>>
>> Something else is causing the issue. Can you give some other pointers
>> which can potentially cause this -74 error while mounting?
> the -74 error is the EBADMSG, it's caused by the uncorrectable ECC failure.
> There are many reasons can cause this error:
>     [1] the pinmux setting is not right, the gpmi does not works well.

As said above, my pinmux settings are right. GPMI detects my NAND, does 
read/write/erase/mount. At times I'm seeing this -74 issue. Sometimes 
this error goes off in the next reboot.

>     [2] the wrong setting of BCH. for example, the page size is 8K, you
> set 4k to BCH.
>         so you can set the correct nand geometry parameters for your
> nand chip firstly, and then do the debug.

 From the driver I understood that the geometry are determined according 
to the data from the read_id bytes. mtd layer detects my NAND as 4K 
page-sized. So, this shouldn't be a problem I guess.

>     [3] timings.

Should I tweak something specific according to the NAND device that I 
have? Can you give more hints please?

Thanks,
Vikram
