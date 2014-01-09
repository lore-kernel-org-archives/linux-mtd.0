Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1B2J-0004yc-0M
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 08:32:22 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id A0F3AFFB054
 for <linux-mtd@lists.infradead.org>; Thu,  9 Jan 2014 09:31:54 +0100 (CET)
Message-ID: <52CE5E5A.6050209@overkiz.com>
Date: Thu, 09 Jan 2014 09:31:22 +0100
From: boris brezillon <b.brezillon@overkiz.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 6/9] mtd: nand: add sunxi NFC dt bindings doc
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-7-git-send-email-b.brezillon@overkiz.com>
 <201401082228.55807.arnd@arndb.de>
In-Reply-To: <201401082228.55807.arnd@arndb.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
 Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2014 22:28, Arnd Bergmann wrote:
> On Wednesday 08 January 2014, Boris BREZILLON wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>> @@ -0,0 +1,71 @@
>> +Allwinner NAND Flash Controller (NFC)
>> +
>> +Required properties:
>> +- compatible : "allwinner,sun4i-nfc".
>> +- reg : shall contain registers location and length for data and reg.
>> +- interrupts : shall define the NFC interrupt.
>> +- #address-cells: shall be set to 1. Encode the nand CS.
>> +- #size-cells : shall be set to 0.
>> +- clocks : shall reference NFC clocks.
>> +- clock-names : NFC internal clock names. Shall contain :
>> +    * "ahb_clk" : AHB gating clock
>> +    * "sclk" : NFC clock
>> +
> One small request: Can we try to avoid the "NFC" name here? I think it's
> too overloaded and people may confuse it with near-field communication,
> which I'm sure will be supported in sunxi based devices at some point.
>
> It doesn't hurt to also mention that the function block is called
> nfc, but I think references to it are better named "nand", which is
> less confusing.

Sure, I'll remove references to the NFC acronym:
  - change compatible string to "allwinner,sun4i-nand"
  - avoid NFC references in the doc
  - rename the driver into sunxi-nand.c (formerly sunxi_nfc.c)

Do you see any other references to this acronym ?


Best Regards,

Boris
> 	Arnd
