Received: from mail-da0-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0E2m-0007bp-Az
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 16:28:21 +0000
Received: by mail-da0-f48.google.com with SMTP id k18so301689dae.7
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2013 08:28:18 -0800 (PST)
Message-ID: <5107F899.5090506@gmail.com>
Date: Tue, 29 Jan 2013 21:58:09 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
In-Reply-To: <510735B3.1040509@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/29/2013 8:06 AM, Huang Shijie wrote:
>> May I know in what way the driver is restricted for using with other
>> boards?
> The devicetree. Please check the dts file in arch/arm/boot/dts/.
> If there is no dts file for your board, the gpmi will not works very
> well for your board.
> for example, there is arch/arm/boot/dts/imx6q-arm2.dts for the MX6Q-ARM2
> board.

I've a valid dts file for my board which is good enough to probe the 
Toshiba NAND on-board and mount a UBIFS filesystem.

>> You're right and we knew it earlier as the Kernel detects the OOB size
>> as 128 bytes. So, some remaining bytes become unused at the end of
>> each page. i.e., (224-128). Instead of supporting ecc strength as ECC9
>> we end up using ECC8. Should this be a cause for the -74 error?
> no. this is not the cause. even you get the wrong geometry of the nand
> chip. the gpmi still can works.
>
> I think the root cause is the devicetree issue as above.

Something else is causing the issue. Can you give some other pointers 
which can potentially cause this -74 error while mounting?

Regards,
Vikram
