Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXNwI-0004qa-9q
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 06:24:03 +0000
Received: by wiclp12 with SMTP id lp12so40335650wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 23:23:40 -0700 (PDT)
Message-ID: <55E7E768.7000909@gmail.com>
Date: Thu, 03 Sep 2015 08:23:36 +0200
From: Gabriel Dobato <dobatog@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel Update on NAND (CM-510 Compulab)
References: <55DC55A6.4000801@gmail.com>	<CAAEAJfA9=RaEd6VEobs53qLQTuY-w0PfYDjqA-HSY7xTq1oGTA@mail.gmail.com>	<55DD015F.4070103@gmail.com>
 <CAAEAJfDGbS3Pde7vsHkNk8JTZOc6Hq_W0yUKVD5O18Kzt9DsLw@mail.gmail.com>
 <55E0DD91.4000701@gmail.com>
In-Reply-To: <55E0DD91.4000701@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again Ezequiel,

I have noticed that there are some new commits of pxa3xx_nand. Is it 
possible that my problem is related with some issues that these commits fix?



Gabriel

El 29.08.2015 a las 00:15, Gabriel Dobato escribió:
>
>
> El 27.08.2015 a las 02:53, Ezequiel Garcia escribió:
>> Hmmm.. this looks odd indeed.
>>
>> Can you run two nandtests simultaneously (in parallel)
>> on the two /dev/mtd devices?
>>
>> If you share your kernel configuration, I can give it a try
>> on some (similar) board.
> Hi Ezequiel,
>
> attached the kernel configuration, and below the Nand node of my DT:
>
>    nand@c0000 {
>
>                                 compatible = "marvell,armada370-nand";
>                                 status = "okay";
>                                 reg= <0xc0000 0x60>;
>                                 interrupts = <3>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 num-cs = <1>;
>                                 clocks = <&gate_clk 10>;
>                                 marvell,nand-keep-config;
>                                 nand-on-flash-bbt;
>                                 pinctrl-0 = <&pmx_nand_gpo>;
>                                 pinctrl-names = "default";
>                                 nand-ecc-strength = <4>;
>                                 nand-ecc-step-size= <512>;
>
>                                 partition@0 {
>                                         label = "uImage";
>                                          reg = <0x00000000 0x00400000>;
>                                 };
>                                 partition@400000 {
>                                         label = "rootfs";
>                                         reg = <0x00400000 0x1FC00000>;
>                                 };
>                         };
>
>
> };
>
> Also, attached the nandtests results. I have applied them 
> simultaneously on /dev/mtd0 and /dev/mtd1.
>
> Is there any additional test that I can run ?
>
> Thank you.
>
>
