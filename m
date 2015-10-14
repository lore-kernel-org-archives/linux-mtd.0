Received: from mail-lf0-f51.google.com ([209.85.215.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmJsL-0004n7-TO
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 11:05:43 +0000
Received: by lffy185 with SMTP id y185so9397391lff.2
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2015 04:05:19 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
To: Daniel Kurtz <djkurtz@chromium.org>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
 <561D1642.3070105@cogentembedded.com>
 <CAGS+omDm=74d6cw7kXwkZ_Jy-faBz7z4-vJQX9ZFVNskQqSS-w@mail.gmail.com>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Pawel Moll
 <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Kumar Gala <galak@codeaurora.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <561E36ED.7090103@cogentembedded.com>
Date: Wed, 14 Oct 2015 14:05:17 +0300
MIME-Version: 1.0
In-Reply-To: <CAGS+omDm=74d6cw7kXwkZ_Jy-faBz7z4-vJQX9ZFVNskQqSS-w@mail.gmail.com>
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

Hello.

On 10/14/2015 4:07 AM, Daniel Kurtz wrote:

>>> Add Mediatek nor flash node
>>>
>>> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index d18ee42..385c2e4 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -365,6 +365,21 @@
>>>                          status = "disabled";
>>>                  };
>>>
>>> +               nor_flash: spi@1100d000 {
>>
>>     I don't think this is a good label name for a SPI controller.
>
> You think "spi" is not a good name for SPI controller?
> Or you mean the label "nor_flash"?

    I think I said clearly: "label". :-)

> Would you prefer:
>
>    spi_nor_flash: spi@1100d000

    I'd prefer the "_nor_flash" part to be dropped, to be used for the real 
flash device (if needed) which is a sub-node of this node.

[...]

> -Dan

MBR, Sergei
