Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d33qc-0005zE-Mw
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 17:01:56 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id B741C201F2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 17:01:29 +0000 (UTC)
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42802201C8
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 17:01:27 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id 203so95945008ywe.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 10:01:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a9519140-a804-9888-3223-9a1446e25c52@hauke-m.de>
References: <20170417192942.32219-1-hauke@hauke-m.de>
 <20170417192942.32219-9-hauke@hauke-m.de>
 <20170420145405.7s3iapxggr5575d2@rob-hp-laptop>
 <a9519140-a804-9888-3223-9a1446e25c52@hauke-m.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Apr 2017 12:01:05 -0500
Message-ID: <CAL_JsqJmeu6JNVK3aSCCE-q2Y9CAWHRFJF8SZo6QSBWV1+DO9A@mail.gmail.com>
Subject: Re: [PATCH 08/13] reset: Add a reset controller driver for the Lantiq
 XWAY based SoCs
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 John Crispin <john@phrozen.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 hauke.mehrtens@intel.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 25, 2017 at 2:00 AM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
>
> On 04/20/2017 04:54 PM, Rob Herring wrote:
>> On Mon, Apr 17, 2017 at 09:29:37PM +0200, Hauke Mehrtens wrote:
>>> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>
>>> The reset controllers (on xRX200 and newer SoCs have two of them) are
>>> provided by the RCU module. This was initially implemented as a simple
>>> reset controller. However, the RCU module provides more functionality
>>> (ethernet GPHYs, USB PHY, etc.), which makes it a MFD device.
>>> The old reset controller driver implementation from
>>> arch/mips/lantiq/xway/reset.c did not honor this fact.
>>>
>>> For some devices the request and the status bits are different.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>>  .../devicetree/bindings/reset/lantiq,rcu-reset.txt |  43 ++++
>>>  arch/mips/lantiq/xway/reset.c                      |  68 ------
>>>  drivers/reset/Kconfig                              |   6 +
>>>  drivers/reset/Makefile                             |   1 +
>>>  drivers/reset/reset-lantiq-rcu.c                   | 231 +++++++++++++++++++++
>>>  5 files changed, 281 insertions(+), 68 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/reset/lantiq,rcu-reset.txt
>>>  create mode 100644 drivers/reset/reset-lantiq-rcu.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/reset/lantiq,rcu-reset.txt b/Documentation/devicetree/bindings/reset/lantiq,rcu-reset.txt
>>> new file mode 100644
>>> index 000000000000..7f097d16bbb7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/reset/lantiq,rcu-reset.txt
>>> @@ -0,0 +1,43 @@
>>> +Lantiq XWAY SoC RCU reset controller binding
>>> +============================================
>>> +
>>> +This binding describes a reset-controller found on the RCU module on Lantiq
>>> +XWAY SoCs.
>>> +
>>> +
>>> +-------------------------------------------------------------------------------
>>> +Required properties (controller (parent) node):
>>> +- compatible                : Should be "lantiq,rcu-reset"
>>> +- lantiq,rcu-syscon : A phandle to the RCU syscon, the reset register
>>> +                      offset and the status register offset.
>>> +- #reset-cells              : Specifies the number of cells needed to encode the
>>> +                      reset line, should be 1.
>>> +
>>> +Optional properties:
>>> +- reset-status              : The request status bit. For some bits the request bit
>>> +                      and the status bit are different. This is depending
>>> +                      on the SoC. If the reset-status bit does not match
>>> +                      the reset-request bit, put the reset number into the
>>> +                      reset-request property and the status bit at the same
>>> +                      index into the reset-status property. If no
>>> +                      reset-request bit is given here, the driver assume
>>> +                      status and request bit are the same.
>>> +- reset-request             : The reset request bit, to map it to the reset-status
>>> +                      bit.
>>
>> These should either be implied by SoC specific compatible or be made
>> part of the reset cells. In the latter case, you still need the SoC
>> specific compatible.
>
> Currently the reset framework only supports a single reset cell to my
> knowledge, but I haven't looked into the details, I could extend it to
> make it support two.

I thought we had cases already, but maybe I'm thinking of something
else. In any case, driver limitations shouldn't define binding design.

> The SoC which needs this has two reset control register sets and the
> bits are specific for each register set. Would a specific compatible
> string for each register set ok?

Yes. You should have that.

Rob
