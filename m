Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJhkK-0004yE-8L
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 13:15:24 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id A4E53203FB
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jan 2016 13:15:02 +0000 (UTC)
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
 [209.85.220.179])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F8822021B
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jan 2016 13:15:01 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id y67so32531997qkc.2
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jan 2016 05:15:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63EBC55@penmbx01>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-4-git-send-email-romain.izard.pro@gmail.com>
 <20160114011252.GA29778@rob-hp-laptop>
 <B256D81BAE5131468A838E5D7A243641D63EBC55@penmbx01>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 Jan 2016 07:14:41 -0600
Message-ID: <CAL_JsqL9kbNYrGYeqT7QCsbMneJbPgoXfaHhCvL8S=t97YaCbg@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: Romain Izard <romain.izard.pro@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Josh Wu <rainyfeeling@outlook.com>,
 "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 7:17 PM, Yang, Wenyou <Wenyou.Yang@atmel.com> wrote=
:
>
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: 2016=E5=B9=B41=E6=9C=8814=E6=97=A5 9:13
>> To: Romain Izard <romain.izard.pro@gmail.com>
>> Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org; Yang, Wen=
you
>> <Wenyou.Yang@atmel.com>; Josh Wu <rainyfeeling@outlook.com>; Ferre,
>> Nicolas <Nicolas.FERRE@atmel.com>
>> Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
>>
>> On Wed, Jan 13, 2016 at 05:34:15PM +0100, Romain Izard wrote:
>> > Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
>> > controller that can correct 32 bits in each sector. This controller is
>> > not 100% compatible with the previous revision that corrected a
>> > maximum of 24 bits by sector, as some register addresses overlap.
>> >
>> > Using information from the device tree, we can configure the driver to
>> > work with both versions.
>> >
>> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
>> > ---
>> >  .../devicetree/bindings/mtd/atmel-nand.txt         |  7 +++++--
>> >  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++=
++++++++-
>> >  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>> >  3 files changed, 33 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> > b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> > index 89b0db9801b0..90887b430f03 100644
>> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> > @@ -1,7 +1,10 @@
>> >  Atmel NAND flash
>> >
>> >  Required properties:
>> > -- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5d4-na=
nd".
>> > +- compatible: The possible values are:
>> > +   "atmel,at91rm9200-nand"
>> > +   "atmel,sama5d2-nand"
>> > +   "atmel,sama5d4-nand"
>> >  - reg : should specify localbus address and size used for the chip,
>> >     and hardware ECC controller if available.
>> >     If the hardware ECC is PMECC, it should contain address and size f=
or
>> > @@ -22,7 +25,7 @@ Optional properties:
>> >    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_=
first",
>> >    "soft_bch".
>> >  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardw=
are.
>> > -  Only supported by at91sam9x5 or later sam9 product.
>> > +  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.
>>
>> What compatible string would AT91SAM9x5 be?
>
> "atmel,at91rm9200-nand".

Answer the question in the binding doc by saying which compatible
strings a property is valid for.

Rob
