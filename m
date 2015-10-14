Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmAYR-0002rN-IE
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 01:08:32 +0000
Received: by ykaz22 with SMTP id z22so8248218yka.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 18:08:09 -0700 (PDT)
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <561D1642.3070105@cogentembedded.com>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
 <561D1642.3070105@cogentembedded.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Wed, 14 Oct 2015 09:07:49 +0800
Message-ID: <CAGS+omDm=74d6cw7kXwkZ_Jy-faBz7z4-vJQX9ZFVNskQqSS-w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei,

On Tue, Oct 13, 2015 at 10:33 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 10/13/2015 12:39 PM, Bayi Cheng wrote:
>
>> Add Mediatek nor flash node
>>
>> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index d18ee42..385c2e4 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -365,6 +365,21 @@
>>                         status = "disabled";
>>                 };
>>
>> +               nor_flash: spi@1100d000 {
>
>
>    I don't think this is a good label name for a SPI controller.

You think "spi" is not a good name for SPI controller?
Or you mean the label "nor_flash"?

Would you prefer:

  spi_nor_flash: spi@1100d000


>
>> +                       compatible = "mediatek,mt8173-nor";
>> +                       reg = <0 0x1100d000 0 0xe0>;
>> +                       clocks = <&pericfg CLK_PERI_SPI>,
>> +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
>> +                       clock-names = "spi", "sf";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       flash@0 {
>> +                               compatible = "jedec,spi-nor";
>> +                               reg = <0>;
>> +                       };
>> +               };
>> +
>>                 i2c3: i2c3@11010000 {
>
>
>    Grr, the name should be "i2c@11010000".

Don't worry.  This is already fixed in Matthias' tree:
  https://github.com/mbgg/linux-mediatek/commit/1ee35c05d9c67771d649f687e6f76e61e76eb779

-Dan

>
> [...]
>
> MBR, Sergei
>
