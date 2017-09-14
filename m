Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsPLK-000129-14
 for linux-mtd@lists.infradead.org; Thu, 14 Sep 2017 08:17:52 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id v8E8Gr46022163
 for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2017 17:16:53 +0900
Received: by mail-yw0-f179.google.com with SMTP id s62so5630362ywg.0
 for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2017 01:16:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
 <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Sep 2017 17:16:12 +0900
Message-ID: <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
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


2017-09-14 17:04 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> Hi,
>
> i assume arch/arm/boot/dts/socfpga.dtsi should be update as well. Right?

I think so.
(also arch/arm/boot/dts/socfpga_arria10.dtsi in the same way)

The wrong property "dma-mask" was removed by
commit 60d920d32ca40660e382cf9ccbc236599a49e607.



> On 14.09.2017 09:17, Masahiro Yamada wrote:
>>
>> This example allocates too much for register regions.  Especially,
>> there are only two registers in the "nand_data" interface of this
>> hardware (ADDR: 0x00, DATA: 0x10).
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>   Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> index 504291d..0ee8edb 100644
>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> @@ -29,7 +29,7 @@ nand: nand@ff900000 {
>>         #address-cells = <1>;
>>         #size-cells = <1>;
>>         compatible = "altr,socfpga-denali-nand";
>> -       reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
>> +       reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
>>         reg-names = "nand_data", "denali_reg";
>>         interrupts = <0 144 4>;
>>   };
>>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
