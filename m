Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubvqk-0001DL-8f
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 16:43:46 +0000
Received: by mail-pb0-f50.google.com with SMTP id um15so4626944pbc.37
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 09:43:24 -0700 (PDT)
Message-ID: <5191181E.5060209@gmail.com>
Date: Mon, 13 May 2013 22:13:10 +0530
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
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
In-Reply-To: <51909DF1.4060201@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

On 5/13/2013 1:31 PM, Stefan Roese wrote:
> On 05/13/2013 04:51 AM, Huang Shijie wrote:
>>>> Also, I don't have enough spare boards to sacrifice it for mtd_torture test.
>>> Yes, I can understand this.
>>>
>>> Huang, do you have any idea on how to proceed here? What else
>>> could/should we test? Any ideas/hints?
>>
>> Currently, the kernel supports three imx6 boards for the gpmi-nand:
>>      imx6q-arm2, imx6q-sabreauto, imx6dl-sabareauto.
>>
>> I am afraid your board is none of them. I doubt your board is not
>> correctly configrated with
>> some timing or signals.
>
> Correct, our board is a custom imx6 board. Basically NAND is working
> just fine (UBI/UBIFS works basically). This board even boots from NAND.
> So at least the pin muxing has to be correct.

If you are missing something very fundamental like the pinmux, I really 
wonder how the board would boot. So I'd say, you got your basic settings 
right.

> Please correct me if I'm wrong, but from my understanding the Linux GPMI
> NAND driver configures the timings. So this is not board platform code
> related but NAND driver related.
>
> Do you have any hints where to "tune/change" some values (timing or
> signal related) to fix this error?

Not sure if this will fix your errors. There is a struct timing in the 
driver (Just give a grep). Update that structure with the timings given 
in your NAND datasheet.

HTH,
Vikram
