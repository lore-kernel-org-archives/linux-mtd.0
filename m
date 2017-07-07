Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTZib-0003gl-QG
 for linux-mtd@lists.infradead.org; Fri, 07 Jul 2017 20:19:15 +0000
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
 [209.85.213.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3392222BDF
 for <linux-mtd@lists.infradead.org>; Fri,  7 Jul 2017 20:18:53 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id p207so14087464yba.2
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 13:18:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <704b3b8b-3f33-3d51-82d7-a9515fc39742@hauke-m.de>
References: <20170702224051.15109-1-hauke@hauke-m.de>
 <20170702224051.15109-6-hauke@hauke-m.de>
 <20170707140834.nugjw5jxkyzwrmzq@rob-hp-laptop>
 <704b3b8b-3f33-3d51-82d7-a9515fc39742@hauke-m.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jul 2017 15:18:31 -0500
Message-ID: <CAL_JsqKM329HsQHCe4i6UK6SQZqRvJ-BPxOsv-1z0h=EDe2C-Q@mail.gmail.com>
Subject: Re: [PATCH v7 05/16] watchdog: lantiq: add device tree binding
 documentation
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 John Crispin <john@phrozen.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 7, 2017 at 2:01 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
>
> On 07/07/2017 04:08 PM, Rob Herring wrote:
>> On Mon, Jul 03, 2017 at 12:40:40AM +0200, Hauke Mehrtens wrote:
>>> The binding was not documented before, add the documentation now.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>>  .../devicetree/bindings/watchdog/lantiq-wdt.txt    | 24 ++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
>>> new file mode 100644
>>> index 000000000000..c3967feebb6c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
>>> @@ -0,0 +1,24 @@
>>> +Lantiq WTD watchdog binding
>>> +============================
>>> +
>>> +This describes the binding of the Lantiq watchdog driver.
>>> +
>>> +-------------------------------------------------------------------------------
>>> +Required properties:
>>> +- compatible                : Should be one of
>>> +                            "lantiq,wdt"
>>> +                            "lantiq,xrx100-wdt"
>>> +                            "lantiq,xrx200-wdt"
>>> +                            "lantiq,falcon-wdt"
>>> +- lantiq,rcu                : A phandle to the RCU syscon (required for
>>> +                      "lantiq,falcon-wdt", "lantiq,xrx200-wdt" and
>>> +                      "lantiq,xrx100-wdt")
>>> +
>>> +-------------------------------------------------------------------------------
>>> +Example for the watchdog on the xRX200 SoCs:
>>> +            watchdog@803f0 {
>>> +                    compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";
>>
>> This is still mismatched. If the example is correct, then the compatible
>> list should be:
>>
>> "lantiq,wdt"
>> "lantiq,xrx100-wdt"
>> "lantiq,xrx200-wdt", "lantiq,xrx100-wdt"
>> "lantiq,falcon-wdt"
>>
>> You can also remove "lantiq,xrx200-wdt" from the driver if you want as
>> "lantiq,xrx100-wdt" is good enough to match on.
>>
>> Rob
>>
> Ok thank you.
>
> All the features that are supported by the wtd drivers use the same
> register offsets on the xrx100 and xrx200 SoCs. I added the xrx200 only
> if in the future we find some mismatch and I want to be able to use some
> other code for this SoC.

Yes, the dts should have the xrx200 compatible. The driver can use the
xrx100 one until you need it.

> In this case I would then list complete compatible line which should be
> used for this SoC in the description of the compatible line, is that
> correct?

Yes.

Rob
