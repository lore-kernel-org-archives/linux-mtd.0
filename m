Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duu21-00058V-2s
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 05:28:15 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v8L5Ral1012820
 for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2017 14:27:37 +0900
Received: by mail-yw0-f180.google.com with SMTP id l4so3344212ywa.6
 for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2017 22:27:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <630e651e-3d38-7a39-0327-e9b398d97e2d@pengutronix.de>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
 <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
 <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
 <630e651e-3d38-7a39-0327-e9b398d97e2d@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 14:26:55 +0900
Message-ID: <CAK7LNATRT4NYShu9MHPwfnxFC8k-rTak_bS-PrBmS+m5TUA72g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
To: Oleksij Rempel <ore@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.


2017-09-14 18:06 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> On 14.09.2017 10:16, Masahiro Yamada wrote:
>>
>> Hi.
>>
>>
>> 2017-09-14 17:04 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
>>>
>>> Hi,
>>>
>>> i assume arch/arm/boot/dts/socfpga.dtsi should be update as well. Right?
>>
>>
>> I think so.
>> (also arch/arm/boot/dts/socfpga_arria10.dtsi in the same way)
>
>
> Hm.. according to
> https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cyclone5_handbook.pdf
> Table 13-18: NAND Controller Module Data Space Address Range
>
> Module Instance       Start Address        End Address
> NAND_DATA             0xFF900000           0xFF9FFFFF
>
> So <0xff900000 0x100000> seems to be a proper value.
>

The Alrera's SOCFPGA document describes so.
It is up to each SoC vendor how to describe the register space.

I am focusing on the Denali IP
because this IP is used among several SoCs.



You can see the peripheral region map
starting at page 1-18 of the document you referred to:

Slave ID      Description                  Base Addr      Size
---------------------------------------------------------------
L3REGS        L3 interconnect GPV          0xFF800000      1 MB
NANDDATA      NAND flash controller data   0xFF900000     64 KB
QSPIDATA      Quad SPI flash data          0xFFA00000      1 MB

(In the doc, the base is described as 0xFFB900000, but this is
apparently a typo.)


The rationale of the "End Address 0xFF9FFFFF" of NAND_DATA
is the fact that the base address of the next peripheral (QSPIDATA) is
0xFFA00000.




One more, if you look at the next page,

Slave ID      Description                      Base Addr     Size
---------------------------------------------------------------
NANDREGS      NAND flash controller registers   0xFFB80000   64 KB
FPGAMGRDATA   FPGA manager configuration data   0xFFB90000    4 KB


The size of NAND register space is described as 64KB,
but the rationale is just the start of the next peripheral is 0xFFB90000.

(0xFFB90000 - 0xFFB80000 = 0x10000 = 64KB)



Altera apparently reserved address space just for the purpose
of matching the end address to the base address of the next peripheral.


That means, this document specifies address region
much bigger than the IP actually provides.


If you look at page 13-6, there are only two registers
in NANDDATA space.

Table 13-4: Register Map for Indexed Addressing
Control   0x0
Data      0x10



For NANDREGS, in page 13-106, the following is the last register
in the NANDREGS space.

lun_status_cmd
Offset 0x7A0

Obviously, 0x1000 (4KB) is enough for NANDREGS.





To conclude this, this binding document was written
based on the Altera's SOCFPGA specification.

Altera specifies the region size
so that end address matches to the base of the next peripheral.
This is just a matter of SOCFPGA address mapping.

In my opinion, the binding document should not be oriented
to a particular SoC, which is not true for other SoCs.




-- 
Best Regards
Masahiro Yamada
